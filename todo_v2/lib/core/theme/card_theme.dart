import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppCardTheme {
  TAppCardTheme._();

  static const CardTheme lightModeCardTheme = CardTheme(
      elevation: TAppSizes.zeroElevation,
      color: TAppColors.lightColor,
      margin: EdgeInsets.all(TAppSizes.md));

  static const CardTheme darkModeCardTheme = CardTheme(
      elevation: TAppSizes.zeroElevation,
      color: TAppColors.mediumDarkColor,
      margin: EdgeInsets.all(TAppSizes.md));
}
