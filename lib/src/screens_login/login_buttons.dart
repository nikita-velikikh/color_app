import 'package:color_aap/src/screens_login/buttons_and_lines.dart';
import 'package:color_aap/src/screens_login/icon_buttons.dart';
import 'package:color_aap/src/screens_login/registration.dart';
import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
    required this.onLoginPressed,
    required this.isLogin,
  });
  final VoidCallback onLoginPressed;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonsAndLines(onTap: onLoginPressed),
        const SizedBox(height: 16),
        const IconButtons(),
        const SizedBox(height: 10),
        const Registration(),
      ],
    );
  }
}
