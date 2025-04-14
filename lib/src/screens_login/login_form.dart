import 'package:color_aap/src/screens_login/custom_field.dart';
import 'package:color_aap/src/screens_login/logo_text.dart';
import 'package:color_aap/src/screens_login/password_info.dart';
import 'package:color_aap/src/screens_login/validation.dart';

import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.formKey});
  final GlobalKey formKey;

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
