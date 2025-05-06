import 'package:flutter/material.dart';

class PasswordInfo extends StatefulWidget {
  const PasswordInfo({super.key});
  @override
  PasswordInfoState createState() => PasswordInfoState();
}

class PasswordInfoState extends State<PasswordInfo> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 7),
              const Text(
                "Remember Me",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Forgot Password",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
