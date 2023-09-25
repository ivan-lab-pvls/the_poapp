import 'package:flutter/material.dart';
import 'package:tradings/app/view/res/my_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primaryContainer: MyColors.lightBlue,
    background: MyColors.white,
    primary: const Color(0xFF124277),
    onPrimary: MyColors.black,
    secondary: MyColors.lightBlue,
    onSecondary: MyColors.grey2,
  ),
);
