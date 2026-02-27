import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/buttons/primary_button.dart';
import 'package:flutter_task/widgets/text_forms/primary_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter_task/features/home/presentation/pages/home_page.dart';

class SignInFormSection extends StatelessWidget {
  const SignInFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryTextFormField(
          title: "Email",
          hintText: "Enter your email",
          textInputType: TextInputType.emailAddress,
        ),
        gap12,
        PrimaryTextFormField(
          title: "Password",
          hintText: "Enter your password",
          textInputType: TextInputType.visiblePassword,
        ),

        gap28,

        PrimaryButton(
          onPressed: ()=> context.go(HomePage.path),
          text: "Sign In",
        ),

      ],
    );
  }
}
