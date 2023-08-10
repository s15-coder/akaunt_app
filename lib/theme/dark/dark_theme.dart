import 'package:akaunt_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dark_text_theme.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AkauntColors.green,
  textTheme: darkTextTheme,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith(
      (states) => AkauntColors.green,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(
      color: AkauntColors.green,
    ),
  ),
);
