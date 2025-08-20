// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:color_aap/src/screens_login/logo_image.dart';
import 'package:flutter/material.dart';

/// Widget that displays the app logo image and customizable title/subtitle text
class LogoText extends StatelessWidget {
  const LogoText({
    required this.title,
    required this.subTitle,
    super.key,
  });
  final String title;
  final String subTitle;

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
              title,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 5),
            Text(
              subTitle,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
