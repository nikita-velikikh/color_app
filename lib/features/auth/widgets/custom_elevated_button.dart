import 'package:flutter/material.dart';

/// Customizable elevated button widget with configurable styling and padding
class CustomElevatedButton extends StatelessWidget {
  /// Constructor for CustomElevatedButton
  const CustomElevatedButton({
    required this.buttonTitle,
    required this.buttonStyle,
    required this.onPressed,
    required this.padding,
    required this.textStyle,
    super.key,
  });

  /// Title for the button
  final String buttonTitle;
  /// Style for the button
  final ButtonStyle buttonStyle;
  /// Callback for the button
  final VoidCallback onPressed;
  /// Padding for the button
  final EdgeInsets padding;
  /// Text style for the button
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
