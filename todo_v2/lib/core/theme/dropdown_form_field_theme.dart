import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppDropdownFormFieldTheme {
  TAppDropdownFormFieldTheme._();

  static DropdownMenuThemeData lightModeDropdownMenuThemeData =
      DropdownMenuThemeData(
    textStyle: const TextStyle(
      fontSize: TAppSizes.fontSizeXs,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: TAppColors.mediumGreyColor,
      errorMaxLines: 3,
      prefixIconColor: TAppColors.greyColor,
      suffixIconColor: TAppColors.greyColor,
      contentPadding: const EdgeInsets.all(20.0),
      labelStyle: const TextStyle().copyWith(
        fontSize: TAppSizes.fontSizeXs,
        color: TAppColors.secondaryColor,
      ),
      errorStyle: const TextStyle().copyWith(
        fontStyle: FontStyle.normal,
      ),
      floatingLabelStyle: const TextStyle().copyWith(
        color: TAppColors.secondaryColor.withOpacity(0.8),
      ),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(TAppSizes.borderRadiusLg),
        borderSide: const BorderSide(
          width: TAppSizes.lineHeight,
          color: TAppColors.mediumGreyColor,
        ),
      ),
      enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(TAppSizes.borderRadiusLg),
        borderSide: const BorderSide(
          width: TAppSizes.lineHeight,
          color: TAppColors.primaryColor,
        ),
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(TAppSizes.borderRadiusLg),
        borderSide: const BorderSide(
          width: TAppSizes.lineHeight,
          color: TAppColors.defaultColor,
        ),
      ),
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(TAppSizes.borderRadiusLg),
        borderSide: const BorderSide(
          width: TAppSizes.lineHeight,
          color: TAppColors.dangerColor,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(TAppSizes.borderRadiusLg),
        borderSide: const BorderSide(
          width: TAppSizes.lineHeight,
          color: TAppColors.whiteColor,
        ),
      ),
    ),
  );

  static DropdownMenuThemeData darkModeDropdownMenuThemeData =
      DropdownMenuThemeData(
          textStyle: const TextStyle(
            fontSize: TAppSizes.fontSizeXs,
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: TAppColors.darkGreyColor.withOpacity(0.4),
            errorMaxLines: 3,
            prefixIconColor: TAppColors.greyColor,
            suffixIconColor: TAppColors.greyColor,
            contentPadding: const EdgeInsets.all(20.0),
            labelStyle: const TextStyle().copyWith(
              fontSize: TAppSizes.fontSizeXs,
              color: TAppColors.darkGreyColor,
            ),
            errorStyle: const TextStyle().copyWith(
              fontStyle: FontStyle.normal,
            ),
            floatingLabelStyle: const TextStyle().copyWith(
              color: TAppColors.darkGreyColor.withOpacity(0.8),
            ),
            border: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(TAppSizes.borderRadiusLg),
              borderSide: const BorderSide(
                width: TAppSizes.lineHeight,
                color: TAppColors.greyColor,
              ),
            ),
            enabledBorder: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(TAppSizes.borderRadiusLg),
              borderSide: const BorderSide(
                width: TAppSizes.lineHeight,
                color: TAppColors.primaryColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(TAppSizes.borderRadiusLg),
              borderSide: const BorderSide(
                width: TAppSizes.lineHeight,
                color: TAppColors.defaultColor,
              ),
            ),
            errorBorder: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(TAppSizes.borderRadiusLg),
              borderSide: const BorderSide(
                width: TAppSizes.lineHeight,
                color: TAppColors.dangerColor,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(TAppSizes.borderRadiusLg),
              borderSide: const BorderSide(
                width: TAppSizes.lineHeight,
                color: TAppColors.greyColor,
              ),
            ),
          ));
}
