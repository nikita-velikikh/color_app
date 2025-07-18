import 'package:color_aap/generated/l10n.dart';
import 'package:color_aap/src/screens/color_screen.dart';
import 'package:color_aap/src/screens_login/auth_screen.dart';
import 'package:color_aap/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

  @override
  State<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  Widget? _startScreen;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    final email = await LocalStorageService().getCurrentUser();
    setState(() {
      if (email != null) {
        _startScreen = const ColorScreen();
      } else {
        _startScreen = const AuthScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: _startScreen ??
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      routes: {
        '/color_screen': (context) => const ColorScreen(),
        '/login': (context) => const AuthScreen(),
      },
    );
  }
}
