import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/profile_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_images.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/env.dart';
import 'package:todo_v2/screens/change_profile.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Obx(
      () => ListTile(
          onTap: () {
            Get.to(
              () => const ChangeProfile(),
            );
          },
          leading: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: TAppColors.greyColor,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(50.0)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: controller.userData.value.profile.isEmpty &&
                      controller.userData.value.profile == ""
                  ? Image.asset(
                      TAppImages.defaultProfile,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    )
                  : Image.network(
                      AppEnvironment.profileBaseURL +
                          controller.userData.value.profile,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          title: Text(
            TAppTextStrings.nameLabel,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          subtitle: Text(
            controller.userData.value.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          trailing: IconButton(
            onPressed: () {
              Get.to(
                () => const ChangeProfile(),
              );
            },
            icon: const Icon(
              Icons.expand_circle_down_rounded,
            ),
          )),
    );
  }
}
