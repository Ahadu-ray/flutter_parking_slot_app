import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/core/models/data_models.dart';
import 'package:flutter_parking_spot_mobile_app/shared/theme/app_theme.dart';
import 'package:flutter_parking_spot_mobile_app/ui/widgets/type_holder.dart';
import 'package:flutter_parking_spot_mobile_app/ui/widgets/type_holder_2.dart';
import 'package:flutter_parking_spot_mobile_app/utils/enums/ui_enums.dart';
import 'package:flutter_parking_spot_mobile_app/utils/extensions/ui_extensions.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ParkingAreaDetail extends StatelessWidget {
  final ParkingAreaModel parkingArea;

  const ParkingAreaDetail({super.key, required this.parkingArea});

  // final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 304,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  parkingArea.name ?? "",
                  style: AppTheme.buttonTitle()
                      .copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              RatingBar.builder(
                initialRating: parkingArea.rating ?? 0.0,
                minRating: 1,
                direction: Axis.horizontal,
                itemSize: 20,
                itemCount: 5,
                unratedColor: Colors.grey,
                itemPadding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Available Spots: ${parkingArea.availableSlots ?? 0}",
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "${parkingArea.pricePerHour ?? 0}Birr/hr ",
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TypeHolder(type: parkingArea.parkingAreaType!.uiName),
            const SizedBox(
              width: 10,
            ),
            TypeHolder(
              type: parkingArea.safety!.uiName,
              color: parkingArea.safety == AreaSafety.safe
                  ? Colors.green
                  : parkingArea.safety == AreaSafety.warning
                      ? Colors.yellow
                      : Colors.red,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 30,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ParkingSlotType.values.length,
            itemBuilder: (context, index) {
              return TypeHolder2(
                type: ParkingSlotType.values[index].uiName,
                includes: parkingArea.parkingSlotTypes!
                    .contains(ParkingSlotType.values[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
