import 'package:auto_route/auto_route.dart';
import 'package:color_aap/core/navigation/navigation.gr.dart';
import 'package:color_aap/core/services/hashing_service.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:color_aap/features/auth/auth_logic.dart';
import 'package:color_aap/features/auth/widgets/login_buttons.dart';
import 'package:color_aap/features/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';

/// Main authentication screen that handles both login and registration
///
@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

/// State class for AuthScreen that manages authentication logic and form state
class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  final formKey = GlobalKey<FormState>();

  final AuthLogic _authLogic = AuthLogic(
    storageService: SharedPrefsStorage(),
    hashingService: HashingService(),
  );

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? currentError;

  /// Handles form submission for both login and registration
  Future<void> onLoginPressed() async {
    final currentState = formKey.currentState;
    if (currentState == null) return;
    if (currentState.validate()) {
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
    if (!mounted) return;
    context.router.pushAndPopUntil(
      ColorRoute(email: email),
      predicate: (_) => false,
    );
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
