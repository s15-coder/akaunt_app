import 'package:akaunt_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'light_text_theme.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  textTheme: lightTextTheme,
  canvasColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((states) => AkauntColors.green),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: Colors.black),
  ),
);
