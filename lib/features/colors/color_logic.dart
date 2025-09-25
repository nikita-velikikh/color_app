import 'dart:math';
import 'package:color_aap/core/models/models.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:flutter/material.dart';
/// Logic for color management
class ColorLogic {
  /// Email of the user
  final String email;
  /// Storage service for storing user data
  final SharedPrefsStorage storageService;
  /// Random number generator
  late  Random random = Random();
  /// Clarity of the color
  /// Generate range color
  final int transparencyValue = 255;
  /// Generate range color
  final int generateRangeColor = 256;

  /// Constructor for ColorLogic
  ColorLogic({
    required this.email,
    required this.storageService,
  }) {
    random = Random();
  }

  /// Generates a random color using ARGB values
  Color generateRandomColor() {
    return Color.fromARGB(
      transparencyValue,
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
