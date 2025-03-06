import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final image = AssetImage('assets/images/groupimage.png');
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 58),
            Center(
              child: Image(image: image),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 29),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hi, Wecome Back! 👋",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hello again, youve been missed!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
