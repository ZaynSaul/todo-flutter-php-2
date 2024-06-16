import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.bWidth = 30,
    this.bHeight = 30,
    this.width = 30,
    this.height = 30,
    this.borderRadius = 200,
    required this.image,
    this.isNetworkImage = false,
    this.isFile = false,
  });

  final double width, height, borderRadius, bWidth, bHeight;
  final String image;

  final bool isNetworkImage, isFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bHeight,
      width: bWidth,
      margin: const EdgeInsets.only(right: 10, left: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: TAppColors.greyColor,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: isNetworkImage == false
            ? Image.asset(
                height: height,
                width: width,
                image,
                fit: BoxFit.cover,
              )
            : Image(
                height: height,
                width: width,
                image: NetworkImage(
                  image,
                  scale: 1.0,
                ),
              ),
      ),
    );
  }
}
