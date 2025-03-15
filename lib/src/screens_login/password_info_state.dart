import 'package:color_aap/src/screens_login/password_info.dart';
import 'package:flutter/material.dart';

class PasswordInfoState extends State<PasswordInfo> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
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
              SizedBox(width: 7),
              Text(
                "Remember Me",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
