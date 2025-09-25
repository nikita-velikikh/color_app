import 'package:color_aap/core/app_entry.dart';
import 'package:color_aap/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

/// Entry point of the application that initializes Flutter and launches the app
void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  await registerDependencies();

  runApp(const AppEntry());
}
