import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/services/theme_service.dart';
import 'package:todo_v2/core/theme/theme.dart';
import 'package:todo_v2/widgets/setting/setting_tile.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThemeController());

    return Obx(
      () => ListTileItem(
        icon: controller.themeMode.value == AppTheme.darkModeTheme
            ? Icons.light_mode_rounded
            : Icons.dark_mode,
        title: controller.themeMode.value == AppTheme.darkModeTheme
            ? TAppTextStrings.lightMode
            : TAppTextStrings.darkMode,
        subtitle: controller.themeMode.value == AppTheme.darkModeTheme
            ? TAppTextStrings.lightModeDescription
            : TAppTextStrings.darkModeDescription,
        iconColor: TAppColors.darkGreyColor,
        trailing: Switch(
          activeColor: TAppColors.lightColor,
          activeTrackColor: TAppColors.successColor,
          inactiveThumbColor: TAppColors.greyColor,
          inactiveTrackColor: TAppColors.lightGreyColor.withOpacity(0.8),
          value: controller.themeMode.value == AppTheme.darkModeTheme
              ? true
              : false,
          onChanged: (isOn) {
            controller.toggleTheme();
          },
        ),
      ),
    );
  }
}
