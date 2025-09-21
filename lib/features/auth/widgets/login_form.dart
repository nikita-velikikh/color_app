// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:color_aap/core/utils/validation.dart';
import 'package:color_aap/features/auth/widgets/custom_field.dart';
import 'package:color_aap/features/auth/widgets/logo_text.dart';
import 'package:color_aap/features/auth/widgets/password_info.dart';
import 'package:color_aap/features/auth/widgets/sing_up_password_field.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Form widget for user authentication with email and password fields
class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.formKey,
    required this.isLogin,
    required this.emailController,
    required this.passwordController,
    required this.repeatPasswordController,
    this.currentError,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final bool isLogin;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;
  final String? currentError;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

/// State class for LoginForm that manages form controllers and UI layout
class _LoginFormState extends State<LoginForm> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 31),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isLogin)
              LogoText(
                title: S.of(context).welcomeBack,
                subTitle: S.of(context).welcomeSub,
              )
            else
              LogoText(
                title: S.of(context).createAccount,
                subTitle: S.of(context).connectFriends,
              ),
            const SizedBox(height: 16),
            CustomField(
              hintText: S.of(context).enterYourEmail,
              controller: widget.emailController,
              validator: (value) => validateEmail(value, context),
              onChanged: (email) {},
              currentError: widget.currentError,
            ),
            const SizedBox(height: 12),
            CustomField(
              controller: widget.passwordController,
              hintText: S.of(context).enterYourPassword,
              isPassword: true,
              validator: (value) => validatePassword(value, context),
              onChanged: (password) {},
            ),
            if (!widget.isLogin) ...[
              const SizedBox(height: 12),
              SingUpPasswordField(
                hintText: S.of(context).repeatYourPassword,
                isPassword: true,
                controller: widget.repeatPasswordController,
                validator: (value) => validateRepeatPassword(
                  value,
                  widget.passwordController.text,
                  context,
                ),
              ),
            ],
            const SizedBox(height: 7),
            const PasswordInfo(),
          ],
        ),
      ),
    );
  }


    /// Properly disposes of all text controllers to prevent memory leaks
  @override
  void dispose() {
    widget.passwordController.dispose();
    widget.repeatPasswordController.dispose();
    widget.emailController.dispose();
    super.dispose();
  }
}
