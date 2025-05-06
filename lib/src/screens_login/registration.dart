import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  const Registration({
    super.key,
    required this.subText,
    required this.textButtonText,
    required this.onToggle,
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
          Text(
            subText,
            style: TextStyle(color: Colors.grey),
          ),
          TextButton(
              onPressed: onToggle,
              child: Text(
                textButtonText,
                style: TextStyle(color: Colors.deepPurple, fontSize: 14),
              ))
        ],
      ),
    );
  }
}
