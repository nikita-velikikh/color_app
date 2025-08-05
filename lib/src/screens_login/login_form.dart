// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:color_aap/local_storage_service.dart';
import 'package:flutter/material.dart';

import 'package:color_aap/src/screens_login/custom_field.dart';
import 'package:color_aap/src/screens_login/logo_text.dart';
import 'package:color_aap/src/screens_login/password_info.dart';
import 'package:color_aap/src/screens_login/validation.dart';
import 'package:color_aap/src/screens_login/sing_up_password_field.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:color_aap/src/screens_login/auth_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.isLogin,
    required this.onEmailChanged,
    required this.onPasswordChanged,
  });

  final GlobalKey<FormState> formKey;
  final bool isLogin;
  final Function(String) onEmailChanged;
  final Function(String) onPasswordChanged;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    repeatPasswordController.dispose();
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
//
              //
              // isLogin
              //     ? LogoText(
              //         title: "Hi, Welcome Back! 👋",
              //         subTitle: "Hello again, you've been missed!",
              //       )
              //     : LogoText(
              //         title: "SomeOtherString",
              //         subTitle: "SomeANotherOthEr String",
              //       ),
              //
              // LogoText(
              //   title: isLogin ? "" : "",
              //   subTitle: isLogin ? "" : "",
              // ),

              const SizedBox(height: 16),
              CustomField(
                hintText: S.of(context).enterYourEmail,
                onChanged: widget.onEmailChanged,
                validator: validateEmail,
              ),
              const SizedBox(height: 12),
              CustomField(
                controller: passwordController,
                onChanged: widget.onPasswordChanged,
                hintText: S.of(context).enterYourPassword,
                isPassword: true,
                validator: validatePassword,
              ),
              if (!widget.isLogin) ...[
                const SizedBox(height: 12),
                SingUpPasswordField(
                  controller: repeatPasswordController,
                  hintText: S.of(context).repeatYourPassword,
                  isPassword: true,
                  onChanged: (password) {},
                  validator: (value) => validateRepeatPassword(value, passwordController.text),
                )
              ],

              const SizedBox(height: 7),
              const PasswordInfo(),
            ],
          ),
        ));
  }
}
