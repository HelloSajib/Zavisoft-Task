import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final double? iconSize;
  final EdgeInsets? iconPadding;
  final Color? fillColor;
  final VoidCallback? onPressed;

  const CustomIconButton({
    super.key,
    this.iconPadding,
    this.fillColor,
    this.iconSize,
    this.onPressed,
    required this.iconPath,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: iconPadding,
      decoration: BoxDecoration(
        color: fillColor,
          shape: BoxShape.circle,
          border: Border.all(
              width: 1.5.w,
              color: fillColor ?? AppColors.greyLight
          )
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          iconPath,
          width: iconSize ?? 20.w,
          height: iconSize ?? 20.w,
          colorFilter: ColorFilter.mode(
            AppColors.grey,
            BlendMode.srcIn
          ),
        ),
      ),
    );
  }
}
