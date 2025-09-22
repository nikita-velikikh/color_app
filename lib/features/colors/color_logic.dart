import 'dart:math';
import 'package:color_aap/core/models/models.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:flutter/material.dart';

class ColorLogic {
  final String email;
  final SharedPrefsStorage storageService;
  late final Random random;
  final int clarity = 255;
  final int generateRangeColor = 256;

  ColorLogic({
    required this.email,
    required this.storageService,
  }) {
    random = Random();
  }

  /// Generates a random color using ARGB values
  Color generateRandomColor() {
    return Color.fromARGB(
      clarity,
      random.nextInt(generateRangeColor),
      random.nextInt(generateRangeColor),
      random.nextInt(generateRangeColor),
    );
  }

  /// Loads user's saved color preferences from local storage
  Future<UserColors?> loadUserColors() async {
    try {
      return await storageService.getUserColors(email);
    } catch (e) {
      debugPrint('Error in loadUserColors: $e');

      return null;
    }
  }

  /// Saves the current color preferences to local storage
  Future<void> saveColor({
    required Color backgroundColor,
    required Color appBarColor,
    required Color textColor,
  }) async {
    final userColors = UserColors(
      backgroundColor: backgroundColor,
      appBarColor: appBarColor,
      textColor: textColor,
    );

    await storageService.saveUserColors(email, userColors);
  }
}
