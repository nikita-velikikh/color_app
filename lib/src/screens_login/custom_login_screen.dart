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
      body: SingleChildScrollView(
        // Дает прокрутку, если элементов слишком много
        child: Column(
          children: [
            SizedBox(height: 28),
            Center(
              child: Image(image: image),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 29),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hi, Wecome Back! 👋",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hello again, youve been missed!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            const EmailField(),
            SizedBox(height: 12),
            const PasswordField(),
            SizedBox(height: 7),
            PasswordInfo(),
            SizedBox(height: 110),
            const ButtonsAndLines(),
            SizedBox(height: 32),
            const IconButtons(),
            SizedBox(
              height: 15,
            ),
            const Registration(),
          ],
        ),
      ),
    );
  }
}
