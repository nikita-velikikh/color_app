import 'package:color_aap/core/widgets/base_dialog.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Widget that displays social login buttons for GitHub and GitLab
class IconButtons extends StatelessWidget {
  /// Constructor for IconButtons
  const IconButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () => _InProgressDialog.show(context, "GitHub"),
          icon: Image.asset('assets/images/github.png', width: 24),
          label: const Text(
            "GitHub",
            style: TextStyle(color: Color.fromARGB(255, 101, 72, 72)),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        const SizedBox(width: 13),
        ElevatedButton.icon(
          onPressed: () => _InProgressDialog.show(context, "GitLab"),
          icon: Image.asset('assets/images/gitlab.png', width: 24),
          label: const Text(
            "GitLab",
            style: TextStyle(color: Color.fromARGB(255, 96, 58, 58)),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}

class _InProgressDialog {
  static void show(BuildContext context, String title) {
    final params = DialogParams(
      title: title,
      description: S.of(context).inDevelopment,
      buttonText: S.of(context).cancel,
      content: const CircularProgressIndicator(),
    );
    BaseDialog.show(context, params);
  }
}
