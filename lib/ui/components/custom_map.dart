import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/ui/controller/home_controller.dart';
import 'package:flutter_parking_spot_mobile_app/utils/constants/data_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({Key? key}) : super(key: key);

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap>
    with SingleTickerProviderStateMixin {
  HomeController controller = Get.find();

  Completer<GoogleMapController> mapCompleter = Completer();
  late CameraPosition _initialCameraPosition;

  Set<Marker> currentLocationMarker = {};

  get kCameraZoom => 16.0;

  @override
  void initState() {
    super.initState();

    _setInitialCameraPosition();
  }

  _setInitialCameraPosition() {
    LatLng cameraLocation = kGooglePlex.target;
    _initialCameraPosition = CameraPosition(
      target: cameraLocation,
      zoom: 10,
    );
  }

  _onMapCreated(GoogleMapController mpController) async {
    mapCompleter.complete(mpController);
    controller.mapController = mpController;
    if (!controller.mapCompleter.value.isCompleted) {
      controller.mapCompleter.value.complete(mpController);
    }
    controller.mapController.setMapStyle(controller.mapStyle.value);
    controller.locationService
        .getCurrentPosition()
        .then((currentLocation) async {
      controller.currentLocation =
          LatLng(currentLocation.latitude, currentLocation.longitude);
      controller.mapController.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
          target: controller.currentLocation,
          zoom: kCameraZoom,
        )),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => GoogleMap(
                initialCameraPosition: _initialCameraPosition,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: true,
                compassEnabled: false,
                onMapCreated: (controller) => _onMapCreated(controller),
                markers: controller.markers,
                polylines: controller.polylines,
              )),
          // TODO: Add this back
          // Obx(
          //   () => Positioned(
          //       bottom: controller.stationsToDisplay.isEmpty ? 100 : 340,
          //       right: 10,
          //       child: CircleNav(
          //         icon: Icons.location_searching_outlined,
          //         onTap: () {
          //           controller.animateCameraToCurrentLocation();
          //         },
          //       )),
          // ),
        ],
      ),
    );
  }
}
