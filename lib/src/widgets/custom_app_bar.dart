import 'package:color_aap/generated/l10n.dart';
import 'package:color_aap/local_storage_service.dart';
import 'package:color_aap/src/screens_login/auth_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.appBarText,
    required this.textColor,
    required this.backgroundColor,
    required this.isCenterTirtle,
    required this.userEmail,
    super.key,
  });

  final String appBarText;
  final Color textColor;
  final Color backgroundColor;
  final bool isCenterTirtle;
  final String userEmail;

  Future<void> navigateToAuthScreen(BuildContext context) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthScreen()),
    );
  }

  void navigatePop(BuildContext context) {
    Navigator.pop(context);
  }

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
                final service = LocalStorageService();
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
            final service = LocalStorageService();
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
