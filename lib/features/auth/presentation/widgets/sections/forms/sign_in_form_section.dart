import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task/core/helpers/validation/form_validations.dart';
import 'package:flutter_task/core/utils/extensions/status_extension.dart';
import 'package:flutter_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_task/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_task/widgets/buttons/primary_button.dart';
import 'package:flutter_task/widgets/text_forms/primary_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter_task/features/home/presentation/pages/home_page.dart';

class SignInFormSection extends HookWidget {
  const SignInFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    void signIn() {
      if (formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(SignIn(
            username: usernameController.text,
            password: passwordController.text
        ));
      }
    }

    return BlocConsumer<AuthBloc,AuthState>(
      listenWhen: (previous, current)=> !previous.isSignedIn && current.isSignedIn,
      listener: (context, state) => context.go(HomePage.path),
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              PrimaryTextFormField(
                controller: usernameController,
                title: "Username",
                hintText: "Enter your username",
                textInputType: TextInputType.name,
                validator: (value) =>
                    FormValidation(
                        validationType: ValidationType.name,
                        formValue: value
                    ).validate(),
              ),
              gap12,
              PrimaryTextFormField(
                controller: passwordController,
                title: "Password",
                hintText: "Enter your password",
                showObscureButton: true,
                textInputType: TextInputType.visiblePassword,
                validator: (value) =>
                    FormValidation(
                        validationType: ValidationType.password,
                        formValue: value
                    ).validate(),
              ),

              gap28,

              PrimaryButton(
                isLoading: state.status.isLoading,
                onPressed: signIn,
                text: "Sign In",
              ),

            ],
          ),
        );
      },
    );
  }
}
