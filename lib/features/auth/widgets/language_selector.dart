import 'package:color_aap/features/auth/language_button_logic.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// widget for change language on UI
class LanguageSelector extends StatelessWidget {
  ///
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageButtonLogic>(
      builder: (context, languageLogic, child) {
        return Column(
          children: [
            PopupMenuButton<String>(
              tooltip: "",
              icon: Container(
                width: 115,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    languageLogic.getCurrentLanguageFlag(),
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ),
              onSelected: (String language) {
                languageLogic.changeLanguage(language);
                switch (language) {
                  case 'en':
                    // Change to English
                    break;
                  case 'uk':
                    // Change to Ukrainian
                    break;
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  value: 'en',
                  child: Row(
                    children: [
                      const Text('🇬🇧', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      const Text('English'),
                      if (languageLogic.currentLanguage == 'en') ...[
                        const Spacer(),
                        const Icon(Icons.check, color: Colors.green, size: 16),
                      ],
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'uk',
                  child: Row(
                    children: [
                      const Text('🇺🇦', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      const Text('Українська'),
                      if (languageLogic.currentLanguage == 'uk') ...[
                        const Spacer(),
                        const Icon(Icons.check, color: Colors.green, size: 16),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            Text(
              S.of(context).changeLanguage,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        );
      },
    );
  }
}
