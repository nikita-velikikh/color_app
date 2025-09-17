import 'dart:convert';
import 'package:color_aap/core/models/models.dart';
import 'package:color_aap/core/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure implementation of StorageService using flutter_secure_storage
 interface class SecureStorageService implements StorageService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final String _usersKey = 'secure_users';
  final String _lastEmailKey = "secure_last_email";

  @override
  Future<void> saveLastEmail(String email) async {
    await storage.write(key: _lastEmailKey, value: email);
  }

  @override
  Future<String?> getLastEmail() async {
    return storage.read(key: _lastEmailKey);
  }

  @override
  Future<void> deleteLastEmail() async {
    await storage.delete(key: _lastEmailKey);
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

    return saveUsersMap(updatedUsersMap);
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

    return saveUsersMap(updatedUsersMap);
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
    await storage.deleteAll();
  }

  /// Retrieves the complete users map from secure storage
  Future<UsersMap> getUsersMap() async {
    final usersMapJson = await storage.read(key: _usersKey);
    if (usersMapJson == null) {
      return const UsersMap(users: {});
    }

    final usersMapJsonDecoded = jsonDecode(usersMapJson);
    return UsersMap.fromJson(usersMapJsonDecoded as Map<String, dynamic>);
  }

  /// Saves the complete users map to secure storage
  Future<bool> saveUsersMap(UsersMap usersMap) async {
    final usersMapJson = usersMap.toJson();
    final usersMapJsonEncoded = jsonEncode(usersMapJson);
    await storage.write(key: _usersKey, value: usersMapJsonEncoded);
    return true;
  }
}
