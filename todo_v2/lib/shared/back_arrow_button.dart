import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
// import 'package:todo_v2/navigation/bottom_navigation.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.arrow_back_rounded,
        size: TAppSizes.iconLg,
      ),
    );
  }
}
