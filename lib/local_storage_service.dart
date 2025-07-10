import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'models.dart';

class LocalStorageService {
  static const String _usersKey = 'users';

  // TODO: remove this after testing
  static const String _testEmail = 'test@gmail.com';

  Future<void> saveUserColors(
    Color backgroundColor,
    Color appBarColor,
    Color textColor,
  ) async {
    final userColors = UserColors(
      backgroundColor: backgroundColor,
      appBarColor: appBarColor,
      textColor: textColor,
    );
    final userData = await _getUserDataByEmail(_testEmail);
    final newUserData = UserData(colors: userColors);
    await _saveUserDataByEmail(_testEmail, newUserData);
  }

  Future<UserColors?> getUserColors() async {
    final userData = await _getUserDataByEmail(_testEmail);
    if (userData == null) return null;

    return userData.colors;
  }

  Future<UsersMap> _getUsersMap() async {
    final prefs = await SharedPreferences.getInstance();
    final usersString = prefs.getString(_usersKey);
    if (usersString == null) return UsersMap(users: {});
    final usersMap = UsersMap.fromJson(jsonDecode(usersString));
    return usersMap;
  }

  Future<bool> _saveUsersMap(UsersMap usersMap) async {
    final prefs = await SharedPreferences.getInstance();
    final usersString = jsonEncode(usersMap.toJson());
    final result = await prefs.setString(_usersKey, usersString);
    return result;
  }

  Future<UserData?> _getUserDataByEmail(String email) async {
    final usersMap = await _getUsersMap();
    if (!usersMap.users.containsKey(email)) return null;
    return usersMap.users[email];
  }

  Future<void> _saveUserDataByEmail(
    String email,
    UserData userData,
  ) async {
    final usersMap = await _getUsersMap();
    final updatedUsers = Map<String, UserData>.from(usersMap.users);
    updatedUsers[email] = userData;
    await _saveUsersMap(UsersMap(users: updatedUsers));
  }
}
