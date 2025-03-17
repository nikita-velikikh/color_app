import 'package:color_aap/src/screens_login/email_field.dart';
import 'package:color_aap/src/screens_login/logo_text.dart';
import 'package:color_aap/src/screens_login/password_field.dart';
import 'package:color_aap/src/screens_login/password_info.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LogoText(),
        SizedBox(height: 16),
        EmailField(),
        SizedBox(height: 12),
        PasswordField(),
        SizedBox(height: 7),
        PasswordInfo(),
      ],
    );
  }
}
