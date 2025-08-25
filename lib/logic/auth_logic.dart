import 'package:color_aap/local_storage_service.dart';
import 'package:color_aap/models.dart';

class AuthLogic {
  final LocalStorageService _storageService;

  AuthLogic({required LocalStorageService storageService})
      : _storageService = storageService;

  /// Saves the authenticated user's email
  Future<void> saveLastEmail(String email) async {
    await _storageService.saveLastEmail(email);
  }

  /// Gets the last saved email
  Future<String?> getLastEmail() async {
    return _storageService.getLastEmail();
  }

  /// Checks if user exists
  Future<bool> userExists(String email) async {
    return _storageService.checkUserExists(email);
  }

  /// Creates a new user
  Future<bool> createUser(String email, String password) async {
    return _storageService.createUser(email, password);
  }

  /// Gets user data
  Future<UserData?> getUserData(String email) async {
    try {
      return await _storageService.getUserData(email);
    } catch (e) {
      return null;
    }
  }

  /// Deletes the last email (logout)
  Future<void> logout() async {
    await _storageService.deleteLastEmail();
  }

  /// Checks if user is logged in
  Future<bool> isLoggedIn() async {
    final email = await getLastEmail();
    return email != null && email.isNotEmpty;
  }
}
