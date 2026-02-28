import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';

class LocationWidget extends StatelessWidget {
  final String location;

  const LocationWidget({
    super.key,
    required this.location
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      children: [
        SvgPicture.asset(
          "assets/icons/location_icon.svg",
          width: 16.w,
          height: 16.w,
        ),

        gap2,

        Text(
          location,
          style: AppTextStyles.bodyMedium
        )

      ],
    );
  }
}
