import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppOutlinedButtonTheme {
  TAppOutlinedButtonTheme._();

  static final lightModeOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: TAppSizes.zeroElevation,
      foregroundColor: TAppColors.whiteColor,
      backgroundColor: TAppColors.whiteColor,
      side: BorderSide(
        color: TAppColors.greyColor.withOpacity(0.4),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 20,
      ),
      textStyle: const TextStyle(
        color: TAppColors.darkGreyColor,
        fontSize: TAppSizes.fontSizeSm,
        fontWeight: FontWeight.w600,
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

  static final darkModeOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: TAppSizes.zeroElevation,
      foregroundColor: TAppColors.darkGreyColor,
      backgroundColor: TAppColors.darkGreyColor,
      side: BorderSide(
        color: TAppColors.mediumDarkColor.withOpacity(0.4),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 20,
      ),
      textStyle: const TextStyle(
        color: TAppColors.lightColor,
        fontSize: TAppSizes.fontSizeSm,
        fontWeight: FontWeight.w600,
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
