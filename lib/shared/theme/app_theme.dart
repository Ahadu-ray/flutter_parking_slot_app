import 'package:flutter/material.dart';

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
}
