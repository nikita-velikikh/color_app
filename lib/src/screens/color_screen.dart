import 'dart:math';

import 'package:color_aap/generated/l10n.dart';
import 'package:color_aap/local_storage_service.dart';
import 'package:color_aap/models.dart';
import 'package:color_aap/src/screens_login/auth_screen.dart';
import 'package:color_aap/src/widgets/custom_app_bar.dart';
import 'package:color_aap/src/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  final String email;
  const ColorScreen({required this.email, super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color backgroundColor = Colors.black;
  Color appBarColor = Colors.white;
  Color textColor = Colors.white;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _loadAndShowUserColors();
  }

  Future<void> _loadAndShowUserColors() async {
    try {
      final localStorageService = LocalStorageService();
      final userColors = await localStorageService.getUserColors(widget.email);
      setState(() {
        backgroundColor = userColors.backgroundColor;
        appBarColor = userColors.appBarColor;
        textColor = userColors.textColor;
      });
    } catch (e) {
      debugPrint('Error in _loadAndShowUserColors: $e');
      if (mounted) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AuthScreen()),
        );
      }
    }
  }

  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
  static const Size buttonSize = Size(200, 50);

  void _changeColor(Color color) {
    setState(() => backgroundColor = color);
    saveColor();
  }

  void _changeColorAppBar(Color color) {
    setState(() => appBarColor = color);
    saveColor();
  }

  void _changeColorText(Color color) {
    setState(() => textColor = color);
    saveColor();
  }

  Color _generateColorRandom() {
    final Random random = Random();
    final color = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    return color;
  }

  void buttonAction(Color color) => _changeColor(color);

  void onTapCounterReset() => setState(() => counter = 0);

  void onTapCounterIncrement() => setState(() => counter++);

  Future<void> saveColor() async {
    final localStorageService = LocalStorageService();

    final userColors = UserColors(
      backgroundColor: backgroundColor,
      appBarColor: appBarColor,
      textColor: textColor,
    );

    await localStorageService.saveUserColors(
      widget.email,
      userColors,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _changeColor(_generateColorRandom());
        onTapCounterIncrement();
        _changeColorText(_generateColorRandom());
        _changeColorText(_generateColorRandom());
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: GestureDetector(
            onTap: () {
              onTapCounterReset();
              _changeColorAppBar(_generateColorRandom());
            },
            child: CustomAppBar(
              appBarText: "Color App",
              textColor: Colors.black,
              backgroundColor: appBarColor,
              isCenterTirtle: true,
              userEmail: widget.email,
            ),
          ),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      style: TextStyle(color: textColor, fontSize: 18),
                      child: Text(
                        S.of(context).infoColorScreen,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomElevatedButton(
                    buttonTitle: S.of(context).blueColorColorScreen,
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: buttonSize,
                    ),
                    onPressed: () => buttonAction(Colors.blue),
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    textStyle: buttonTextStyle,
                  ),
                  CustomElevatedButton(
                    buttonTitle: S.of(context).greenColorColorScreen,
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: buttonSize,
                    ),
                    onPressed: () => buttonAction(Colors.green),
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    textStyle: buttonTextStyle,
                  ),
                  CustomElevatedButton(
                    buttonTitle: S.of(context).redColorColorScreen,
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: buttonSize,
                    ),
                    onPressed: () => buttonAction(Colors.red),
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    textStyle: buttonTextStyle,
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () => _changeColorText(_generateColorRandom()),
                    child: Text(
                      S.of(context).colorChangedTimes(counter),
                      style: TextStyle(color: textColor, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
