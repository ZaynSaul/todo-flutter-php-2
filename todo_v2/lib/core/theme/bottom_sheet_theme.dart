import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppBottomSheetTheme {
  TAppBottomSheetTheme._();

  static BottomSheetThemeData lightModeBottomSheetTheme =
      const BottomSheetThemeData(
    elevation: TAppSizes.zeroElevation,
    backgroundColor: TAppColors.lightColor,
    modalBackgroundColor: TAppColors.secondaryColor,
    surfaceTintColor: TAppColors.transparentColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),
  );

  static BottomSheetThemeData darkModeBottomSheetTheme =
      const BottomSheetThemeData(
    elevation: TAppSizes.zeroElevation,
    backgroundColor: TAppColors.darkGreyColor,
    modalBackgroundColor: TAppColors.whiteColor,
    surfaceTintColor: TAppColors.transparentColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),
  );
}
