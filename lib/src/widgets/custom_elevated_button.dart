import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.buttonTitle,
    required this.buttonStyle,
    required this.onPressed,
    required this.padding,
    required this.textStyle,
    super.key,
  });

  final String buttonTitle;
  final ButtonStyle buttonStyle;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(
          buttonTitle,
          style: textStyle,
        ),
      ),
    );
  }
}
