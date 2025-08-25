import 'dart:math';
import 'package:color_aap/local_storage_service.dart';
import 'package:color_aap/models.dart';
import 'package:flutter/material.dart';

class ColorLogic {
  final String email;
  final LocalStorageService _storageService;

  ColorLogic({
    required this.email,
    required LocalStorageService storageService,
  }) : _storageService = storageService;

  /// Generates a random color using ARGB values
  Color generateRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  /// Loads user's saved color preferences from local storage
  Future<UserColors?> loadUserColors() async {
    try {
      return await _storageService.getUserColors(email);
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

    await _storageService.saveUserColors(email, userColors);
  }
}
