import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppNavigationBarTheme {
  TAppNavigationBarTheme._();

  static NavigationBarThemeData lightModeNavigationBarTheme =
      NavigationBarThemeData(
    elevation: TAppSizes.zeroElevation,
    height: 80,
    backgroundColor: TAppColors.secondaryColor,
    indicatorColor: TAppColors.lightColor.withOpacity(0.1),
    surfaceTintColor: TAppColors.lightColor,
    labelTextStyle: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return const TextStyle(color: TAppColors.lightColor);
      }
      return const TextStyle(color: TAppColors.lightColor);
    }),
  );

  static NavigationBarThemeData darkModeNavigationBarTheme =
      NavigationBarThemeData(
    elevation: TAppSizes.zeroElevation,
    height: 80,
    backgroundColor: TAppColors.secondaryColor,
    indicatorColor: TAppColors.lightColor.withOpacity(0.1),
    surfaceTintColor: TAppColors.lightColor,
    labelTextStyle: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return const TextStyle(color: TAppColors.lightColor);
      }
      return const TextStyle(color: TAppColors.lightColor);
    }),
  );
}
