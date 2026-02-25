import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/features/home/presentation/widgets/sections/carousel_section.dart';
import 'package:flutter_task/widgets/app_bar/primary_app_bar.dart';

class HomePage extends HookWidget {

  static String get path => "/home";
  static String get name => "home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              PrimaryAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CarouselSection(),
                      Padding(
                        padding: paddingLeft16,
                        child: Column(
                          children: [

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
