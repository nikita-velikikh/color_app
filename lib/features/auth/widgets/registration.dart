import 'package:flutter/material.dart';

/// Widget that displays a registration/login toggle button with customizable text
class Registration extends StatelessWidget {
  /// Constructor for Registration
  const Registration({
    required this.subText,
    required this.textButtonText,
    required this.onToggle,
    super.key,
  });

  /// Subtext for the button
  final String subText;
  /// Text for the button
  final String textButtonText;
  /// Callback for the toggle button
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: onToggle,
            child: Text(
              textButtonText,
              style: const TextStyle(color: Colors.deepPurple, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
