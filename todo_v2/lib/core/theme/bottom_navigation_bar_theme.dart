import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppBottomNavigationBarTheme {
  TAppBottomNavigationBarTheme._();

  static BottomNavigationBarThemeData lightModeBottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    elevation: TAppSizes.zeroElevation,
    selectedIconTheme: const IconThemeData(
      color: TAppColors.primaryColor,
      size: TAppSizes.iconMd + 1,
    ),
    backgroundColor: TAppColors.lightColor,
    selectedItemColor: TAppColors.primaryColor,
    unselectedItemColor: TAppColors.lightGreyColor,
    selectedLabelStyle: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeXs,
      color: TAppColors.primaryColor,
    ),
    unselectedLabelStyle: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeXs,
      color: TAppColors.darkGreyColor,
    ),
  );

  static BottomNavigationBarThemeData darkModeBottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    elevation: TAppSizes.zeroElevation,
    selectedIconTheme: const IconThemeData(
      color: TAppColors.primaryColor,
      size: TAppSizes.iconMd + 1,
    ),
    backgroundColor: TAppColors.mediumDarkColor,
    selectedItemColor: TAppColors.primaryColor,
    unselectedItemColor: TAppColors.lightGreyColor,
    selectedLabelStyle: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeXs,
      color: TAppColors.primaryColor,
    ),
    unselectedLabelStyle: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeXs,
      color: TAppColors.lightColor,
    ),
  );
}
