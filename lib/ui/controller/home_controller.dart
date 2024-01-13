import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/core/models/data_models.dart';
import 'package:flutter_parking_spot_mobile_app/core/repositories/home_repositories.dart';
import 'package:flutter_parking_spot_mobile_app/core/services/location_service.dart';
import 'package:flutter_parking_spot_mobile_app/utils/enums/ui_enums.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;
  LocationService locationService;
  HomeController({required this.homeRepository, required this.locationService});

  @override
  Future<void> onInit() async {
    super.onInit();
    await getCurrentLocation();
    getClosestTowns();
  }

  var closeParkingAreas = <ParkingAreaModel>[].obs;
  var closeTowns = <TownDetailModel>[].obs;
  var selectedTown = Rxn<TownDetailModel>();

  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  var currentLocation = Rxn<Position>();
  var markers = <Marker>{}.obs;
  var circles = <Circle>{}.obs;

  StreamSubscription<Position>? liveLocationStream;

  Future<Position?> getCurrentLocation() async {
    currentLocation.value = await locationService.getCurrentPosition();
    _updateCurrentLocationMarker();
    mapController.future.then((value) => value.animateCamera(
        CameraUpdate.newLatLngZoom(
            LatLng(currentLocation.value!.latitude,
                currentLocation.value!.longitude),
            15)));
    streamLocation();
    return currentLocation.value;
  }

  void streamLocation() {
    liveLocationStream = locationService.getLiveLocation().listen((event) {
      log("new location");
      currentLocation.value = event;
      _updateCurrentLocationMarker();
    });
  }

  void _updateCurrentLocationMarker() {
    markers.removeWhere((element) =>
        element.markerId.value == ConstantMarkerIds.currentLocationMarker.name);
    markers.add(Marker(
      markerId: MarkerId(ConstantMarkerIds.currentLocationMarker.name),
      position: LatLng(
          currentLocation.value!.latitude, currentLocation.value!.longitude),
    ));
  }

  getClosestTowns() async {
    closeTowns.value =
        await homeRepository.getNearbyTowns(currentLocation.value!);
    circles.clear();
    var temp = <Circle>{};
    closeTowns.forEach((element) {
      temp.add(Circle(
        circleId: CircleId(element.id),
        center: LatLng(element.latitude!, element.longitude!),
        radius: element.radius!,
        fillColor: element.safety == AreaSafety.danger
            ? Colors.red.withOpacity(0.5)
            : element.safety == AreaSafety.warning
                ? Colors.yellow.withOpacity(0.5)
                : Colors.green.withOpacity(0.5),
        strokeWidth: 1,
        strokeColor: Colors.black.withOpacity(0.5),
        onTap: () {
          Get.snackbar("Parking Area", "You are in parking area",
              snackPosition: SnackPosition.BOTTOM);
        },
      ));
      log("temp: $temp");
      circles.addAll(temp);
    });
  }

  onSelectTown() {}

  @override
  void onClose() {
    liveLocationStream?.cancel();
    super.onClose();
  }
}
