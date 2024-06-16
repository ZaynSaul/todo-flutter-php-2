import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';

class TAppChipTheme {
  TAppChipTheme._();

  static ChipThemeData lightModeChipTheme = ChipThemeData(
    disabledColor: TAppColors.greyColor.withOpacity(0.5),
    labelStyle: const TextStyle(
      color: TAppColors.secondaryColor,
    ),
    selectedColor: TAppColors.successColor,
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12.0,
    ),
    checkmarkColor: TAppColors.smokeColor,
  );

  static ChipThemeData darkModeChipTheme = ChipThemeData(
    disabledColor: TAppColors.greyColor.withOpacity(0.5),
    labelStyle: const TextStyle(
      color: TAppColors.darkGreyColor,
    ),
    selectedColor: TAppColors.successColor,
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12.0,
    ),
    checkmarkColor: TAppColors.smokeColor,
  );
}
