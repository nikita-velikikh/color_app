import 'package:color_aap/src/screens_login/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:color_aap/local_storage_service.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appBarText,
    required this.textColor,
    required this.backgroundColor,
    required this.isCenterTirtle,
    required this.userEmail,
  });

  final String appBarText;
  final Color textColor;
  final Color backgroundColor;
  final bool isCenterTirtle;
  final String userEmail;
  final String titleSnowDialog = "Your data will be deleted!";
  final String cancelDialog = "Cancel";
  final String yesDialog = "Yes";

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            titleSnowDialog,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(cancelDialog),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                final service = LocalStorageService();
                await service.deleteUserData(userEmail);

                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AuthScreen()),
                  );
                }
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text(yesDialog),
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

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AuthScreen()),
            );
          },
        ),
      ],
    );
  }
}
