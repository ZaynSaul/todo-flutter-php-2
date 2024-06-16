import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';
import 'package:todo_v2/widgets/setting/about.dart';
import 'package:todo_v2/widgets/setting/password_settings.dart';
import 'package:todo_v2/widgets/setting/profile_card.dart';
import 'package:todo_v2/widgets/setting/logout.dart';
import 'package:todo_v2/widgets/setting/theme_switch.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          TAppTextStrings.settingTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        elevation: 0,
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: TAppSizes.spaceBetweenItems,
          vertical: TAppSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const ProfileCard(),
            const SizedBox(
              height: TAppSizes.spaceBetweenItems,
            ),
            Divider(
              color: isDarkMode
                  ? TAppColors.mediumDarkColor
                  : TAppColors.mediumGreyColor,
              height: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: const [
                  PasswordSettings(),
                  SizedBox(height: 20),
                  ThemeSwitch(),
                  SizedBox(height: 20),
                  About(),
                  SizedBox(height: 20),
                  LogoutButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
