import 'package:color_aap/generated/l10n.dart';
import 'package:color_aap/src/screens_login/buttons_and_lines.dart';
import 'package:color_aap/src/screens_login/icon_buttons.dart';
import 'package:color_aap/src/screens_login/registration.dart';
import 'package:flutter/material.dart';

/// Container widget that displays all authentication-related
///  buttons and controls
class LoginButtons extends StatelessWidget {
  const LoginButtons({
    required this.onLoginPressed,
    required this.isLogin,
    required this.onToggle,
    super.key,
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
          textLoginButton: isLogin ? S.of(context).login : S.of(context).signUp,
        ),
        const SizedBox(height: 16),
        const IconButtons(),
        const SizedBox(height: 10),
        Registration(
          subText: isLogin
              ? S.of(context).dontHaveAccount
              : S.of(context).alreadyHaveAccount,
          textButtonText: isLogin ? S.of(context).signUp : S.of(context).login,
          onToggle: onToggle,
        ),
      ],
    );
  }
}
