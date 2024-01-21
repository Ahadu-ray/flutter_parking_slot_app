import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/core/models/data_models.dart';
import 'package:flutter_parking_spot_mobile_app/shared/theme/app_theme.dart';
import 'package:flutter_parking_spot_mobile_app/ui/components/parking_area_detail.dart';
import 'package:flutter_parking_spot_mobile_app/ui/widgets/base_button.dart';

class ParkingAreaListCard extends StatelessWidget {
  final ParkingAreaModel parkingArea;

  const ParkingAreaListCard({super.key, required this.parkingArea});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.parkingCardDecoration(),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 17),
      margin: const EdgeInsets.only(left: 10),
      width: 328,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ParkingAreaDetail(parkingArea: parkingArea),
          const SizedBox(
            height: 25,
          ),
          BaseButton(
            text: "Locate",
            onPressed: () {},
            width: 190,
          ),
        ],
      ),
    );
  }
}
