import 'package:flutter/material.dart';
import 'package:akaunt_app/constants/colors.dart';

extension CustomColorScheme on ColorScheme {
  Color get iconDrawer => brightness == Brightness.light
      ? const Color(0xFF000000)
      : const Color.fromRGBO(96, 96, 96, 1);
  Color get oppositeColor =>
      brightness == Brightness.light ? Colors.black : Colors.white;
  Color get cardColor => brightness == Brightness.light
      ? AkauntColors.grey
      : const Color(0xFF212121);
  Color get blueOrWhite =>
      brightness == Brightness.light ? AkauntColors.blue : Colors.white;
}
