import 'package:color_aap/src/screens_login/buttons_and_lines.dart';
import 'package:color_aap/src/screens_login/icon_buttons.dart';
import 'package:color_aap/src/screens_login/registration.dart';
import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ButtonsAndLines(),
        SizedBox(height: 16),
        LoginWithButtonRow(),
        SizedBox(height: 10),
        Registration(),
      ],
    );
  }
}
