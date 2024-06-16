import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppDrawerTheme {
  TAppDrawerTheme._();

  static const DrawerThemeData lightModeDrawerTheme = DrawerThemeData(
    elevation: TAppSizes.zeroElevation,
    backgroundColor: TAppColors.lightColor,
  );

  static const DrawerThemeData darkModeDrawerTheme = DrawerThemeData(
    elevation: TAppSizes.zeroElevation,
    backgroundColor: TAppColors.darkGreyColor,
  );
}
