import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'models.dart';

// TODO: delete after connecting account creation
const testEmail = 'test@gmail.com';

class LocalStorageService {
  static const String _usersKey = 'users';

  Future<bool> createUser(String email) async {
    const defaultColors = UserColors(
      backgroundColor: Colors.white,
      appBarColor: Colors.white,
      textColor: Colors.black,
    );
    const userData = UserData(colors: defaultColors);

    final usersMap = await getUsersMap();
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
}
