import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

const String userKey = 'users';
const String testEmail = 'test@gmail.com';

String colorToHex(Color color) =>
    // ignore: deprecated_member_use
    '#${color.alpha.toRadixString(16).padLeft(2, '0')}'
    // ignore: deprecated_member_use
    '${color.red.toRadixString(16).padLeft(2, '0')}'
    // ignore: deprecated_member_use
    '${color.green.toRadixString(16).padLeft(2, '0')}'
    // ignore: deprecated_member_use
    '${color.blue.toRadixString(16).padLeft(2, '0')}';

Color colorFromHex(String hex) {
  final buffer = StringBuffer();
  if (hex.length == 7) buffer.write('ff'); // if no alpha provided, set to ff
  buffer.write(hex.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

class LocalStorageService {
  static Future<void> saveUserColors({
    required Color backgroundColor,
    required Color appBarColor,
    required Color textColor,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final colorsMap = {
      'backgroundColor': colorToHex(backgroundColor),
      'appBarColor': colorToHex(appBarColor),
      'textColor': colorToHex(textColor),
    };
    Map<String, dynamic> users = {};
    final usersString = prefs.getString(userKey);
    if (usersString != null) {
      users = Map<String, dynamic>.from(jsonDecode(usersString));
    }
    users[testEmail] = {
      'colors': colorsMap,
    };
    await prefs.setString(userKey, jsonEncode(users));
  }

  static Future<Map<String, Color>?> loadUserColors() async {
    final prefs = await SharedPreferences.getInstance();
    final usersString = prefs.getString(userKey);
    if (usersString == null) return null;
    final users = Map<String, dynamic>.from(jsonDecode(usersString));
    if (!users.containsKey(testEmail)) return null;
    final userData = users[testEmail];
    if (userData == null || userData['colors'] == null) return null;
    final colors = Map<String, dynamic>.from(userData['colors']);
    return {
      'backgroundColor': colorFromHex(colors['backgroundColor']),
      'appBarColor': colorFromHex(colors['appBarColor']),
      'textColor': colorFromHex(colors['textColor']),
    };
  }
}

