import 'package:color_aap/src/screens_login/logo_image.dart';
import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isKeyboardOpen ? 0 : 144,
            child: const LogoImage(),
          ),
        ),
        Column(
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
      ],
    );
  }
}
