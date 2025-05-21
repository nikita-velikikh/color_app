import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';

class ButtonsAndLines extends StatelessWidget {
  const ButtonsAndLines({
    super.key,
    required this.onTap,
    required this.textLoginButton,
  });

  final VoidCallback onTap;

  final String textLoginButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    onTap();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    textLoginButton,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              const Expanded(child: Divider(color: Colors.black, thickness: 0.5)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Text(S.of(context).orWith, style: const TextStyle(fontSize: 14)),
              ),
              const Expanded(child: Divider(color: Colors.black, thickness: 0.5)),
            ],
          ),
        ],
      ),
    );
  }
}
