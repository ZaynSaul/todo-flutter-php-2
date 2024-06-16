import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/theme/app_bar_theme.dart';
import 'package:todo_v2/core/theme/bottom_sheet_theme.dart';
import 'package:todo_v2/core/theme/bottom_navigation_bar_theme.dart';
import 'package:todo_v2/core/theme/checkbox_theme.dart';
import 'package:todo_v2/core/theme/chip_theme.dart';
import 'package:todo_v2/core/theme/date_picker_theme.dart';
import 'package:todo_v2/core/theme/drawer_theme.dart';
import 'package:todo_v2/core/theme/dropdown_form_field_theme.dart';
import 'package:todo_v2/core/theme/elevated_button_theme.dart';
import 'package:todo_v2/core/theme/icon_theme_data.dart';
import 'package:todo_v2/core/theme/list_tile_theme.dart';
import 'package:todo_v2/core/theme/navigation_bar_theme.dart';
import 'package:todo_v2/core/theme/outlined_button_theme.dart';
import 'package:todo_v2/core/theme/switch_theme.dart';
import 'package:todo_v2/core/theme/tab_bar_theme.dart';
import 'package:todo_v2/core/theme/text_field_theme.dart';
import 'package:todo_v2/core/theme/text_theme.dart';
import 'package:todo_v2/core/theme/time_picker_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightModeTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    primaryColor: TAppColors.lightColor,
    brightness: Brightness.light,
    textTheme: TAppTextTheme.lightModeTextTheme,
    scaffoldBackgroundColor: TAppColors.lightColor,
    appBarTheme: TAppBarCustomTheme.lightModeAppBarTheme,
    checkboxTheme: TAppCheckboxTheme.lightModeCheckboxTheme,
    bottomSheetTheme: TAppBottomSheetTheme.lightModeBottomSheetTheme,
    bottomNavigationBarTheme:
        TAppBottomNavigationBarTheme.lightModeBottomNavigationBarTheme,
    navigationBarTheme: TAppNavigationBarTheme.lightModeNavigationBarTheme,
    outlinedButtonTheme: TAppOutlinedButtonTheme.lightModeOutlinedButtonTheme,
    elevatedButtonTheme: TAppElevatedButtonTheme.lightModeElevatedButtonTheme,
    inputDecorationTheme: TAppTextFormFieldTheme.lightModeInputDecorationTheme,
    dropdownMenuTheme:
        TAppDropdownFormFieldTheme.lightModeDropdownMenuThemeData,
    drawerTheme: TAppDrawerTheme.lightModeDrawerTheme,
    iconTheme: TAppIconTheme.lightModeIconTheme,
    chipTheme: TAppChipTheme.lightModeChipTheme,
    tabBarTheme: TAppTabBarTheme.lightModeTabBarTheme,
    switchTheme: TAppSwitchTheme.lightModeSwitchTheme,
    timePickerTheme: TAppTimePickerTheme.lightTimePickerTheme,
    datePickerTheme: TAppDatePickerThemeData.lightModeFAppDatePickerThemeData,
    listTileTheme: TAppListTileTheme.lightModeListTileTheme,
  );

  static ThemeData darkModeTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    primaryColor: TAppColors.darkGreyColor,
    brightness: Brightness.dark,
    textTheme: TAppTextTheme.darkModeTextTheme,
    scaffoldBackgroundColor: TAppColors.darkGreyColor,
    appBarTheme: TAppBarCustomTheme.darkModeAppBarTheme,
    checkboxTheme: TAppCheckboxTheme.darkModeCheckboxTheme,
    bottomSheetTheme: TAppBottomSheetTheme.darkModeBottomSheetTheme,
    bottomNavigationBarTheme:
        TAppBottomNavigationBarTheme.darkModeBottomNavigationBarTheme,
    navigationBarTheme: TAppNavigationBarTheme.darkModeNavigationBarTheme,
    outlinedButtonTheme: TAppOutlinedButtonTheme.darkModeOutlinedButtonTheme,
    elevatedButtonTheme: TAppElevatedButtonTheme.darkModeElevatedButtonTheme,
    inputDecorationTheme: TAppTextFormFieldTheme.darkModeInputDecorationTheme,
    dropdownMenuTheme: TAppDropdownFormFieldTheme.darkModeDropdownMenuThemeData,
    drawerTheme: TAppDrawerTheme.darkModeDrawerTheme,
    iconTheme: TAppIconTheme.darkModeIconTheme,
    chipTheme: TAppChipTheme.darkModeChipTheme,
    tabBarTheme: TAppTabBarTheme.darkModeTabBarTheme,
    switchTheme: TAppSwitchTheme.darkModeSwitchTheme,
    timePickerTheme: TAppTimePickerTheme.darkTimePickerTheme,
    datePickerTheme: TAppDatePickerThemeData.darkModeFAppDatePickerThemeData,
    listTileTheme: TAppListTileTheme.darkModeListTileTheme,
  );
}
