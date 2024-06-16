import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';

class TAppTabBarTheme {
  TAppTabBarTheme._();

  static TabBarTheme lightModeTabBarTheme = const TabBarTheme(
    indicator: BoxDecoration(
      color: TAppColors.primaryColor,
    ),
    indicatorColor: TAppColors.defaultColor,
    labelColor: TAppColors.lightColor,
    labelStyle: TextStyle(color: TAppColors.darkGreyColor),
    unselectedLabelColor: TAppColors.lightGreyColor,
    unselectedLabelStyle: TextStyle(color: TAppColors.greyColor),
  );

  static TabBarTheme darkModeTabBarTheme = const TabBarTheme(
    indicator: BoxDecoration(
      color: TAppColors.primaryColor,
    ),
    indicatorColor: TAppColors.defaultColor,
    labelColor: TAppColors.darkGreyColor,
    labelStyle: TextStyle(color: TAppColors.lightColor),
    unselectedLabelColor: TAppColors.lightGreyColor,
    unselectedLabelStyle: TextStyle(color: TAppColors.lightGreyColor),
  );
}
