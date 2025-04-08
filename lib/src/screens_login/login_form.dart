import 'package:color_aap/src/screens_login/custom_field.dart';
import 'package:color_aap/src/screens_login/logo_text.dart';
import 'package:color_aap/src/screens_login/password_info.dart';

import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var emailText = "";
  var passwordText = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 31),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoText(),
              SizedBox(height: 16),
              CustomField(
                  label: "Email",
                  hintText: "Enter Your Email",
                  onChanged: (email) {
                    setState(() {
                      emailText = email;
                    });
                  }),
              SizedBox(height: 12),
              CustomField(
                onChanged: (password) {
                  setState(() {
                    passwordText = password;
                  });
                },
                label: "Password",
                hintText: "Enter Your Password",
                isPassword: true,
              ),
              SizedBox(height: 7),
              PasswordInfo(),
            ],
          ),
        ));
  }
}
