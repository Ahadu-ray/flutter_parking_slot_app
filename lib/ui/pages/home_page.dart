// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/ui/components/custom_map.dart';
import 'package:flutter_parking_spot_mobile_app/ui/components/parking_list.dart';
import 'package:flutter_parking_spot_mobile_app/ui/controller/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomMap(),

          Align(alignment: const Alignment(0, 1), child: ParkingAreaList())
          // Align(
          //   alignment: const Alignment(0, 0.7),
          //   child: ParkingAreaList(),
          // ),
          // const Positioned(top: 20, left: 20, child: BaseBackButton()),
        ],
      ),
    );
  }
}
