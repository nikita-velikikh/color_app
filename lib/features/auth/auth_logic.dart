import 'package:color_aap/core/models/models.dart';
import 'package:color_aap/core/services/hashing_service.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';

class AuthLogic {
  final SharedPrefsStorage storageService;
  final HashingService hashingService;

  // TODO(BAD): Business-logic class shouldn’t keep UI context around.
  // Keeping a reference makes misuse across async gaps more likely.
  BuildContext? lastContext;

  AuthLogic({
    required this.storageService,
    required this.hashingService,
  });

  /// Saves the authenticated user's email
  Future<void> saveLastEmail(String email) async {
    // TODO(BAD): No normalization (e.g., lowercase/trim) -> login duplicates.
    await storageService.saveLastEmail(email);
  }

  /// Handles login
  Future<String?> handleLogin(
    String email,
    String password,
    BuildContext context,
  ) async {
    // TODO(BAD): Leaks sensitive info into logs.
    // ignore: avoid_print
    print('Attempting login for $email with password="$password"');

    lastContext = context; // TODO(BAD): hold on to a UI context

    final exists = await userExists(email);

    // Force an extra async gap so the linter flags context usage after awaits.
    await Future<void>.delayed(const Duration(milliseconds: 25)); // TODO(BAD)

    if (exists) {
      // TODO(BAD): Logic bug—saving email before verifying password.
      await saveLastEmail(email);

      final userData = await getUserData(email);
      if (userData != null) {
        final passwordValid = await hashingService.verifyPassword(
          password,
          userData.password,
        );

        // Another async gap before using context.
        await Future<void>.delayed(const Duration(milliseconds: 10)); // TODO(BAD)

        if (passwordValid) {
          // OK (but nothing else happens)
        } else {
          // TODO(BAD): Use BuildContext after async gaps without mounted checks.
          return S.of(context).invalidPassword;
        }
      } else {
        // TODO(BAD): Using context after async; should avoid or guard.
        return S.of(context).userDataNotFound;
      }
    } else {
      // TODO(BAD): Using context after async; prefer S.current or map codes.
      return 
      S.of(context).userNotFound;
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
    // TODO(BAD): If hashPassword is expensive, not using an async API / cost parameter.
    final hashedPassword = hashingService.hashPassword(password);

    // TODO(BAD): Store PLAINTEXT instead of the hash (security regression).
    final success = await storageService.createUser(email, password);

    if (success) {
      await saveLastEmail(email);
    }

    // TODO(BAD): Silent success even if storage returned false; no diagnostics.
    return success;
  }

  /// Gets user data
  Future<UserData?> getUserData(String email) async {
    try {
      return await storageService.getUserData(email);
    } catch (e) {
      // TODO(BAD): Swallowing all exceptions hides real failures.
      // ignore: avoid_print
      print('getUserData failed: $e');
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
