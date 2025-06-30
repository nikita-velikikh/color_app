import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

typedef JsonMap = Map<String, dynamic>;
typedef ColorMap = Map<String, Color>;
typedef EncodedColorMap = Map<String, String>;

class LocalStorageService {
  static const String _usersKey = 'users';
  static const String _colorsKey = 'colors';
  static const String _backgroundColorKey = 'backgroundColor';
  static const String _appBarColorKey = 'appBarColor';
  static const String _textColorKey = 'textColor';

  // TODO: remove this after testing
  static const String _testEmail = 'test@gmail.com';

  Future<void> saveUserColors(
    Color backgroundColor,
    Color appBarColor,
    Color textColor,
  ) async {
    final colorsMap = await _getColorsMapByEmail(_testEmail);
    if (colorsMap == null) return;

    colorsMap[_backgroundColorKey] = _colorToHex(backgroundColor);
    colorsMap[_appBarColorKey] = _colorToHex(appBarColor);
    colorsMap[_textColorKey] = _colorToHex(textColor);
    await _saveUserColorsByEmail(_testEmail, colorsMap);
  }

  Future<ColorMap?> getUserColors() async {
    final colorsMap = await _getColorsMapByEmail(_testEmail);
    if (colorsMap == null) return null;

    final backgroundColorString = colorsMap[_backgroundColorKey];
    final appBarColorString = colorsMap[_appBarColorKey];
    final textColorString = colorsMap[_textColorKey];

    final backgroundColor = _colorFromHex(backgroundColorString!);
    final appBarColor = _colorFromHex(appBarColorString!);
    final textColor = _colorFromHex(textColorString!);

    return {
      _backgroundColorKey: backgroundColor,
      _appBarColorKey: appBarColor,
      _textColorKey: textColor,
    };
  }

  String _colorToHex(Color color) =>
      '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';

  Color _colorFromHex(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 7) buffer.write('ff'); // if no alpha provided, set to ff
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// 1. Get shared prefs
  /// 2. Get users string by 'users' key
  /// 3. Decode users string to JsonMap
  /// 4. Return users map
  Future<JsonMap> _getUsersMap() async {
    final prefs = await SharedPreferences.getInstance();
    final usersString = prefs.getString(_usersKey);
    if (usersString == null) return {};
    final usersMap = jsonDecode(usersString) as JsonMap;
    return usersMap;
  }

  /// 1. Get shared prefs
  /// 2. Save users map to shared prefs
  Future<void> _saveUsersMap(JsonMap usersMap) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usersKey, jsonEncode(usersMap));
  }

  /// 1. Get users map
  /// 2. Check if users map contains email
  /// 3. Return user data by email
  Future<JsonMap?> _getUserDataByEmail(String email) async {
    final usersMap = await _getUsersMap();
    if (!usersMap.containsKey(email)) return null;
    return usersMap[email] as JsonMap?;
  }

  /// 1. Get users map
  /// 2. Save user data by email
  Future<void> _saveUserDataByEmail(
    String email,
    JsonMap userData,
  ) async {
    final usersMap = await _getUsersMap();
    usersMap[email] = userData;
    await _saveUsersMap(usersMap);
  }

  /// 1. Get user data by email
  /// 2. Check if user data contains colors
  /// 3. Return colors map
  Future<EncodedColorMap?> _getColorsMapByEmail(String email) async {
    final userData = await _getUserDataByEmail(email);
    if (userData == null || userData[_colorsKey] == null) return null;
    return userData[_colorsKey] as EncodedColorMap;
  }

  /// 1. Get user data by email
  /// 2. Check if user data contains colors
  /// 3. Save colors map to user data
  Future<void> _saveUserColorsByEmail(String email, EncodedColorMap colors) async {
    final userData = await _getUserDataByEmail(email);
    if (userData == null || userData[_colorsKey] == null) return;
    userData[_colorsKey] = colors;
    await _saveUserDataByEmail(email, userData);
  }
}
