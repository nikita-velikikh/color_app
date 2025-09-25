import 'package:color_aap/features/auth/widgets/buttons_and_lines.dart';
import 'package:color_aap/features/auth/widgets/icon_buttons.dart';
import 'package:color_aap/features/auth/widgets/registration.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';


/// Container widget that displays all authentication-related
///  buttons and controls
class LoginButtons extends StatelessWidget {
  /// Constructor for LoginButtons
  const LoginButtons({
    required this.onLoginPressed,
    required this.isLogin,
    required this.onToggle,
    super.key,
  });
  /// Callback for the toggle button
  final VoidCallback onToggle;
  /// Callback for the login button
  final VoidCallback onLoginPressed;
  /// Whether the login is active
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
