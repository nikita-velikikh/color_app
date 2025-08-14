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
  var isLogin = true;
  final formKey = GlobalKey<FormState>();
  final service = LocalStorageService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void onLoginPressed() async {
    if (formKey.currentState!.validate()) {
      if (isLogin) {
        _handleLogin();
      } else {
        _handleCreateUser();
      }
    }
  }

  void _handleLogin() async {
    final exists = await service.checkUserExists(emailController.text);
    if (exists) {
      saveLastEmailAndNavigate(emailController.text);
    } else {
      handleError("User not found");
    }
  }

  void _handleCreateUser() async {
    final success =
        await service.createUser(emailController.text, passwordController.text);
    if (success) {
      saveLastEmailAndNavigate(emailController.text);
    } else {
      handleError("User with this email already exists");
    }
  }

  void saveLastEmailAndNavigate(String email) async {
    await service.saveLastEmail(email);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ColorScreen(email: email)),
    );
  }

  void handleError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void onChangeLogin() {
    setState(() {
      isLogin = !isLogin;

      passwordController.clear();
      confirmPasswordController.clear();
      emailController.clear();
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
