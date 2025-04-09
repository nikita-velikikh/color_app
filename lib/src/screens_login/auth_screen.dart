import 'package:color_aap/src/screens_login/login_buttons.dart';
import 'package:color_aap/src/screens_login/login_form.dart';

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var emailText = "";
  var passwordText = "";
  final formKey = GlobalKey<FormState>();
  void onLoginPressed() {
    if (formKey.currentState!.validate()) {
      print("ok");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LoginForm(
              formKey: formKey,
            ),
            LoginButtons(
              onLoginPressed: onLoginPressed,
            ),
          ],
        ),
      ),
    );
  }
}
