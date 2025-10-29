import 'package:auto_route/auto_route.dart';
import 'package:color_aap/core/navigation/navigation.gr.dart';
import 'package:color_aap/core/services/service_locator.dart';
import 'package:color_aap/features/auth/auth_logic.dart';
import 'package:color_aap/features/auth/language_button_logic.dart';
import 'package:color_aap/features/auth/widgets/language_selector.dart';
import 'package:color_aap/features/auth/widgets/login_buttons.dart';
import 'package:color_aap/features/auth/widgets/login_form.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Main authentication screen that handles both login and registration
///
@RoutePage()
class AuthScreen extends StatefulWidget {
  /// Constructor for AuthScreen
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

/// State class for AuthScreen that manages authentication logic and form state
class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  final formKey = GlobalKey<FormState>();
  late final AuthLogic _authLogic = serviceLocator.get<AuthLogic>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? currentError;

  @override
  void initState() {
    super.initState();
    context.read<LanguageButtonLogic>().loadLanguage();
  }

  /// Handles form submission for both login and registration
  Future<void> onLoginPressed() async {
    if (formKey.currentState?.validate() ?? false) {
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
    final loginError = await _authLogic.handleLogin(
      email,
      password,
      context,
    );
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
    final userExists = S.of(context).userExists;
    final success = await _authLogic.createUser(
      email,
      password,
    );

    if (success) {
      navigate(email);
    } else {
      handleError(userExists);
    }
  }

  void navigate(String email) {
    if (mounted) {
      context.router.pushAndPopUntil(
        ColorRoute(email: email),
        predicate: (route) => false,
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
            const Align(
              alignment: Alignment.topRight,
              child: LanguageSelector(),
            ),
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
