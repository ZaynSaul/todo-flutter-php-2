// ,

import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';

class TAppListTileTheme {
  TAppListTileTheme._();

  static ListTileThemeData lightModeListTileTheme = const ListTileThemeData(
    tileColor: TAppColors.whiteColor,
    shape: OutlineInputBorder(
      borderSide: BorderSide(color: TAppColors.lightGreyColor),
    ),
  );

  static ListTileThemeData darkModeListTileTheme = const ListTileThemeData(
    tileColor: TAppColors.darkGreyColor,
    shape: OutlineInputBorder(
      borderSide: BorderSide(color: TAppColors.mediumDarkColor),
    ),
  );
}
