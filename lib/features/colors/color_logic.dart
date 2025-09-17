import 'dart:math';
import 'package:color_aap/core/models/models.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ColorLogic {
  final String email;
  final SharedPrefsStorage storageService;
  final Random random = Random();

  ColorLogic({
    required this.email,
    required this.storageService,
  });

  /// Generates a random color using ARGB values
  /// Constants for color generation
  static const maxColorValue = 255; // alpha channel and max color value
  static const maxRandomValue = 256; // nextInt is exclusive

  Color generateRandomColor() {
    return Color.fromARGB(
      maxColorValue, // alpha channel
      random.nextInt(maxRandomValue),
      random.nextInt(maxRandomValue),
      random.nextInt(maxRandomValue),
    );
  }

  /// Loads user's saved color preferences from local storage
  Future<UserColors?> loadUserColors() async {
    try {
      return await storageService.getUserColors(email);
    } catch (e) {
      if (!kReleaseMode) {
        debugPrint('Error in loadUserColors: $e');
      }
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
