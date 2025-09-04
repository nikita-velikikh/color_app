import 'package:color_aap/hashing_service.dart';
import 'package:color_aap/logic/auth_logic.dart';
import 'package:color_aap/src/screens/color_screen.dart';
import 'package:color_aap/src/screens_login/login_buttons.dart';
import 'package:color_aap/src/screens_login/login_form.dart';
import 'package:color_aap/src/services/shared_prefs_storage.dart';
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
  final _storageService = SharedPrefsStorage();
  late AuthLogic _authLogic;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? currentError;

  @override
  void initState() {
    super.initState();
    _authLogic = AuthLogic(
      storageService: _storageService,
      hashingService: HashingService(),
    );
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
    final email = emailController.text;
    final password = passwordController.text;
    final loginError = await _authLogic.handleLogin(email, password);
    if (loginError != null) {
      handleError(loginError);
    } else {
      navigate(email);
    }
  }

  /// Creates a new user account with the provided credentials
  Future<void> _handleCreateUser() async {
    final email = emailController.text;
    final password = passwordController.text;
    final success = await _authLogic.createUser(
      email,
      password,
    );

    if (success) {
      navigate(email);
    } else {
      handleError("User with this email already exists");
    }
  }

  void navigate(String email) {
    if (mounted) {
      Navigator.pushReplacement(
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
