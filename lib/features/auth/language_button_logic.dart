
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
/// Logic icon button 
class LanguageButtonLogic extends ChangeNotifier {
  String _currentLanguage = 'en';
  Locale _currentLocale = const Locale('en');
/// Current locale
  Locale get currentLocale => _currentLocale;
  /// Current language
  String get currentLanguage => _currentLanguage;
/// Language cases
  String getCurrentLanguageFlag() {
    switch (_currentLanguage) {
      case 'en':
        return '🇬🇧';
      case 'uk':
        return '🇺🇦';
      default:
        return '🇬🇧';
    }
  }
/// Logic change language
  Future<void> changeLanguage(String language) async {
    _currentLanguage = language;
    _currentLocale = Locale(language);
    await saveLanguage(language);
    notifyListeners();
  }
/// Update Shared Preferences about language 
  Future<void> saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
  }
/// Use Shared prefences for loading language 
  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('language');
    if (savedLanguage != null) {
      _currentLanguage = savedLanguage;
      _currentLocale = Locale(savedLanguage);
      notifyListeners();
    }
  }
}
