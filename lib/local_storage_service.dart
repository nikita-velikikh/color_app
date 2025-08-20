import 'dart:convert';
import 'package:color_aap/hashing.service.dart';
import 'package:color_aap/models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for managing local storage operations 
/// including user data and preferences
class LocalStorageService {
  static const String _usersKey = 'users';
  static const String _lastEmailKey = "last_email";

  /// Saves the last email used for login to persistent storage
  Future<void> saveLastEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastEmailKey, email);
  }

  /// Removes the last email from persistent storage
  Future<void> deleteLastEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lastEmailKey);
  }

  /// Retrieves the last email used for login from persistent storage
  Future<String?> getLastEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastEmailKey);
  }

  /// Checks if a user with the given email already exists in the system
  Future<bool> checkUserExists(String email) async {
    final usersMap = await getUsersMap();
    return usersMap.users.containsKey(email);
  }

  /// Creates a new user account with default color preferences
  Future<bool> createUser(String email, String password) async {
    final usersMap = await getUsersMap();
    if (usersMap.users.containsKey(email)) {
      return false;
    }
    const defaultColors = UserColors(
      backgroundColor: Colors.white,
      appBarColor: Colors.white,
      textColor: Colors.black,
    );

    final hashedPassword = HashingService.hashPassword(password);

    final userData =
        UserData(password: hashedPassword, email: email, colors: defaultColors);

    final updatedUsersMap = usersMap.copyWith(
      users: Map.from(usersMap.users)..[email] = userData,
    );

    final result = await saveUsersMap(updatedUsersMap);
    return result;
  }

  /// Retrieves the color preferences for a specific user
  Future<UserColors> getUserColors(String email) async {
    final userData = await getUserData(email);
    return userData.colors;
  }

  /// Updates the color preferences for a specific user
  Future<bool> saveUserColors(String email, UserColors colors) async {
    final usersMap = await getUsersMap();
    final userData = await getUserData(email);

    final newUserData = userData.copyWith(colors: colors);

    final updatedUsersMap = usersMap.copyWith(
      users: Map.from(usersMap.users)..[email] = newUserData,
    );

    final result = await saveUsersMap(updatedUsersMap);
    return result;
  }

  /// Returns the user data for the given email.
  /// Throws an [ArgumentError] if the user data is not found.
  Future<UserData> getUserData(String email) async {
    final usersMap = await getUsersMap();
    final userData = usersMap.users[email];

    if (userData == null) {
      throw ArgumentError('User data not found for email: $email');
    }

    return userData;
  }

  /// Retrieves the complete users map from persistent storage
  Future<UsersMap> getUsersMap() async {
    final prefs = await SharedPreferences.getInstance();
    final usersMapJson = prefs.getString(_usersKey);
    if (usersMapJson == null) {
      return const UsersMap(users: {});
    }
    final usersMapJsonDecoded = jsonDecode(usersMapJson);

    return UsersMap.fromJson(usersMapJsonDecoded as Map<String, dynamic>);
  }

  /// Saves the complete users map to persistent storage
  Future<bool> saveUsersMap(UsersMap usersMap) async {
    final prefs = await SharedPreferences.getInstance();
    final usersMapJson = usersMap.toJson();
    final usersMapJsonEncoded = jsonEncode(usersMapJson);
    final result = await prefs.setString(_usersKey, usersMapJsonEncoded);
    return result;
  }

  /// Removes user data for the specified email from the system
  Future<void> deleteUserData(String email) async {
    final usersMap = await getUsersMap();

    if (usersMap.users.containsKey(email)) {
      final newUsersMap = usersMap.copyWith(
        users: Map.from(usersMap.users)..remove(email),
      );
      await saveUsersMap(newUsersMap);
    }
  }
}
