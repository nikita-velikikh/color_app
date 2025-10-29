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
                    languageLogic.currentLanguage.flag(),
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ),
              onSelected: (String language) {
                languageLogic.changeLanguage(language);
              },
              itemBuilder: (BuildContext context) => [
                for (final lang in ColorsLocale.values)
                  PopupMenuItem(
                    value: lang.localeString(),
                    child: _LanguageButton(
                      locale: lang,
                      isSelected: false,
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

/// A language option for the dropdown, with flag, name, and check if selected.
class _LanguageButton extends StatelessWidget {
  final ColorsLocale locale;
  final bool isSelected;

  const _LanguageButton({required this.locale, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(locale.flag(), style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Text(locale.fullString()),
        if (isSelected) ...[
          const Spacer(),
          const Icon(Icons.check, color: Colors.green, size: 16),
        ],
      ],
    );
  }
}
