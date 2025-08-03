
import 'package:color_aap/local_storage_service.dart';
import 'package:color_aap/src/screens/color_screen.dart';
import 'package:color_aap/src/screens_login/login_buttons.dart';
import 'package:color_aap/src/screens_login/login_form.dart';

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String email = "";
  String password = "";
  var isLogin = true;
  final formKey = GlobalKey<FormState>();
  void onLoginPressed() async {
    if (formKey.currentState!.validate()) {
      final service = LocalStorageService();
      if (isLogin) {
        final exists = await service.loginUser(email);
        if (exists) {
          await service.saveLastEmail(email);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ColorScreen(email: email)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User not found")),
          );
        }
      } else {
        final success = await service.createUser(email, password);
        if (success) {
          await service.saveLastEmail(email);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ColorScreen(email: email)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("User with this email already exists")),
          );
        }
      }
    }
  }

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void onChangeLogin() {
    // if (isLogin) {
    //   isLogin = false;
    // } else {
    //   isLogin = true;
    // }
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LoginForm(
              formKey: formKey,
              isLogin: isLogin,
              onEmailChanged: (value) => setState(() => email = value),
              onPasswordChanged: (value) => setState(() => password = value),
            ),
            LoginButtons(
              isLogin: isLogin,
              onLoginPressed: onLoginPressed,
              onToggle: onChangeLogin,
            ),
          ],
        ),
      ),
    );
  }
}
