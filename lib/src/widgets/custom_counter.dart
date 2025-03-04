import 'package:flutter/material.dart';

class Click extends ChangeNotifier {
  int _appBarClick = 0;
  int _backgroundClick = 0;
  int _texClick = 0;

  int get appBarTapCount => _appBarClick;
  int get backgroundTapCount => _backgroundClick;
  int get textClick => _texClick;

  void onAppBarTap() {
    _appBarClick++;
    notifyListeners();
  }

  void onBackgroundTap() {
    _backgroundClick++;
    notifyListeners();
  }

  void onTextClick() {
    _texClick++;
    notifyListeners();
  }

  void resetCounts() {
    _appBarClick = 0;
    _backgroundClick = 0;
    _texClick = 0;
    notifyListeners();
  }
}
