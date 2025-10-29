import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Logic icon button
class LanguageButtonLogic extends ChangeNotifier {
  ColorsLocale _currentLanguage = ColorsLocale.en;

  /// language
  final String languageKey = 'language';

  /// Current language
  ColorsLocale get currentLanguage => _currentLanguage;

  /// Logic change language
  Future<void> changeLanguage(String language) async {
    _currentLanguage = ColorsLocale.fromString(language);
    await saveLanguage(_currentLanguage);
    notifyListeners();
  }

  /// Update Shared Preferences about language
  Future<void> saveLanguage(ColorsLocale language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageKey, language.localeString());
  }

  /// Use Shared prefences for loading language
  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString(languageKey);
    if (savedLanguage == null) {
      return;
    }
    final locale = ColorsLocale.fromString(savedLanguage);

    _currentLanguage = locale;
    notifyListeners();
  }
}

/// Enum representing supported languages/locales.
enum ColorsLocale {
  /// English language.
  en,

  /// Ukrainian language.
  uk;

  /// Returns the locale string identifier (e.g., 'en' or 'uk').
  String localeString() {
    switch (this) {
      case ColorsLocale.en:
        return 'en';
      case ColorsLocale.uk:
        return 'uk';
    }
  }

  /// Returns the flag emoji for the locale.
  String flag() {
    switch (this) {
      case ColorsLocale.en:
        return '🇬🇧';
      case ColorsLocale.uk:
        return '🇺🇦';
    }
  }

  /// Returns a [Locale] object corresponding to this enum value.
  Locale getLocale() => Locale(localeString());

  /// Returns the [ColorsLocale] corresponding to the given [str], or
  /// [ColorsLocale.en] as fallback.
  static ColorsLocale fromString(String str) {
    for (final element in ColorsLocale.values) {
      if (str == element.localeString()) {
        return element;
      }
    }

    return ColorsLocale.en;
  }
  /// Returns the full display name of the language
  ///  (e.g., 'English', 'Українська').
  String fullString() {
    switch (this) {
      case ColorsLocale.en:
        return 'English';
      case ColorsLocale.uk:
        return 'Українська';
    }
  }
}
