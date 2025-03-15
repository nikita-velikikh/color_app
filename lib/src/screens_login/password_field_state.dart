import 'package:color_aap/src/screens_login/password_field.dart';
import 'package:flutter/material.dart';

class PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 27, right: 28),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Password",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 7),
          SizedBox(
            height: 41,
            child: TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: "Enter Your Password",
                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 11),
                  child: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
