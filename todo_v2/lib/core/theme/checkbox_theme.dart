import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppCheckboxTheme {
  TAppCheckboxTheme._();

  static CheckboxThemeData lightModeCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TAppSizes.borderRadiusXs),
    ),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TAppColors.primaryColor;
      } else {
        return TAppColors.smokeColor;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TAppColors.primaryColor;
      } else {
        return TAppColors.smokeColor;
      }
    }),
  );

  static CheckboxThemeData darkModeCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TAppSizes.borderRadiusXs),
    ),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TAppColors.primaryColor;
      } else {
        return TAppColors.mediumGreyColor;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TAppColors.primaryColor;
      } else {
        return TAppColors.mediumGreyColor;
      }
    }),
  );
}
