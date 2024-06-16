import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppTimePickerTheme {
  TAppTimePickerTheme._();

  static TimePickerThemeData lightTimePickerTheme = TimePickerThemeData(
    elevation: TAppSizes.zeroElevation,
    hourMinuteColor: TAppColors.secondaryColor,
    dialHandColor: TAppColors.secondaryColor,
    backgroundColor: TAppColors.primaryColor,
    dialBackgroundColor: const Color(0xffF2F9FE),
    hourMinuteTextColor: TAppColors.primaryColor,
    dayPeriodBorderSide: const BorderSide(
      color: TAppColors.secondaryColor,
    ),
    cancelButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
      TAppColors.dangerColor,
    )),
    confirmButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
      TAppColors.primaryColor,
    )),
  );

  static TimePickerThemeData darkTimePickerTheme = TimePickerThemeData(
    elevation: TAppSizes.zeroElevation,
    hourMinuteColor: TAppColors.mediumDarkColor,
    dialHandColor: TAppColors.mediumDarkColor,
    backgroundColor: TAppColors.primaryColor,
    dialBackgroundColor: const Color(0xffF2F9FE),
    hourMinuteTextColor: TAppColors.primaryColor,
    dayPeriodBorderSide: const BorderSide(
      color: TAppColors.secondaryColor,
    ),
    cancelButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
      TAppColors.dangerColor,
    )),
    confirmButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
      TAppColors.primaryColor,
    )),
  );
}
