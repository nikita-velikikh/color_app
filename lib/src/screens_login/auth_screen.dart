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
  bool isLogin = true;
  final formKey = GlobalKey<FormState>();
  final service = LocalStorageService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? currentError;

  Future<void> onLoginPressed() async {
    if (formKey.currentState!.validate()) {
      if (isLogin) {
        await _handleLogin();
      } else {
        await _handleCreateUser();
      }
    }
  }

  Future<void> _handleLogin() async {
    final exists = await service.checkUserExists(emailController.text);
    if (exists) {
      await saveLastEmailAndNavigate(emailController.text);
    } else {
      handleError("User not found");
    }
  }

  Future<void> _handleCreateUser() async {
    final success =
        await service.createUser(emailController.text, passwordController.text);
    if (success) {
      await saveLastEmailAndNavigate(emailController.text);
    } else {
      handleError("User with this email already exists");
    }
  }

  Future<void> saveLastEmailAndNavigate(String email) async {
    await service.saveLastEmail(email);
    if (mounted) {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ColorScreen(email: email)),
      );
    }
  }

  void handleError(String message) {
    setState(() {
      currentError = message;
    });
  }

  void onChangeLogin() {
    setState(() {
      isLogin = !isLogin;
      currentError = null;

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
              currentError: currentError,
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
