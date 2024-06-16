import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/core/constants/app_images.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';
import 'package:todo_v2/shared/back_arrow_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackArrowButton(
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          TAppTextStrings.aboutTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isDarkMode) ...[
                  const Image(
                    image: AssetImage(TAppImages.logoLight),
                    width: 200,
                    height: 100,
                  ),
                ] else ...[
                  const Image(
                    image: AssetImage(TAppImages.logoDark),
                    width: 200,
                    height: 100,
                  ),
                ],
                Text(
                  "Version 1.1",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
