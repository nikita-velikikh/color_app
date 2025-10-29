import 'package:auto_route/auto_route.dart';
import 'package:color_aap/core/navigation/navigation.gr.dart';
import 'package:color_aap/core/services/service_locator.dart';
import 'package:color_aap/core/widgets/base_dialog.dart';
import 'package:color_aap/features/auth/auth_logic.dart';
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
    context.router.maybePop();
  }

  /// Shows a confirmation dialog for deleting user account

  void showDeleteDialog(BuildContext context) {
    BaseDialog.show(
      context,
      DialogParams(
        title: S.of(context).titleSnowDialog,
        description: S.of(context).titleSnowDialog,
        secondButtonText: S.of(context).cancelDialog,
        buttonText: S.of(context).yesDialog,
        onButtonPressed: () async {
          final authLogic = serviceLocator.get<AuthLogic>();
          await authLogic.logout();

          if (context.mounted) {
            await navigateToAuthScreen(context);
          }
        },
      ),
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
          icon: const Icon(Icons.logout, color: Colors.black),
          onPressed: () async {
            final authLogic = serviceLocator.get<AuthLogic>();
            await authLogic.logout();

            if (context.mounted) {
              await navigateToAuthScreen(context);
            }
          },
        ),
      ],
    );
  }
}
