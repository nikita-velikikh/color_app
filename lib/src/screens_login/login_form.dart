// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:color_aap/src/screens_login/custom_field.dart';
import 'package:color_aap/src/screens_login/logo_text.dart';
import 'package:color_aap/src/screens_login/password_info.dart';
import 'package:color_aap/src/screens_login/validation.dart';
import 'package:color_aap/src/screens_login/sing_up_password_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.isLogin,
  });

  final GlobalKey<FormState> formKey;
  final bool isLogin;

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
                const LogoText(
                  title: "Hi, Welcome Back! 👋",
                  subTitle: "Hello again, you've been missed!",
                )
              else
                const LogoText(
                  title: "Create an account",
                  subTitle: "Connect with your friends today!",
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
                hintText: "Enter Your Email",
                onChanged: (email) {},
                validator: validateEmail,
              ),
              const SizedBox(height: 12),
              CustomField(
                controller: passwordController,
                onChanged: (password) {},
                hintText: "Enter Your Password",
                isPassword: true,
                validator: validatePassword,
              ),
              if (!widget.isLogin) ...[
                const SizedBox(height: 12),
                SingUpPasswordField(
                    controller: repeatPasswordController,
                    hintText: "Repeat Your Password",
                    isPassword: true,
                    onChanged: (password) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Please repeat the password";
                      if (value != passwordController.text) return "Passwords do not match";
                      return null;
                    })
              ],

              const SizedBox(height: 7),
              const PasswordInfo(),
            ],
          ),
        ));
  }
}
