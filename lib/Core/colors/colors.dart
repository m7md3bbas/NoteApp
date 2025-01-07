import 'dart:math';

import 'package:flutter/material.dart';

class MyColors {
  static const Color primaryColor = Color(0xff252525);
  static const Color textColor = Color(0xffFFFFFF);
  static const Color iconBackGroundColor = Color(0xff3B3B3B);
  static const Color textNoteColor = Color(0xff9A9A9A);
  static const Color backgroundtextfieldColor = Color(0xffCCCCCC);
  static const Color backgroundColorItem = Color(0xffFD99FF);
 static Color getRandomColor() {
    final Random random = Random();
    int minColorValue = 100;
    return Color.fromARGB(
      255, // Alpha (opacity)
      minColorValue + random.nextInt(256 - minColorValue), // Red (0-255)
      minColorValue + random.nextInt(256 - minColorValue), // Green (0-255)
      minColorValue + random.nextInt(256 - minColorValue), // Blue (0-255)
    );
  }
}
