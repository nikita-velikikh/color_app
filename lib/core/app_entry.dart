import 'package:color_aap/core/navigation/navigation.dart';
import 'package:color_aap/core/navigation/navigation.gr.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Main application widget that handles authentication state and routing
class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

  @override
  State<AppEntry> createState() => _AppEntryState();
}

/// State class for AppEntry that manages authentication
///  flow and app initialization
class _AppEntryState extends State<AppEntry> {
  String? lastEmail;
  bool isLoading = true;
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    _checkLastEmail();
  }

  /// Checks if user is already logged in by retrieving
  /// the last email from storage
  Future<void> _checkLastEmail() async {
    final service = SharedPrefsStorage();
    final email = await service.getLastEmail();
    setState(() {
      lastEmail = email;
      isLoading = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (lastEmail == null) {
        _appRouter.pushAndPopUntil(
          const AuthRoute(),
          predicate: (_) => false,
        );
      } else {
        _appRouter.pushAndPopUntil(
          ColorRoute(
              email: lastEmail ??
                  ''), // This should never happen as we check lastEmail != null
          predicate: (_) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
