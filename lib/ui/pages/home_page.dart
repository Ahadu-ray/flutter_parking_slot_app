// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/ui/controller/home_controller.dart';
import 'package:flutter_parking_spot_mobile_app/ui/widgets/base_back_button.dart';
import 'package:flutter_parking_spot_mobile_app/utils/constants/data_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => GoogleMap(
              initialCameraPosition: kGooglePlex,
              markers: controller.markers.value,
              circles: controller.circles.value,
              onMapCreated: (GoogleMapController mapController) {
                controller.mapController.complete(mapController);
              },
            ),
          ),
          const Positioned(top: 20, left: 20, child: BaseBackButton()),
        ],
      ),
    );
  }
}
