import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/shared/theme/app_theme.dart';

class TypeHolder extends StatelessWidget {
  final String type;
  final Color? color;
  const TypeHolder({required this.type, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.primaryColoredRoundedButtonDecoration()
          .copyWith(color: color),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        type,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF4F4F4F),
        ),
      ),
    );
  }
}
