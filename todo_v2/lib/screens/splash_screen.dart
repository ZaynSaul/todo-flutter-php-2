import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_images.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';
import 'package:todo_v2/core/mobile/device_utils.dart';
import 'package:todo_v2/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode();
    Timer(const Duration(seconds: 5), () {
      Get.off(() => const LoginScreen());
    });

    return Scaffold(
      body: Container(
        width: DeviceUtils.getScreenWidth(),
        height: DeviceUtils.getScreenHeight(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isDarkMode
                  ? TAppImages.splashScreenDark
                  : TAppImages.splashScreenLight,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: TAppColors.darkGreyColor.withOpacity(0.1),
            color: TAppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
