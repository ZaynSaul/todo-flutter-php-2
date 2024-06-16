import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: isDarkMode
            ? TAppColors.greyColor.shade700
            : TAppColors.greyColor.shade300,
        highlightColor: isDarkMode
            ? TAppColors.greyColor.shade500
            : TAppColors.greyColor.shade100,
        direction: ShimmerDirection.ltr,
        enabled: true,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, int index) => const ListCard(),
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode();
    final borderColor = isDarkMode
        ? TAppColors.greyColor.shade600
        : TAppColors.greyColor.shade400;
    return Container(
      height: 50,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: ListTile(
        leading: Container(
          width: 20.0,
          height: 20.0,
          decoration: const BoxDecoration(
            color: Colors.white, // Placeholder color for the leading checkbox
            shape: BoxShape.circle, // Circular shape for the leading checkbox
          ),
        ),
        title: Container(
          width: double.infinity,
          height: 12.0,
          decoration: BoxDecoration(
            color: Colors.white, // Placeholder color for the title
            borderRadius:
                BorderRadius.circular(1.0), // Rounded corners for the title
          ),
        ),
      ),
    );
  }
}
