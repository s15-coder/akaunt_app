import 'package:flutter/material.dart';

class Headings {
  static TextStyle get h1 => const TextStyle(
        fontSize: 55,
        fontWeight: FontWeight.w400,
        height: .9,
        fontFamily: 'San Francisco',
        color: Colors.black,
      );
  static TextStyle get h5 => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  static TextStyle get title => const TextStyle(
        fontSize: 26,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
}
