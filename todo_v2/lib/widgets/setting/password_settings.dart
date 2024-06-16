import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/screens/change_password.dart';
import 'package:todo_v2/widgets/setting/setting_tile.dart';

class PasswordSettings extends StatelessWidget {
  const PasswordSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileItem(
      onTap: () {
        Get.to(() => const ChangePassword());
      },
      icon: Icons.settings,
      title: TAppTextStrings.passwordSettings,
      subtitle: TAppTextStrings.changePasswordDescription,
      trailing: const Icon(
        Icons.chevron_right,
        size: TAppSizes.iconMd,
      ),
    );
  }
}
