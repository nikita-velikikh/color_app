import 'package:color_aap/app_entry.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 10));

  runApp(const AppEntry());
}
