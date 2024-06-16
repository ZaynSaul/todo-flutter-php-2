import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppElevatedButtonTheme {
  TAppElevatedButtonTheme._();

  static final lightModeElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: TAppSizes.zeroElevation,
      foregroundColor: TAppColors.lightGreyColor,
      backgroundColor: TAppColors.primaryColor,
      disabledForegroundColor: TAppColors.greyColor,
      disabledBackgroundColor: TAppColors.greyColor,
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 20,
      ),
      textStyle: const TextStyle(
        color: TAppColors.lightColor,
        fontSize: TAppSizes.fontSizeSm,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          TAppSizes.borderRadiusLg,
        ),
      ),
      animationDuration: const Duration(
        seconds: 2,
      ),
    ),
  );

  static final darkModeElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: TAppSizes.zeroElevation,
      foregroundColor: TAppColors.mediumDarkColor,
      backgroundColor: TAppColors.primaryColor,
      disabledForegroundColor: TAppColors.greyColor,
      disabledBackgroundColor: TAppColors.greyColor,
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 20,
      ),
      textStyle: const TextStyle(
        color: TAppColors.lightColor,
        fontSize: TAppSizes.fontSizeSm,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          TAppSizes.borderRadiusLg,
        ),
      ),
      animationDuration: const Duration(
        seconds: 2,
      ),
    ),
  );
}
