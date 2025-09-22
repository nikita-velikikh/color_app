import 'package:auto_route/auto_route.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Splash screen widget that shows loading indicator
@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircularProgressIndicator
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              strokeWidth: 3.0,
            ),
            SizedBox(height: 16),

            Text(
              S.of(context).downloading,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
