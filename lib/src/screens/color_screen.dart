import 'package:color_aap/local_storage_service.dart';
import 'package:color_aap/src/widgets/custom_app_bar.dart';
import 'package:color_aap/src/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color backgroundColor = Colors.black;
  Color appBarColor = Colors.white;
  Color textColor = Colors.white;
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
  static const Size buttonSize = Size(200, 50);
  int counter = 0;
  void _changeColor(Color color) => setState(() => backgroundColor = color);
  void _changeColorAppBar(Color color) => setState(() => appBarColor = color);
  void _changeColorText(Color color) => setState(() => textColor = color);
  void _changeColorCounter(Color color) => setState(() => textColor = color);

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

  void onTapCounterIncrement() => counter++;

  void saveColor() async {
    final localStorageService = LocalStorageService();

    await localStorageService.saveUserColors(
      backgroundColor,
      appBarColor,
      textColor,
    );

    // ignore: unused_local_variable
    final colors = await localStorageService.getUserColors();
    // print(
    //   '''
    // saveUserColors:
    // print('saveColor');

    //         backgroundColor: $backgroundColor
    //         appBarColor: $appBarColor
    //         textColor: $textColor

    //         getUserColors:
    //         backgroundColor: ${colors?['backgroundColor']}
    //         appBarColor: ${colors?['appBarColor']}
    //         textColor: ${colors?['textColor']}
    //         \n\n\n
    //         ''',
    // );
    return;
  }

  @override
  void initState() {
    super.initState();
    _loadUserColors();
  }

  Future<void> _loadUserColors() async {
    final localStorageService = LocalStorageService();
    final colors = await localStorageService.getUserColors();
    if (colors != null) {
      setState(() {
        backgroundColor = colors['backgroundColor'] ?? Colors.black;
        appBarColor = colors['appBarColor'] ?? Colors.white;
        textColor = colors['textColor'] ?? Colors.white;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _changeColor(_generateColorRandom());
        onTapCounterIncrement();
        _changeColorText(_generateColorRandom());
        _changeColorCounter(_generateColorRandom());
        saveColor();
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
              actions: const Icon(Icons.info),
            ),
          ),
        ),
        // backgroundColor: _backgroundColor,
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
                      child: const Text(
                        "The application has 3 buttons in the middle of the screen, an application bar and a background.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomElevatedButton(
                    buttonTitle: "Blue",
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: buttonSize,
                    ),
                    onPressed: () => buttonAction(Colors.blue),
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    textStyle: buttonTextStyle,
                  ),
                  CustomElevatedButton(
                    buttonTitle: "Green",
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: buttonSize,
                    ),
                    onPressed: () => buttonAction(Colors.green),
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    textStyle: buttonTextStyle,
                  ),
                  CustomElevatedButton(
                    buttonTitle: "Red",
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
                    onTap: () => _changeColorCounter(_generateColorRandom()),
                    child: Text(
                      "Color changed $counter times",
                      style: TextStyle(color: textColor, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await LocalStorageService().logout();
                      if (context.mounted) {
                        Navigator.of(context).pushReplacementNamed('/login');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(150, 40),
                    ),
                    child: const Text(
                      'EXIT',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
