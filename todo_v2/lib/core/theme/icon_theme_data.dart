import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppIconTheme {
  TAppIconTheme._();

  static const IconThemeData lightModeIconTheme = IconThemeData(
    color: TAppColors.darkGreyColor,
    size: TAppSizes.iconMd + 4,
  );

  static const IconThemeData darkModeIconTheme = IconThemeData(
    color: TAppColors.lightColor,
    size: TAppSizes.iconMd + 4,
  );
}
