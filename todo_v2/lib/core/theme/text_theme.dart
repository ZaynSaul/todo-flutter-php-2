import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';

class TAppTextTheme {
  TAppTextTheme._();

  static final TextTheme lightModeTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeXl,
      fontWeight: FontWeight.bold,
      color: TAppColors.darkGreyColor,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeLg,
      fontWeight: FontWeight.w800,
      color: TAppColors.darkGreyColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
      color: TAppColors.darkGreyColor,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeXl,
      fontWeight: FontWeight.bold,
      color: TAppColors.darkGreyColor,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeMd,
      fontWeight: FontWeight.w800,
      color: TAppColors.darkGreyColor,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeSm,
      fontWeight: FontWeight.w600,
      color: TAppColors.darkGreyColor,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeLg,
      fontWeight: FontWeight.normal,
      color: TAppColors.darkGreyColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeMd,
      fontWeight: FontWeight.normal,
      color: TAppColors.darkGreyColor,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeXs,
      fontWeight: FontWeight.w500,
      color: TAppColors.darkGreyColor.withOpacity(0.8),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeMd,
      fontWeight: FontWeight.w700,
      color: TAppColors.darkGreyColor,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeSm,
      fontWeight: FontWeight.w600,
      color: TAppColors.darkGreyColor.withOpacity(0.5),
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeXs,
      fontWeight: FontWeight.w500,
      color: TAppColors.darkGreyColor,
    ),
  );

  static final TextTheme darkModeTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: TAppSizes.fontSizeXl,
        fontWeight: FontWeight.bold,
        color: TAppColors.lightColor),
    headlineMedium: const TextStyle().copyWith(
        fontSize: TAppSizes.fontSizeLg,
        fontWeight: FontWeight.w800,
        color: TAppColors.lightColor),
    headlineSmall: const TextStyle().copyWith(
        fontSize: TAppSizes.fontSizeMd,
        fontWeight: FontWeight.w600,
        color: TAppColors.lightColor),
    titleLarge: const TextStyle().copyWith(
        fontSize: TAppSizes.fontSizeXl,
        fontWeight: FontWeight.normal,
        color: TAppColors.lightColor),
    titleMedium: const TextStyle().copyWith(
        fontSize: TAppSizes.fontSizeMd,
        fontWeight: FontWeight.w800,
        color: TAppColors.lightColor),
    titleSmall: const TextStyle().copyWith(
        fontSize: TAppSizes.fontSizeSm,
        fontWeight: FontWeight.w600,
        color: TAppColors.lightColor),
    bodyLarge: const TextStyle().copyWith(
        fontSize: TAppSizes.fontSizeLg,
        fontWeight: FontWeight.bold,
        color: TAppColors.lightColor),
    bodyMedium: const TextStyle().copyWith(
        fontSize: TAppSizes.fontSizeMd,
        fontWeight: FontWeight.normal,
        color: TAppColors.lightColor),
    bodySmall: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeXs,
      fontWeight: FontWeight.w500,
      color: TAppColors.lightColor.withOpacity(0.8),
    ),
    labelLarge: const TextStyle().copyWith(
        fontSize: TAppSizes.fontSizeMd,
        fontWeight: FontWeight.normal,
        color: TAppColors.lightColor),
    labelMedium: const TextStyle().copyWith(
      fontSize: TAppSizes.fontSizeSm,
      fontWeight: FontWeight.w500,
      color: TAppColors.lightColor.withOpacity(0.5),
    ),
    labelSmall: const TextStyle().copyWith(
        fontSize: TAppSizes.fontSizeXs + 1,
        fontWeight: FontWeight.w500,
        color: TAppColors.lightColor),
  );
}
