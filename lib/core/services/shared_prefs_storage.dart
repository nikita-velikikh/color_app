import 'dart:convert';
import 'package:color_aap/core/models/models.dart';
import 'package:color_aap/core/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Implementation of StorageService using SharedPreferences
interface class SharedPrefsStorage implements StorageService {
  final String _usersKey = 'users';
  final String _lastEmailKey = "last_email";

  @override
  Future<void> saveLastEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastEmailKey, email);
  }

  @override
  Future<void> deleteLastEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lastEmailKey);
  }

  @override
  Future<String?> getLastEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastEmailKey);
  }

  @override
  Future<bool> checkUserExists(String email) async {
    final usersMap = await getUsersMap();
    return usersMap.users.containsKey(email);
  }

  @override
  Future<bool> createUser(String email, String hashedPassword) async {
    final usersMap = await getUsersMap();
    if (usersMap.users.containsKey(email)) {
      return false;
    }
    const defaultColors = UserColors(
      backgroundColor: Colors.white,
      appBarColor: Colors.white,
      textColor: Colors.black,
    );

    final userData =
        UserData(password: hashedPassword, email: email, colors: defaultColors);

    final updatedUsersMap = usersMap.copyWith(
      users: Map.from(usersMap.users)..[email] = userData,
    );

    final result = await saveUsersMap(updatedUsersMap);
    return result;
  }

  @override
  Future<UserColors> getUserColors(String email) async {
    final userData = await getUserData(email);
    return userData.colors;
  }

  @override
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

  @override
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

  @override
  Future<void> deleteUserData(String email) async {
    final usersMap = await getUsersMap();

    if (usersMap.users.containsKey(email)) {
      final newUsersMap = usersMap.copyWith(
        users: Map.from(usersMap.users)..remove(email),
      );
      await saveUsersMap(newUsersMap);
    }
  }

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
