import 'package:flutter/material.dart';

class CustomTextStyles {
  static TextStyle customTextStyle({
    Color? color,
    double fontSize = 16,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    String fontFamily = 'Gilroy',
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration,
        fontFamily: fontFamily,
      );
}
