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
        appBar: AppBar(toolbarHeight: 51, backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Image(image: image),
            ),
            SizedBox(height: 70),
            //Text(
            // "Hi, Wecome Back! 👋",
            // style: TextStyle(
            //   fontSize: 25,
            // ),
            // )
          ],
        ));
  }
}
