import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppBarCustomTheme {
  TAppBarCustomTheme._();

  static const AppBarTheme lightModeAppBarTheme = AppBarTheme(
    elevation: TAppSizes.zeroElevation,
    centerTitle: true,
    scrolledUnderElevation: TAppSizes.zeroElevation,
    backgroundColor: TAppColors.secondaryColor,
    shadowColor: TAppColors.smokeColor,
    iconTheme: IconThemeData(
      color: TAppColors.darkGreyColor,
      size: TAppSizes.iconLg,
    ),
    actionsIconTheme: IconThemeData(
      color: TAppColors.darkGreyColor,
      size: TAppSizes.iconLg,
    ),
    titleTextStyle: TextStyle(
      fontSize: TAppSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
      color: TAppColors.darkGreyColor,
    ),
  );

  static AppBarTheme darkModeAppBarTheme = AppBarTheme(
    elevation: TAppSizes.zeroElevation,
    centerTitle: true,
    scrolledUnderElevation: TAppSizes.zeroElevation,
    backgroundColor: TAppColors.darkGreyColor,
    shadowColor: TAppColors.darkGreyColor.withOpacity(0.1),
    iconTheme: const IconThemeData(
      color: TAppColors.lightColor,
      size: TAppSizes.iconLg,
    ),
    actionsIconTheme: const IconThemeData(
      color: TAppColors.lightColor,
      size: TAppSizes.iconLg,
    ),
    titleTextStyle: const TextStyle(
      fontSize: TAppSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
      color: TAppColors.lightColor,
    ),
  );
}
