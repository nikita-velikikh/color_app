import 'package:color_aap/src/screens_login/buttons_and_lines.dart';
import 'package:color_aap/src/screens_login/icon_buttons.dart';
import 'package:color_aap/src/screens_login/registration.dart';
import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
    required this.onLoginPressed,
    required this.isLogin,
    required this.onToggle,
  });
  final VoidCallback onToggle;
  final VoidCallback onLoginPressed;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonsAndLines(
          onTap: onLoginPressed,
          textLoginButton: isLogin ? "Login" : "Sign up",
        ),
        const SizedBox(height: 16),
        const IconButtons(),
        const SizedBox(height: 10),
        Registration(
          subText: isLogin ? "Dont have an account ?" : "Already have an account ?",
          textButtonText: isLogin ? "Sign " : "Login",
          onToggle: onToggle,
        ),
      ],
    );
  }
}
