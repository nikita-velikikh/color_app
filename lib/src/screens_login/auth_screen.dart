import 'package:color_aap/hashing.service.dart';
import 'package:color_aap/local_storage_service.dart';
import 'package:color_aap/logic/auth_logic.dart';
import 'package:color_aap/src/screens/color_screen.dart';
import 'package:color_aap/src/screens_login/login_buttons.dart';
import 'package:color_aap/src/screens_login/login_form.dart';
import 'package:flutter/material.dart';

/// Main authentication screen that handles both login and registration
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

/// State class for AuthScreen that manages authentication logic and form state
class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  final formKey = GlobalKey<FormState>();
  final _storageService = LocalStorageService();
  late AuthLogic _authLogic;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? currentError;

  @override
  void initState() {
    super.initState();
    _authLogic = AuthLogic(storageService: _storageService);
  }

  /// Handles form submission for both login and registration
  Future<void> onLoginPressed() async {
    if (formKey.currentState!.validate()) {
      if (isLogin) {
        await _handleLogin();
      } else {
        await _handleCreateUser();
      }
    }
  }

  /// Authenticates existing user with email and password
  Future<void> _handleLogin() async {
    final exists = await _authLogic.userExists(emailController.text);
    if (exists) {
      final userData = await _authLogic.getUserData(emailController.text);
      if (userData != null) {
        final passwordValid = await HashingService.verifyPassword(
          passwordController.text,
          userData.password,
        );

        if (passwordValid) {
          await saveLastEmailAndNavigate(emailController.text);
        } else {
          handleError("Invalid password");
        }
      } else {
        handleError("User data not found");
      }
    } else {
      handleError("User not found");
    }
  }

  /// Creates a new user account with the provided credentials
  Future<void> _handleCreateUser() async {
    final success = await _authLogic.createUser(
      emailController.text,
      passwordController.text,
    );

    if (success) {
      await saveLastEmailAndNavigate(emailController.text);
    } else {
      handleError("User with this email already exists");
    }
  }

  /// Saves the authenticated user's email and navigates to the color screen
  Future<void> saveLastEmailAndNavigate(String email) async {
    await _authLogic.saveLastEmail(email);

    if (mounted) {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ColorScreen(email: email)),
      );
    }
  }

  /// Displays error messages to the user
  void handleError(String message) {
    setState(() {
      currentError = message;
    });
  }

  /// Toggles between login and registration modes
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
