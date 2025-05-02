// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:color_aap/src/screens_login/custom_field.dart';
import 'package:color_aap/src/screens_login/logo_text.dart';
import 'package:color_aap/src/screens_login/password_info.dart';
import 'package:color_aap/src/screens_login/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.isLogin,
  });
  final GlobalKey formKey;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 31),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoText(),
              SizedBox(height: 16),
              CustomField(
                hintText: "Enter Your Email",
                onChanged: (email) {},
                validator: validateEmail,
              ),
              SizedBox(height: 12),
              CustomField(
                onChanged: (password) {},
                hintText: "Enter Your Password",
                isPassword: true,
                validator: validatePassword,
              ),
              SizedBox(height: 7),
              PasswordInfo(),
            ],
          ),
        ));
  }
}
