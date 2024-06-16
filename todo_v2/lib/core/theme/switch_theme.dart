import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';

class TAppSwitchTheme {
  TAppSwitchTheme._();

  static final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return TAppColors.smokeColor;
      }

      return null;
    },
  );

  static SwitchThemeData lightModeSwitchTheme = SwitchThemeData(
    trackColor: trackColor,
    trackOutlineWidth: MaterialStateProperty.all(0),
    trackOutlineColor: const MaterialStatePropertyAll<Color>(
      TAppColors.lightGreyColor,
    ),
    thumbColor: const MaterialStatePropertyAll<Color>(
      TAppColors.secondaryColor,
    ),
  );

  static SwitchThemeData darkModeSwitchTheme = SwitchThemeData(
    trackColor: trackColor,
    trackOutlineWidth: MaterialStateProperty.all(0),
    trackOutlineColor: const MaterialStatePropertyAll<Color>(
      TAppColors.darkGreyColor,
    ),
    thumbColor: const MaterialStatePropertyAll<Color>(
      TAppColors.secondaryColor,
    ),
  );
}
