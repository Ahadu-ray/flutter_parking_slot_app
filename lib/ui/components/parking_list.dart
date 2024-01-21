import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/ui/components/parking_area_list_card.dart';
import 'package:flutter_parking_spot_mobile_app/ui/controller/home_controller.dart';
import 'package:get/get.dart';

class ParkingAreaList extends StatelessWidget {
  ParkingAreaList({super.key});

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (_homeController.parkingAreas.isEmpty) {
          return const SizedBox();
        } else {
          return Container(
            height: 230,
            margin: const EdgeInsets.only(bottom: 20),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ParkingAreaListCard(
                  parkingArea: _homeController.parkingAreas[index],
                );
              },
              itemCount: _homeController.parkingAreas.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          );
        }
      },
    );
  }
}
