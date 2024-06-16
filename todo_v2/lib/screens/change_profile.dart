import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/profile_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';
import 'package:todo_v2/env.dart';
import 'package:todo_v2/shared/back_arrow_button.dart';
import 'package:todo_v2/shared/circular_image.dart';
import 'package:todo_v2/widgets/setting/preview_image.dart';

class ChangeProfile extends StatelessWidget {
  const ChangeProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode();
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackArrowButton(
          onTap: () {
            Get.back();
          },
        ),
        elevation: 0,
        title: Text(
          TAppTextStrings.uploadProfileTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        child: Center(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    if (controller.selectedImage.value != null) ...[
                      PreviewImage(
                        selectedImage: controller.selectedImage.value,
                      )
                    ] else ...[
                      controller.userData.value.profile.isEmpty &&
                              controller.userData.value.profile == ""
                          ? const CircularImage(
                              bWidth: 100,
                              bHeight: 100,
                              image: "assets/images/profile.jpg",
                              width: 96,
                              height: 96,
                            )
                          : CircularImage(
                              bWidth: 100,
                              bHeight: 100,
                              isNetworkImage: true,
                              image: AppEnvironment.profileBaseURL +
                                  controller.userData.value.profile,
                              width: 96,
                              height: 96,
                            ),
                    ],
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: TAppColors.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              showImagePicker(controller);
                            },
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: TAppColors.whiteColor,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    if (controller.selectedImage.value != null) {
                      controller.uploadProfile();
                    } else {
                      _validateUpload();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      isDarkMode
                          ? TAppColors.lightGreyColor
                          : TAppColors.darkGreyColor,
                    ),
                  ),
                  child: Text(
                    TAppTextStrings.saveButton,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: isDarkMode
                              ? TAppColors.darkGreyColor
                              : TAppColors.lightGreyColor,
                        ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: ListView(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: const Text(
                          TAppTextStrings.nameLabel,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        subtitle: Text(
                          controller.userData.value.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showImagePicker(ProfileController controller) {
    final isDarkMode = HelperFunctions.isDarkMode();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      isScrollControlled: true,
      builder: (builder) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          decoration: BoxDecoration(
            color:
                isDarkMode ? TAppColors.darkGreyColor : TAppColors.lightColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: SizedBox(
            width: HelperFunctions.screenWidth(),
            height: HelperFunctions.screenHeight() / 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Profile photo",
                      style: TextStyle(fontSize: 20),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(Get.context!).pop(),
                      child: const Icon(
                        Icons.cancel,
                        color: TAppColors.dangerColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    camera(controller),
                    gallery(controller),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget camera(ProfileController controller) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(width: 1, color: TAppColors.greyColor)),
      child: Center(
        child: IconButton(
          onPressed: () {
            controller.pickImageFromCamera();
            Get.back();
          },
          icon: const Icon(Icons.camera_alt_outlined, size: 35),
        ),
      ),
    );
  }

  Widget gallery(ProfileController controller) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(width: 1, color: TAppColors.greyColor)),
      child: Center(
        child: IconButton(
          onPressed: () {
            controller.pickImageFromGallery();
            Get.back();
          },
          icon: const Icon(Icons.photo, size: 35),
        ),
      ),
    );
  }

  void _validateUpload() {
    final isDarkMode = HelperFunctions.isDarkMode();
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor:
              isDarkMode ? TAppColors.darkGreyColor : TAppColors.whiteColor,
          title: const Text('Error'),
          content: Text(
            'Please select an image, to upload!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TAppColors.dangerColor),
          ),
          actionsAlignment: MainAxisAlignment.end,
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  TAppColors.primaryColor.withOpacity(0.4),
                ),
              ),
              child: Text(
                "Ok",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: TAppColors.primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
