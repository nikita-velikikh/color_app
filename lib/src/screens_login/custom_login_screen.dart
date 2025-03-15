import 'package:color_aap/src/screens_login/buttons_and_lines.dart';
import 'package:color_aap/src/screens_login/email_field.dart';
import 'package:color_aap/src/screens_login/icon_buttons.dart';
import 'package:color_aap/src/screens_login/password_field.dart';
import 'package:color_aap/src/screens_login/password_info.dart';
import 'package:color_aap/src/screens_login/registration.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final image = AssetImage('assets/images/groupimage.png');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Image(
                    image: image,
                    width: MediaQuery.of(context).size.width * 0.7),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Welcome Back! 👋",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Hello again, you've been missed!",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  const EmailField(),
                  SizedBox(height: 12),
                  const PasswordField(),
                  SizedBox(height: 7),
                  const PasswordInfo(),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  const ButtonsAndLines(),
                  Spacer(),
                  const IconButtons(),
                  Spacer(),
                  const Registration(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
