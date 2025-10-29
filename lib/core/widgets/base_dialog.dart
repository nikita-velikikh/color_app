import 'package:flutter/material.dart';

/// A customizable base dialog widget for displaying modal dialogs.
///
/// Use [BaseDialog] with a [DialogParams] object to show an alert dialog
/// with configurable title, description, buttons, and optional content.
/// Use [BaseDialog.show] for convenience to display it modally.
class BaseDialog extends StatelessWidget {
  /// The parameters for dialog display and actions.
  const BaseDialog({required this.params});

  /// The parameters containing dialog configuration and actions.
  final DialogParams params;

  /// Shows the [BaseDialog] using the given [context] and [params].
  ///
  /// Displays a modal dialog that cannot be dismissed by tapping outside.
  ///
  /// [context] - The build context to display the dialog in.
  /// [params] - Configuration for the dialog's content and actions.
  static void show(BuildContext context, DialogParams params) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BaseDialog(
          params: params,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = params.content;
    final secondButtonText = params.secondButtonText;

    return AlertDialog(
      title: Text(
        params.title,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(params.description),
          if (content != null) ...[
            const SizedBox(height: 20),
            content,
          ],
        ],
      ),
      actions: [
        if (secondButtonText != null)
          TextButton(
            onPressed: () {
              params.onSecondButtonPressed?.call();

              Navigator.of(context).pop();
            },
            child: Text(secondButtonText),
          ),
        TextButton(
          onPressed: () {
            params.onButtonPressed?.call();

            Navigator.of(context).pop();
          },
          child: Text(params.buttonText),
        ),
      ],
    );
  }
}

/// A class to encapsulate the parameters required to display a custom dialog.
///
/// [DialogParams] provides options for required and optional fields to
/// configure
/// the presentation and behavior of a custom dialog in the UI.
class DialogParams {
  /// The primary title of the dialog. Displayed at the top of the dialog.
  final String title;

  /// The description or body text shown within the dialog.
  final String description;

  /// The main button text, usually for the primary action.
  final String buttonText;

  /// The callback function to invoke when the main button is pressed.
  /// This action is optional and may be null.
  final void Function()? onButtonPressed;

  /// The text for the secondary button, if applicable.
  /// If null, the secondary button is not shown.
  final String? secondButtonText;

  /// The callback function to invoke when the secondary button is pressed.
  /// Optional and may be null.
  final void Function()? onSecondButtonPressed;

  /// Any custom widget content to display in addition to the [description].
  /// Optional and can be null.
  final Widget? content;

  /// Constructs a [DialogParams] instance with given configuration.
  ///
  /// [title], [description], and [buttonText] are required.
  /// Optional parameters allow for handling button actions and
  /// providing custom dialog content.
  DialogParams({
    required this.title,
    required this.description,
    required this.buttonText,
    this.onButtonPressed,
    this.secondButtonText,
    this.onSecondButtonPressed,
    this.content,
  });
}
