import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/core/constants/app_colors.dart';

class MessageAlert {
  MessageAlert._();

  static errorSnackBar(String message) {
    Get.snackbar(
      "Oops!",
      message,
      duration: const Duration(seconds: 2),
      backgroundColor: TAppColors.dangerColor,
      snackPosition: SnackPosition.TOP,
      icon: const Icon(
        Icons.info_outline_rounded,
        color: TAppColors.lightColor,
      ),
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 25.0,
      ),
      colorText: TAppColors.lightColor,
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static warningSnackBar(String message) {
    Get.snackbar(
      "Warning!",
      message,
      duration: const Duration(seconds: 2),
      backgroundColor: TAppColors.warningColor,
      snackPosition: SnackPosition.TOP,
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: TAppColors.lightColor,
      ),
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 25.0,
      ),
      colorText: TAppColors.lightColor,
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static showSuccessMessage(String message) {
    Get.snackbar(
      "Success!",
      message,
      duration: const Duration(seconds: 2),
      backgroundColor: TAppColors.successColor,
      snackPosition: SnackPosition.TOP,
      icon: const Icon(
        Icons.check_rounded,
        color: TAppColors.lightColor,
      ),
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 25.0,
      ),
      colorText: TAppColors.lightColor,
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
