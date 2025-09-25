import 'package:auto_route/auto_route.dart';
import 'package:color_aap/core/navigation/navigation.gr.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Custom app bar widget with user management actions
/// and customizable appearance
class CustomAppBar extends StatelessWidget {
  /// Constructor for CustomAppBar
  const CustomAppBar({
    required this.appBarText,
    required this.textColor,
    required this.backgroundColor,
    required this.isCenterTirtle,
    required this.userEmail,
    super.key,
  });

  /// Text for the app bar
  final String appBarText;
  /// Text color for the app bar
  final Color textColor;
  /// Background color for the app bar
  final Color backgroundColor;
  /// Whether the title is centered
  final bool isCenterTirtle;
  /// Email of the user
  final String userEmail;

  /// Navigates to the authentication screen, replacing the current route
  Future<void> navigateToAuthScreen(BuildContext context) async {
    await context.router
        .pushAndPopUntil(const AuthRoute(), predicate: (route) => false);
  }

  /// Closes the current dialog or navigates back
  void navigatePop(BuildContext context) {
    Navigator.pop(context);
  }

  /// Shows a confirmation dialog for deleting user account
  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            S.of(context).titleSnowDialog,
            textAlign: TextAlign.center,
          ),
          content: Text(
            S.of(context).descriptionSnowDialog,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                navigatePop(context);
              },
              child: Text(S.of(context).cancelDialog),
            ),
            TextButton(
              onPressed: () async {
                navigatePop(context);
                final service = SharedPrefsStorage();
                await service.deleteUserData(userEmail);

                if (context.mounted) {
                  await navigateToAuthScreen(context);
                }
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text(S.of(context).yesDialog),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarText,
        style: TextStyle(color: textColor),
      ),
      centerTitle: isCenterTirtle,
      backgroundColor: backgroundColor,
      actions: [
        IconButton(
          onPressed: () {
            showDeleteDialog(context);
          },
          icon: const Icon(Icons.delete_forever, color: Colors.black),
        ),
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.black),
          onPressed: () async {
            final service = SharedPrefsStorage();
            await service.deleteLastEmail();

            if (context.mounted) {
              await navigateToAuthScreen(context);
            }
          },
        ),
      ],
    );
  }
}
