import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/screens/change_profile.dart';
import 'package:todo_v2/widgets/setting/setting_tile.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileItem(
      onTap: () {
        Get.to(() => const ChangeProfile());
      },
      icon: Icons.person,
      title: TAppTextStrings.uploadProfileTitle,
      subtitle: TAppTextStrings.uploadProfileDescription,
      trailing: const Icon(
        Icons.chevron_right,
        size: TAppSizes.iconMd,
      ),
    );
  }
}
