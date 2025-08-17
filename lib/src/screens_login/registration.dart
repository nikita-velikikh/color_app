import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  const Registration({
    required this.subText,
    required this.textButtonText,
    required this.onToggle,
    super.key,
  });

  final String subText;
  final String textButtonText;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text(
          //   subText,
          //   style: const TextStyle(color: Colors.grey),
          // ),
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
