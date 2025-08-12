import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'models.dart';

class LocalStorageService {
  static const String _usersKey = 'users';
  static const String _lastEmailKey = "last_email";

  Future<void> saveLastEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastEmailKey, email);
  }

  Future<void> deleteLastEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lastEmailKey);
  }

  Future<String?> getLastEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastEmailKey);
  }

  Future<bool> checkUserExists(String email) async {
    final usersMap = await getUsersMap();
    return usersMap.users.containsKey(email);
  }

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
    final userData =
        UserData(password: password, email: email, colors: defaultColors);

    final updatedUsersMap = usersMap.copyWith(
      users: Map.from(usersMap.users)..[email] = userData,
    );

    final result = await saveUsersMap(updatedUsersMap);
    return result;
  }

  Future<UserColors> getUserColors(String email) async {
    final userData = await getUserData(email);
    return userData.colors;
  }

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

  Future<UsersMap> getUsersMap() async {
    final prefs = await SharedPreferences.getInstance();
    final usersMapJson = prefs.getString(_usersKey);
    if (usersMapJson == null) {
      return const UsersMap(users: {});
    }
    final usersMapJsonDecoded = jsonDecode(usersMapJson);
    return UsersMap.fromJson(usersMapJsonDecoded);
  }

  Future<bool> saveUsersMap(UsersMap usersMap) async {
    final prefs = await SharedPreferences.getInstance();
    final usersMapJson = usersMap.toJson();
    final usersMapJsonEncoded = jsonEncode(usersMapJson);
    final result = await prefs.setString(_usersKey, usersMapJsonEncoded);
    return result;
  }

  Future<void> handleExit() async {
    await deleteLastEmail();
  }

  Future<void> deleteUserData(String email) async {
    final usersMap = await getUsersMap();

    final newUsers = <String, UserData>{};
    for (final entry in usersMap.users.entries) {
      if (entry.key != email) {
        newUsers[entry.key] = entry.value;
      }
    }

    final newUsersMap = UsersMap(users: newUsers);
    await saveUsersMap(newUsersMap);
  }
}
