import 'package:color_aap/src/screens_login/login_buttons.dart';
import 'package:color_aap/src/screens_login/login_form.dart';

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const LoginForm(),
            if (!isKeyboardOpen) const Spacer(),
            const LoginButtons(),
          ],
        ),
      ),
    );
  }
}
