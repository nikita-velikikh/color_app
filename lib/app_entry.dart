import 'package:color_aap/generated/l10n.dart';
import 'package:color_aap/local_storage_service.dart';
import 'package:color_aap/src/screens/color_screen.dart';
import 'package:color_aap/src/screens_login/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

  @override
  State<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  String? lastEmail;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkLastEmail();
  }

  Future<void> _checkLastEmail() async {
    final service = LocalStorageService();
    final email = await service.getLastEmail();
    setState(() {
      lastEmail = email;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    late final Widget home;

    if (isLoading) {
      home = const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      if (lastEmail == null || lastEmail!.isEmpty) {
        home = const AuthScreen();
      } else {
        home = ColorScreen(email: lastEmail!);
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: home,
    );
  }
}
