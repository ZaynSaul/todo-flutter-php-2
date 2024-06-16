import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';
import 'package:todo_v2/screens/home_screen.dart';
import 'package:todo_v2/screens/settings_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    late PersistentTabController controller;
    final isDarkMode = HelperFunctions.isDarkMode();

    controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: TAppColors.primaryColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0),
        colorBehindNavBar: isDarkMode
            ? TAppColors.mediumDarkColor.withOpacity(0.5)
            : TAppColors.whiteColor,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const SettingScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard),
        inactiveIcon: const Icon(Icons.dashboard_outlined),
        title: ("Home"),
        activeColorPrimary: TAppColors.pinkColor,
        inactiveColorPrimary: TAppColors.lightGreyColor,
        textStyle: Theme.of(Get.context!).textTheme.labelSmall!.apply(
              color: TAppColors.primaryColor,
            ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        inactiveIcon: const Icon(Icons.settings_outlined),
        title: ("Settings"),
        activeColorPrimary: TAppColors.pinkColor,
        inactiveColorPrimary: TAppColors.lightGreyColor,
        textStyle: Theme.of(Get.context!).textTheme.labelSmall!.apply(
              color: TAppColors.primaryColor,
            ),
      ),
    ];
  }
}
