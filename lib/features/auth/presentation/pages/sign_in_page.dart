import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/features/auth/presentation/widgets/sections/forms/sign_in_form_section.dart';
import 'package:flutter_task/features/auth/presentation/widgets/sections/headers/sign_in_header_section.dart';

class SignInPage extends StatelessWidget {

  static String get path => "/sign-in";
  static String get name => "sign-in";

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: padding24,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SignInHeaderSection(),
                gap24,
                SignInFormSection(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
