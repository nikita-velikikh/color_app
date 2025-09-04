import 'package:color_aap/generated/l10n.dart';
import 'package:color_aap/logic/color_logic.dart';
import 'package:color_aap/src/services/shared_prefs_storage.dart';
import 'package:color_aap/src/widgets/custom_app_bar.dart';
import 'package:color_aap/src/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

/// Main screen where users can customize app colors and
/// interact with color-changing elements
class ColorScreen extends StatefulWidget {
  final String email;
  const ColorScreen({required this.email, super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

/// State class for ColorScreen that manages color states, counter,
///  and user interactions
class _ColorScreenState extends State<ColorScreen> {
  Color backgroundColor = Colors.black;
  Color appBarColor = Colors.white;
  Color textColor = Colors.white;
  int counter = 0;
  late ColorLogic _colorLogic;
  final _storageService = SharedPrefsStorage();

  @override
  void initState() {
    super.initState();
    _colorLogic = ColorLogic(
      email: widget.email,
      storageService: _storageService,
    );
    _loadAndShowUserColors();
  }

  /// Loads user's saved color preferences from local storage
  Future<void> _loadAndShowUserColors() async {
    final userColors = await _colorLogic.loadUserColors();
    if (userColors != null) {
      setState(() {
        backgroundColor = userColors.backgroundColor;
        appBarColor = userColors.appBarColor;
        textColor = userColors.textColor;
      });
    }
  }

  /// Changes the background color and saves the change
  void _changeColor(Color color) {
    setState(() => backgroundColor = color);
    _colorLogic.saveColor(
      backgroundColor: backgroundColor,
      appBarColor: appBarColor,
      textColor: textColor,
    );
  }

  /// Changes the app bar color and saves the change
  void _changeColorAppBar(Color color) {
    setState(() => appBarColor = color);
    _colorLogic.saveColor(
      backgroundColor: backgroundColor,
      appBarColor: appBarColor,
      textColor: textColor,
    );
  }

  /// Changes the text color and saves the change
  void _changeColorText(Color color) {
    setState(() => textColor = color);
    _colorLogic.saveColor(
      backgroundColor: backgroundColor,
      appBarColor: appBarColor,
      textColor: textColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _changeColor(_colorLogic.generateRandomColor());
        setState(() => counter++);
        _changeColorText(_colorLogic.generateRandomColor());
        _changeColorText(_colorLogic.generateRandomColor());
      },
      child: Scaffold(
        appBar: _ColorAppBar(
          appBarColor: appBarColor,
          email: widget.email,
          onTap: () {
            setState(() => counter = 0);
            _changeColorAppBar(_colorLogic.generateRandomColor());
          },
        ),
        body: _ColorBody(
          backgroundColor: backgroundColor,
          textColor: textColor,
          counter: counter,
          onColorButtonPressed: _changeColor,
          onCounterTextTap: () =>
              _changeColorText(_colorLogic.generateRandomColor()),
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
      'Hello there',
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
