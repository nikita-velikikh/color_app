import 'package:color_aap/src/screens_login/login_buttons.dart';
import 'package:color_aap/src/screens_login/login_form.dart';
import 'package:color_aap/local_storage_service.dart';

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var isLogin = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void onLoginPressed() async {
    if (formKey.currentState!.validate()) {
      if (!isLogin) {
        final email = emailController.text.trim();
        final password = passwordController.text;
        final backgroundColor = '#ffffff';
        final textColor = '#333333';
        final appBarColor = '#000000';
        await LocalStorageService().registerUser(
          email,
          password,
          backgroundColor: backgroundColor,
          appBarColor: appBarColor,
          textColor: textColor,
        );
        await LocalStorageService().setCurrentUser(email);
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/color_screen');
        }
      } else {
        final email = emailController.text.trim();
        final userData = await LocalStorageService().getUserDataByEmail(email);
        if (userData == null) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Пользователь не найден')),
            );
          }
          return;
        }
        await LocalStorageService().setCurrentUser(email);
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/color_screen');
        }
      }
    }
  }

  void onChangeLogin() {
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
              emailController: emailController,
              passwordController: passwordController,
              repeatPasswordController: confirmPasswordController,
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
