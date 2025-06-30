import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

const String userKey = 'users';

Future<Map<String,dynamic>> getUserMap() async {
  final prefs = await SharedPreferences.getInstance();
  final usersString = prefs.getString(userKey);
  if(usersString == null)return {};
  return Map<String,dynamic>.from(jsonDecode(usersString));
}

Future<void> saveUserMap(Map<String,dynamic>users)async{
  final prefs = await SharedPreferences.getInstance();
  final usersString = jsonEncode(users);
  await prefs.setString(userKey, usersString);
}


Future<Map<String, dynamic>> getUserColors(String username) async {
  final userMap = await getUserMap();
  if (userMap.containsKey(username)) {
    return Map<String, dynamic>.from(userMap[username]);
  }
  return {};
}


Future<void> saveUserColors(String username, Map<String, dynamic> colors) async {
  final userMap = await getUserMap();
  userMap[username] = colors;
  await saveUserMap(userMap);
}
// ignore: deprecated_member_use
String colorToHex(Color color) => '#${color.value.toRadixString(16).padLeft(8, '0')}';  
Color colorFromHex(String hex) => Color(int.parse(hex.replaceFirst('#', ''), radix: 16));

