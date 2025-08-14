// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:color_aap/src/screens_login/custom_field.dart';
import 'package:color_aap/src/screens_login/logo_text.dart';
import 'package:color_aap/src/screens_login/password_info.dart';
import 'package:color_aap/src/screens_login/validation.dart';
import 'package:color_aap/src/screens_login/sing_up_password_field.dart';
import 'package:color_aap/generated/l10n.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.isLogin,
    required this.emailController,
    required this.passwordController,
    required this.repeatPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final bool isLogin;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  void dispose() {
    widget.passwordController.dispose();
    widget.repeatPasswordController.dispose();
    widget.emailController.dispose();
    super.dispose();
  }

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
                validator: validateEmail,
                onChanged: (email) {},
              ),
              const SizedBox(height: 12),
              CustomField(
                controller: widget.passwordController,
                hintText: S.of(context).enterYourPassword,
                isPassword: true,
                validator: validatePassword,
                onChanged: (password) {},
              ),
              if (!widget.isLogin) ...[
                const SizedBox(height: 12),
                SingUpPasswordField(
                  hintText: S.of(context).repeatYourPassword,
                  isPassword: true,
                  controller: widget.repeatPasswordController,
                  onChanged: (password) {},
                  validator: (value) => validateRepeatPassword(
                      value, widget.passwordController.text),
                )
              ],
              const SizedBox(height: 7),
              const PasswordInfo(),
            ],
          ),
        ));
  }
}
