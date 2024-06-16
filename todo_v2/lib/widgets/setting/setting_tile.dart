import 'package:flutter/material.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';
import 'package:todo_v2/core/mobile/device_utils.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    super.key,
    required this.title,
    this.subtitle = "",
    this.icon,
    this.trailing,
    this.onTap,
    this.iconColor = TAppColors.darkGreyColor,
  });

  final String title;
  final String subtitle;
  final IconData? icon;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode();

    return Container(
      width: DeviceUtils.getScreenWidth(),
      decoration: BoxDecoration(
        color: isDarkMode ? TAppColors.darkGreyColor : TAppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1,
          color: isDarkMode
              ? TAppColors.mediumDarkColor.withOpacity(0.4)
              : TAppColors.greyColor.withOpacity(0.4),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: TAppColors.lightGreyColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Icon(
            icon,
            size: 28,
            color: iconColor,
          ),
        ),
        title: buildText(
          context,
          text: title,
          textStyle: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: buildText(
          context,
          text: subtitle,
          textStyle: Theme.of(context).textTheme.labelSmall,
        ),
        trailing: trailing,
      ),
    );
  }

  Widget buildText(BuildContext context,
      {required String text, TextStyle? textStyle}) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
