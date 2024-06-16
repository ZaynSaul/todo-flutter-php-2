import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';

class PreviewImage extends StatelessWidget {
  const PreviewImage({
    super.key,
    this.selectedImage,
  });
  final File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: TAppColors.lightGreyColor,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(500),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(500.0),
        child: Image.file(
          File(selectedImage!.path),
          width: 96,
          height: 96,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
