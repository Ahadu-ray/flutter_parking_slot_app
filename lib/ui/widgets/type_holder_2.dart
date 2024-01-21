import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/shared/theme/app_theme.dart';

class TypeHolder2 extends StatelessWidget {
  final String type;
  final bool includes;
  const TypeHolder2({required this.type, required this.includes, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.primaryColoredRoundedButtonDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(right: 5),
      child: Row(
        children: [
          Icon(
            includes ? Icons.check : Icons.close,
            size: 12,
            color: const Color(0xFF4F4F4F),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            type,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4F4F4F),
            ),
          ),
        ],
      ),
    );
  }
}
