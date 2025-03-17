import 'package:color_aap/src/screens/color_screen.dart';
import 'package:color_aap/src/screens_login/LogoText.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoText(),
    );
  }
}
