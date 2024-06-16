import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppTextFormFieldTheme {
  TAppTextFormFieldTheme._();

  static InputDecorationTheme lightModeInputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: TAppColors.whiteColor,
    errorMaxLines: 3,
    prefixIconColor: TAppColors.greyColor,
    suffixIconColor: TAppColors.greyColor,
    contentPadding: const EdgeInsets.all(TAppSizes.md),
    labelStyle: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeSm,
      color: TAppColors.darkGreyColor,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeSm,
      color: TAppColors.greyColor,
    ),
    errorStyle: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeSm,
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TAppColors.darkGreyColor,
    ),
    border: InputBorder.none,
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        width: TAppSizes.lineHeight,
        color: TAppColors.greyColor,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        width: TAppSizes.lineHeight,
        color: TAppColors.defaultColor,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        width: TAppSizes.lineHeight,
        color: TAppColors.dangerColor,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        width: TAppSizes.lineHeight,
        color: TAppColors.dangerColor,
      ),
    ),
  );

  static InputDecorationTheme darkModeInputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: TAppColors.mediumDarkColor.withOpacity(0.1),
    errorMaxLines: 3,
    prefixIconColor: TAppColors.mediumGreyColor,
    suffixIconColor: TAppColors.mediumGreyColor,
    contentPadding: const EdgeInsets.all(TAppSizes.md),
    labelStyle: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeSm,
      color: TAppColors.lightGreyColor,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeSm,
      color: TAppColors.lightColor,
    ),
    errorStyle: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeSm,
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TAppColors.lightColor,
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        width: TAppSizes.lineHeight,
        color: TAppColors.mediumDarkColor,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        width: TAppSizes.lineHeight,
        color: TAppColors.greyColor,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        width: TAppSizes.lineHeight,
        color: TAppColors.defaultColor,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        width: TAppSizes.lineHeight,
        color: TAppColors.dangerColor,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        width: TAppSizes.lineHeight,
        color: TAppColors.dangerColor,
      ),
    ),
  );
}
