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
    return storageService.createUser(email, hashedPassword);
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
