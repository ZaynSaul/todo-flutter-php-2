import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppDatePickerThemeData {
  TAppDatePickerThemeData._();

  static const DatePickerThemeData lightModeFAppDatePickerThemeData =
      DatePickerThemeData(
    backgroundColor: TAppColors.lightColor,
    headerBackgroundColor: TAppColors.secondaryColor,
    elevation: TAppSizes.zeroElevation,
    headerHeadlineStyle: TextStyle(
      fontSize: TAppSizes.fontSizeLg,
      color: TAppColors.lightColor,
      fontWeight: FontWeight.w700,
    ),
    weekdayStyle: TextStyle(
      fontSize: TAppSizes.fontSizeMd,
      color: TAppColors.greyColor,
      fontWeight: FontWeight.w700,
    ),
    dayStyle: TextStyle(
      fontSize: TAppSizes.fontSizeSm,
      color: TAppColors.darkGreyColor,
      fontWeight: FontWeight.w500,
    ),
    yearStyle: TextStyle(
      fontSize: TAppSizes.fontSizeLg,
      color: TAppColors.secondaryColor,
      fontWeight: FontWeight.w600,
    ),
  );

  static const DatePickerThemeData darkModeFAppDatePickerThemeData =
      DatePickerThemeData(
    backgroundColor: TAppColors.mediumDarkColor,
    headerBackgroundColor: TAppColors.secondaryColor,
    elevation: TAppSizes.zeroElevation,
    headerHeadlineStyle: TextStyle(
      fontSize: TAppSizes.fontSizeLg,
      color: TAppColors.darkGreyColor,
      fontWeight: FontWeight.w700,
    ),
    weekdayStyle: TextStyle(
      fontSize: TAppSizes.fontSizeMd,
      color: TAppColors.smokeColor,
      fontWeight: FontWeight.w700,
    ),
    dayStyle: TextStyle(
      fontSize: TAppSizes.fontSizeSm,
      color: TAppColors.primaryColor,
      fontWeight: FontWeight.w500,
    ),
    yearStyle: TextStyle(
      fontSize: TAppSizes.fontSizeLg,
      color: TAppColors.darkGreyColor,
      fontWeight: FontWeight.w600,
    ),
  );
}
