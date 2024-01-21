import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/shared/theme/app_theme.dart';
import 'package:get/get.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double? width;
  const BaseButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: AppTheme.primaryColoredRoundedButtonDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        width: width ?? Get.width * 0.53,
        child: Text(
          text,
          style: AppTheme.buttonTitle(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
