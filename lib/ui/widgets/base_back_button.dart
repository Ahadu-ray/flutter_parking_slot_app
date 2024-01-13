import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/shared/theme/app_theme.dart';
import 'package:get/get.dart';

class BaseBackButton extends StatelessWidget {
  const BaseBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Container(
        decoration: AppTheme.borderedButtonDecoration,
        padding: const EdgeInsets.all(5),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}
