import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static BoxDecoration get borderedButtonDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      );

  static BoxDecoration parkingCardDecoration({Color? color}) => BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 33,
                offset: const Offset(2, 12),
                color: const Color(0xFF262C2B).withOpacity(0.17))
          ]);

  static BoxDecoration primaryColoredRoundedButtonDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 33,
              offset: const Offset(2, 12),
              color: const Color(0xFF262C2B).withOpacity(0.17))
        ],
      );

  static TextStyle buttonTitle() => GoogleFonts.rubik(
        fontSize: 16,
        color: Colors.black87,
        fontWeight: FontWeight.w400,
      );
}
