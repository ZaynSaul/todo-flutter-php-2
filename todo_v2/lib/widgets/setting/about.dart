import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/screens/about_screen.dart';
import 'package:todo_v2/widgets/setting/setting_tile.dart';

class About extends StatelessWidget {
  const About({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileItem(
      onTap: () {
        Get.to(() => const AboutScreen());
      },
      icon: Icons.error_outline_rounded,
      title: TAppTextStrings.about,
      subtitle: TAppTextStrings.aboutDescription,
      iconColor: TAppColors.darkGreyColor,
      trailing: const Icon(
        Icons.chevron_right_rounded,
      ),
    );
  }
}
