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

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _emailText = '';
  String _passwordText = '';
  String _confirmPasswordText = '';
  final formKey = GlobalKey<FormState>();

  String get emailText => _emailText;
  String get passwordText => _passwordText;
  String get confirmPasswordText => _confirmPasswordText;

  @override
  void initState() {
    super.initState();
    context.read<LanguageButtonLogic>().loadLanguage();

    _emailController.addListener(() {
      setState(() {
        _emailText = _emailController.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _passwordText = _passwordController.text;
      });
    });

    _confirmPasswordController.addListener(() {
      setState(() {
        _confirmPasswordText = _confirmPasswordController.text;
      });
    });
  }

  /// Properly disposes of all text controllers to prevent memory leaks
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  /// Handles form submission for both login and registration
  Future<void> onLoginPressed(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      if (context.read<AuthLogic>().isLogin) {
        await _handleLogin(context);
      } else {
        await _handleCreateUser(context);
      }
    }
  }

  /// Toggles between login and registration modes
  void onChangeLogin(BuildContext context) {
    context.read<AuthLogic>().toggleAuthMode();
    _clearControllers();
  }

  /// Authenticates existing user with email and password
  Future<void> _handleLogin(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final loginError = await context.read<AuthLogic>().handleLogin(
          email,
          password,
          context,
        );
    if (context.mounted) {
      if (loginError != null) {
        context.read<AuthLogic>().setError(loginError);
      } else {
        navigate(context, email);
      }
    }
  }

  void _clearControllers() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  /// Creates a new user account with the provided credentials
  Future<void> _handleCreateUser(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final userExists = S.of(context).userExists;
    final success = await context.read<AuthLogic>().createUser(
          email,
          password,
        );
    if (context.mounted) {
      if (success) {
        navigate(context, email);
      } else {
        context.read<AuthLogic>().setError(userExists);
      }
    }
  }

  void navigate(BuildContext context, String email) {
    if (context.mounted) {
      context.router.replace(
        ColorRoute(email: email),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthLogic>(
      create: (context) => serviceLocator.get<AuthLogic>(),
      child: Consumer<AuthLogic>(
        builder: (context, authLogic, child) => Scaffold(
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
                  isLogin: context.watch<AuthLogic>().isLogin,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  repeatPasswordController: _confirmPasswordController,
                  currentError: context.watch<AuthLogic>().currentError,
                ),
                LoginButtons(
                  isLogin: context.watch<AuthLogic>().isLogin,
                  onLoginPressed: () => onLoginPressed(context),
                  onToggle: () => onChangeLogin(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
