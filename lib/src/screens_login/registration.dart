import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Dont have an account ?",
            style: TextStyle(color: Colors.grey),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Sign up",
                style: TextStyle(color: Colors.deepPurple, fontSize: 14),
              ))
        ],
      ),
    );
  }
}
