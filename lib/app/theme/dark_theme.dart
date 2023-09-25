import 'package:flutter/material.dart';
import 'package:tradings/app/view/res/my_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primaryContainer: MyColors.whiteTwo,
    background: const Color(0xFF0A2543),
    primary: MyColors.white,
    onPrimary: MyColors.white,
    secondary: MyColors.lightwhite,
    onSecondary: MyColors.grey
  ),
);
