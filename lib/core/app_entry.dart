import 'package:color_aap/core/navigation/app_router.dart';
import 'package:color_aap/core/navigation/navigation.gr.dart';
import 'package:color_aap/core/services/service_locator.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:color_aap/features/auth/language_button_logic.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

/// Main application widget that handles authentication state and routing
class AppEntry extends StatefulWidget {
  /// Constructor for AppEntry
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
    final service = serviceLocator.get<SharedPrefsStorage>();
    final email = await service.getLastEmail();
    setState(() {
      lastEmail = email;
      isLoading = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (email == null || email.isEmpty) {
        _appRouter.pushAndPopUntil(
          const AuthRoute(),
          predicate: (route) => false,
        );
      } else {
        _appRouter.pushAndPopUntil(
          ColorRoute(email: email),
          predicate: (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageButtonLogic>(
      create: (context) {
        final languageLogic = serviceLocator.get<LanguageButtonLogic>();
        languageLogic.loadLanguage();

        return languageLogic;
      },
      child: Consumer<LanguageButtonLogic>(
        builder: (context, languageLogic, child) {
          return MaterialApp.router(
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: false,
            locale: languageLogic.currentLocale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              if (locale != null) {
                for (final supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode) {
                    return supportedLocale;
                  }
                }
              }

              return supportedLocales.first;
            },
          );
        },
      ),
    );
  }
}
