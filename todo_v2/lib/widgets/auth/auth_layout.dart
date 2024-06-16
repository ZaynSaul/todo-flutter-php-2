import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_images.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode();
    return SizedBox(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: TAppSizes.spaceBetweenItems,
            ),
            child: Column(
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
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
