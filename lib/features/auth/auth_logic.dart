import 'package:color_aap/core/models/models.dart';
import 'package:color_aap/core/services/hashing_service.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Logic for authentication
class AuthLogic extends ChangeNotifier {
  /// Storage service for storing user data
  final SharedPrefsStorage storageService;

  /// Minimum number of password characters
  static const int minNumberPassword = 8;

  /// Hashing service for password hashing
  final HashingService hashingService;

  bool _isLogin = true;

  String? _currentError;

  /// getter login page and register page
  bool get isLogin => _isLogin;

  /// Current authentication error
  String? get currentError => _currentError;

  /// Constructor for AuthLogic
  AuthLogic({
    required this.storageService,
    required this.hashingService,
  });

  /// Toggles between login and registration modes, clears any current error
  void toggleAuthMode() {
    _isLogin = !_isLogin;
    _currentError = null;
    notifyListeners();
  }

  /// Sets the current error message and notifies listeners
  void setError(String message) {
    _currentError = message;
    notifyListeners();
  }

  /// Saves the authenticated user's email
  Future<void> saveLastEmail(String email) async {
    await storageService.saveLastEmail(email);
  }

  /// Handles login
  Future<String?> handleLogin(
    String email,
    String password,
    BuildContext context,
  ) async {
    final userNotFound = S.of(context).userNotFound;
    final invalidPassword = S.of(context).invalidPassword;
    final userDataNotFound = S.of(context).userDataNotFound;
    final exists = await userExists(email);
    if (exists) {
      final userData = await getUserData(email);
      if (userData != null) {
        final passwordValid = await hashingService.verifyPassword(
          password,
          userData.password,
        );
        if (passwordValid) {
          await saveLastEmail(email);
        } else {
          return invalidPassword;
        }
      } else {
        return userDataNotFound;
      }
    } else {
      return userNotFound;
    }

    return null;
  }

  /// Gets the last saved email
  Future<String?> getLastEmail() async {
    return storageService.getLastEmail();
  }

  /// Checks if user exists
  Future<bool> userExists(String email) async {
    return storageService.checkUserExists(email);
  }

  /// Creates a new user
  Future<bool> createUser(String email, String password) async {
    final hashedPassword = hashingService.hashPassword(password);
    final success = await storageService.createUser(email, hashedPassword);
    if (success) {
      await saveLastEmail(email);
    }

    return success;
  }

  /// Gets user data
  Future<UserData?> getUserData(String email) async {
    try {
      return await storageService.getUserData(email);
    } catch (e) {
      return null;
    }
  }

  /// Deletes the last email (logout)
  Future<void> logout() async {
    await storageService.deleteLastEmail();
  }

  /// Checks if user is logged in
  Future<bool> isLoggedIn() async {
    final email = await getLastEmail();

    return email != null && email.isNotEmpty;
  }
}
