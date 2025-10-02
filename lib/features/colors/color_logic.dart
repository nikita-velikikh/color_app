import 'dart:math';
import 'package:color_aap/core/models/models.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:flutter/material.dart';

/// Logic for color management
class ColorLogic extends ChangeNotifier {
  /// Email of the user
  final String email;

  /// Storage service for storing user data
  final SharedPrefsStorage storageService;

  /// Random number generator
  late Random random = Random();

  /// Clarity of the color
  final int transparencyValue = 255;

  /// Generate range color
  final int generateRangeColor = 256;

  Color _backgroundColor = Colors.black;
  Color _appBarColor = Colors.white;
  Color _textColor = Colors.white;
  int _counter = 0;

  /// Getters for the color preferences
  Color get backgroundColor => _backgroundColor;

  /// Getter for the app bar color
  Color get appBarColor => _appBarColor;

  /// Getter for the text color
  Color get textColor => _textColor;

  /// Getter for the counter
  int get counter => _counter;

  /// Constructor for ColorLogic
  ColorLogic({
    required this.email,
    required this.storageService,
  }) {
    random = Random();
    loadAndShowUserColors();
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
  Future<void> loadAndShowUserColors() async {
    final userColors = await loadUserColors();
    if (userColors != null) {
      _backgroundColor = userColors.backgroundColor;
      _appBarColor = userColors.appBarColor;
      _textColor = userColors.textColor;
      notifyListeners();
    }
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

  /// Changes the background color
  void handleBackgroundTap(Color color) {
    _backgroundColor = color;
    _saveAndNotify();
  }

  /// Changes the app bar color 
  void handleAppBarTap(Color color) {
    _appBarColor = color;
    _saveAndNotify();
  }

  /// Changes the text color
  void handleTextTap(Color color) {
    _textColor = color;
    _saveAndNotify();
  }

  /// Resets the counter
  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  /// Changes the counter
  void changeCounter() {
    _counter++;
    notifyListeners();
  }

  /// Saves the current color preferences to local storage
  void _saveAndNotify() {
    saveColor(
      backgroundColor: _backgroundColor,
      appBarColor: _appBarColor,
      textColor: _textColor,
    );
    notifyListeners();
  }

  /// Changes all colors and saves the change
  void changeAllColors() {
    handleBackgroundTap(generateRandomColor());
    handleAppBarTap(generateRandomColor());
    handleTextTap(generateRandomColor());
    changeCounter();
  }
}
