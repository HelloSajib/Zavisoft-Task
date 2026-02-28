import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/widgets/buttons/custom_icon_button.dart';
import 'package:flutter_task/widgets/location_widget.dart';

/// The main app bar for the application.
class PrimaryAppBar extends HookWidget {
  const PrimaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    // Defines the app bar's layout and widgets.
    return Container(
      width: 1.sw,
      padding: padding16,
      child: Row(
        children: [

          ClipRRect(
            borderRadius: radiusCircle,
            child: Image.asset(
              "assets/dummy/profile_img.png",
              width: 50.w,
              height: 50.w,
            ),
          ),

          gap6,

          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                "Jenny Wilson",
                style: AppTextStyles.titleMedium,
              ),

              LocationWidget(
                  location: "San Diego, CA"
              )

            ],
          ),

          const Spacer(),

          CustomIconButton(
              onPressed: (){},
              iconPath: "assets/icons/search_icon.svg"
          ),
          gap12,
          CustomIconButton(
              onPressed: (){},
              iconPath: "assets/icons/notification_icon.svg"
          ),

        ],
      ),
    );
  }
}
