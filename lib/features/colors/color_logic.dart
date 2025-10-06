import 'dart:math';
import 'package:color_aap/core/models/models.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:flutter/material.dart';

/// Logic for color management
class ColorLogic extends ChangeNotifier {
  /// Email of the user
  final String _email;

  /// Storage service for storing user data
  final SharedPrefsStorage _storageService;

  /// Random number generator
  late Random _random = Random();

  /// Clarity of the color
  final int _transparencyValue = 255;

  /// Generate range color
  final int _generateRangeColor = 256;

  Color _backgroundColor = Colors.black;
  Color _appBarColor = Colors.white;
  Color _textColor = Colors.white;
  int _counter = 0;

  /// Constructor for ColorLogic
  ColorLogic({
    required String email,
    required SharedPrefsStorage storageService,
  }) : _email = email, _storageService = storageService {
    _random = Random();
    loadAndShowUserColors();
  }

  /// Generates a random color using ARGB values
  Color _generateRandomColor() {
    return Color.fromARGB(
      _transparencyValue,
      _random.nextInt(_generateRangeColor),
      _random.nextInt(_generateRangeColor),
      _random.nextInt(_generateRangeColor),
    );
  }

  /// Loads user's saved color preferences from local storage
  Future<UserColors?> _loadUserColors() async {
    try {
      return await _storageService.getUserColors(_email);
    } catch (e) {
      debugPrint('Error in loadUserColors: $e');

      return null;
    }
  }

  /// Saves the current color preferences to local storage
  Future<void> _saveColor({
    required Color backgroundColor,
    required Color appBarColor,
    required Color textColor,
  }) async {
    final userColors = UserColors(
      backgroundColor: backgroundColor,
      appBarColor: appBarColor,
      textColor: textColor,
    );

    await _storageService.saveUserColors(_email, userColors);
  }

  /// Changes the background color and increment counter
  void _changeBackgroundColor(Color color) {
    _backgroundColor = color;
    _saveAndNotify();
  }

  /// Changes the app bar color
  void _changeAppBarColor(Color color) {
    _appBarColor = color;
    _saveAndNotify();
  }

  /// Changes the text color
  void _changeTextColor(Color color) {
    _textColor = color;
    _saveAndNotify();
  }

  /// Resets the counter
  void _resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  /// Changes the counter
  void _incrementCounter() {
    _counter++;
    notifyListeners();
  }

  /// Saves the current color preferences to local storage
  void _saveAndNotify() {
    _saveColor(
      backgroundColor: _backgroundColor,
      appBarColor: _appBarColor,
      textColor: _textColor,
    );
    notifyListeners();
  }
}

/// logic for color screen
extension ColorScreenUseCase on ColorLogic {
  /// Changes all colors and saves the change
  void handleBackgroundTap() {
    _changeBackgroundColor(_generateRandomColor());
    _changeTextColor(_generateRandomColor());
    _incrementCounter();
  }

  /// change color on click
  void handleTextTap() {
    _changeTextColor(_generateRandomColor());
  }

  /// change color and reset counter on click
  void handleAppBarTap() {
    _changeAppBarColor(_generateRandomColor());
    _resetCounter();
  }

  /// change color on click button
  void handleButtonTap(Color color) {
    _changeBackgroundColor(color);
  }

  /// Loads user's saved color preferences from local storage
  Future<void> loadAndShowUserColors() async {
    final userColors = await _loadUserColors();
    if (userColors != null) {
      _backgroundColor = userColors.backgroundColor;
      _appBarColor = userColors.appBarColor;
      _textColor = userColors.textColor;
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      notifyListeners();
    }
  }

  /// Getters for the color preferences
  Color get backgroundColor => _backgroundColor;

  /// Getter for the app bar color
  Color get appBarColor => _appBarColor;

  /// Getter for the text color
  Color get textColor => _textColor;

  /// Getter for the counter
  int get counter => _counter;

  /// Getter for the email
  String get email => _email;
}
