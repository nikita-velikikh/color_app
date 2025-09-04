import 'package:color_aap/models.dart';

/// Abstract interface for storage operations
/// Defines contract for different storage implementations
abstract class StorageService {
  /// Saves the last email used for login
  Future<void> saveLastEmail(String email);

  /// Retrieves the last email used for login
  Future<String?> getLastEmail();

  /// Removes the last email from storage
  Future<void> deleteLastEmail();

  /// Checks if a user with the given email exists
  Future<bool> checkUserExists(String email);

  /// Creates a new user account
  Future<bool> createUser(String email, String hashedPassword);

  /// Retrieves user data for the given email
  Future<UserData> getUserData(String email);

  /// Retrieves color preferences for a specific user
  Future<UserColors> getUserColors(String email);

  /// Updates color preferences for a specific user
  Future<bool> saveUserColors(String email, UserColors colors);

  /// Removes user data for the specified email
  Future<void> deleteUserData(String email);

  /// Clears all stored data
  Future<void> clear();
}
