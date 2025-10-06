import 'package:auto_route/auto_route.dart';
import 'package:color_aap/core/services/service_locator.dart';
import 'package:color_aap/features/auth/widgets/custom_elevated_button.dart';
import 'package:color_aap/features/colors/color_logic.dart';
import 'package:color_aap/features/colors/widgets/custom_app_bar.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Main screen where users can customize app colors and
/// interact with color-changing elements
@RoutePage()
class ColorScreen extends StatelessWidget {
  /// Constructor for ColorScreen
  final String email;

  /// Constructor for ColorScreen
  const ColorScreen({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorLogic>(
      create: (context) => serviceLocator.get<ColorLogic>(param1: email),
      child: Consumer<ColorLogic>(
        builder: (context, colorLogic, child) => GestureDetector(
          onTap: colorLogic.handleBackgroundTap,
          child: Scaffold(
            appBar: _ColorAppBar(
              appBarColor: colorLogic.appBarColor,
              email: email,
              onTap: () {
                colorLogic.handleAppBarTap();
              },
            ),
            body: _ColorBody(
              backgroundColor: colorLogic.backgroundColor,
              textColor: colorLogic.textColor,
              counter: colorLogic.counter,
              onColorButtonPressed: colorLogic.handleButtonTap,
              onCounterTextTap: () => colorLogic.handleTextTap(),
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom app bar widget with gesture detection
class _ColorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color appBarColor;
  final String email;
  final VoidCallback onTap;

  const _ColorAppBar({
    required this.appBarColor,
    required this.email,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
      child: GestureDetector(
        onTap: onTap,
        child: CustomAppBar(
          appBarText: "Color App",
          textColor: Colors.black,
          backgroundColor: appBarColor,
          isCenterTirtle: true,
          userEmail: email,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

/// Main body widget with animated background
class _ColorBody extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final int counter;
  final Function(Color) onColorButtonPressed;
  final VoidCallback onCounterTextTap;

  const _ColorBody({
    required this.backgroundColor,
    required this.textColor,
    required this.counter,
    required this.onColorButtonPressed,
    required this.onCounterTextTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _HeaderText(textColor: textColor),
              const SizedBox(height: 20),
              _InfoText(textColor: textColor),
              const SizedBox(height: 40),
              _ColorButtons(onColorButtonPressed: onColorButtonPressed),
              const SizedBox(height: 40),
              _CounterText(
                counter: counter,
                textColor: textColor,
                onTap: onCounterTextTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Header text widget
class _HeaderText extends StatelessWidget {
  final Color textColor;

  const _HeaderText({required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).hello,
      style: TextStyle(
        color: textColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// Info text widget with animation
class _InfoText extends StatelessWidget {
  final Color textColor;

  const _InfoText({required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        style: TextStyle(color: textColor, fontSize: 18),
        child: Text(
          S.of(context).infoColorScreen,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

/// Color buttons container widget
class _ColorButtons extends StatelessWidget {
  final Function(Color) onColorButtonPressed;

  const _ColorButtons({required this.onColorButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ColorButton(
          title: S.of(context).blueColorColorScreen,
          color: Colors.blue,
          onPressed: onColorButtonPressed,
        ),
        _ColorButton(
          title: S.of(context).greenColorColorScreen,
          color: Colors.green,
          onPressed: onColorButtonPressed,
        ),
        _ColorButton(
          title: S.of(context).redColorColorScreen,
          color: Colors.red,
          onPressed: onColorButtonPressed,
        ),
      ],
    );
  }
}

/// Individual color button widget
class _ColorButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function(Color) onPressed;

  const _ColorButton({
    required this.title,
    required this.color,
    required this.onPressed,
  });

  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
  static const Size buttonSize = Size(200, 50);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      buttonTitle: title,
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: buttonSize,
      ),
      onPressed: () => onPressed(color),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      textStyle: buttonTextStyle,
    );
  }
}

/// Counter text widget with gesture detection
class _CounterText extends StatelessWidget {
  final int counter;
  final Color textColor;
  final VoidCallback onTap;

  const _CounterText({
    required this.counter,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        S.of(context).colorChangedTimes(counter),
        style: TextStyle(color: textColor, fontSize: 18),
      ),
    );
  }
}
