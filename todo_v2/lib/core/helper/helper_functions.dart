import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_v2/core/constants/app_colors.dart';

class HelperFunctions {
  static void customDialog({
    required String title,
    String? confirmText,
    Widget? content,
    List<Widget>? actions,
  }) {
    Get.defaultDialog(
      backgroundColor: TAppColors.whiteColor,
      radius: 1.0,
      contentPadding: const EdgeInsets.all(12.0),
      title: title,
      titleStyle: Theme.of(Get.context!).textTheme.titleSmall,
      textConfirm: confirmText,
      content: content,
      actions: actions,
    );
  }

  static void showAlert({
    Widget? icon,
    actions,
    content,
    title,
    bool scrollable = false,
  }) {
    showDialog(
      context: Get.context!,
      builder: (_) {
        return AlertDialog(
          scrollable: scrollable,
          backgroundColor: TAppColors.primaryColor,
          title: title,
          content: content,
          icon: icon,
          actions: actions,
        );
      },
    );
  }

  static void navigateToScreen({required Widget screen}) {
    Get.to(screen);
  }

  static void navigateToScreenByName({required String screenName}) {
    Get.toNamed(screenName);
  }

  static bool isDarkMode() {
    return Theme.of(Get.context!).brightness == Brightness.dark;
  }

  static bool isLightMode() {
    return Theme.of(Get.context!).brightness == Brightness.light;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = "dd - MM - yyyy"}) {
    return DateFormat(format).format(date);
  }

  static String toDateTime(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    final time = DateFormat.Hm().format(dateTime);

    return '$date $time';
  }

  static String toDate(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    return date;
  }

  static String formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  static String toTime(DateTime dateTime) {
    final time = DateFormat.Hm().format(dateTime);
    return time;
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(
    List<Widget> widgets,
    int rowSize,
  ) {
    final wrappedList = <Widget>[];

    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(
        children: rowChildren,
      ));
    }
    return wrappedList;
  }
}
