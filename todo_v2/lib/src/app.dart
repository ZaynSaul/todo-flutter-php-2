import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/mobile/device_utils.dart';
import 'package:todo_v2/core/services/theme_service.dart';
import 'package:todo_v2/core/theme/theme.dart';
import 'package:todo_v2/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThemeController());

    DeviceUtils.setStatusBarColor(Colors.transparent);
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: TAppTextStrings.todoTitle,
        themeMode: controller.themeMode.value == AppTheme.lightModeTheme
            ? ThemeMode.light
            : ThemeMode.dark,
        theme: AppTheme.lightModeTheme,
        darkTheme: AppTheme.darkModeTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
