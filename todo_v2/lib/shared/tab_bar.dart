import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/tab_bar_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';
import 'package:todo_v2/core/mobile/device_utils.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode();
    final tabController = Get.put(TabBarController());

    return Material(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: TabBar(
        controller: tabController.tabController,
        tabs: tabs,
        isScrollable: true,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor:
            isDarkMode ? TAppColors.lightGreyColor : TAppColors.darkGreyColor,
        unselectedLabelColor:
            isDarkMode ? TAppColors.lightGreyColor : TAppColors.darkGreyColor,
        indicator: UnderlineTabIndicator(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 3.0,
            color:
                TAppColors.primaryColor, // Customize the indicator color here
          ),
          // Adjust insets as needed
        ),
        labelStyle: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
