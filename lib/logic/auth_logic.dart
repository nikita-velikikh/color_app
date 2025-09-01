import 'package:color_aap/hashing_service.dart';
import 'package:color_aap/local_storage_service.dart';
import 'package:color_aap/models.dart';

class AuthLogic {
  final LocalStorageService storageService;
  final HashingService hashingService;
  AuthLogic({
    required this.storageService,
    required this.hashingService,
  });

  /// Saves the authenticated user's email
  Future<void> saveLastEmail(String email) async {
    await storageService.saveLastEmail(email);
  }

  /// Handles login
  Future<String?> handleLogin(String email, String password) async {
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
          return "Invalid password";
        }
      } else {
        return "User data not found";
      }
    } else {
      return "User not found";
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
