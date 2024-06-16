import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';
import 'package:todo_v2/core/mobile/device_utils.dart';
import 'package:todo_v2/core/services/message.alert.dart';
import 'package:todo_v2/screens/login_screen.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceUtils.getScreenWidth(),
      child: OutlinedButton(
        onPressed: () {
          _showConfirmationDialog();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.logout_rounded,
              color: TAppColors.mediumGreyColor,
            ),
            const SizedBox(
              width: 6.0,
            ),
            Text(
              TAppTextStrings.logoutButton,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog() {
    final isDarkMode = HelperFunctions.isDarkMode();
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor:
              isDarkMode ? TAppColors.darkGreyColor : TAppColors.whiteColor,
          title: Text(
            TAppTextStrings.logoutConfirmationTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          content: Text(
            TAppTextStrings.logoutConfirmation,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
              onPressed: () {
                Get.offAll(() => const LoginScreen());
                MessageAlert.showSuccessMessage(TAppTextStrings.successLogout);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                TAppColors.successColor.withOpacity(0.4),
              )),
              child: Text(
                TAppTextStrings.yesButton,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: TAppColors.successColor),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                TAppColors.dangerColor.withOpacity(0.4),
              )),
              child: Text(
                TAppTextStrings.cancelButton,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: TAppColors.dangerColor,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}
