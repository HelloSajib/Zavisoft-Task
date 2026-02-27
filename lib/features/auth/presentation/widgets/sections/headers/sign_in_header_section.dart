import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';

class SignInHeaderSection extends StatelessWidget {
  const SignInHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          "Welcome Back! 👋",
          style: AppTextStyles.headlineSmall,
        ),
        gap6,
        Text(
          "Glad to have you here again. Let’s get started!",
          style: AppTextStyles.bodySmall,
        ),
      ],
    );
  }
}
