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
  Color _backgroundColor = Colors.black;
  Color _AppBarColor = Colors.white;
  Color _TextColor = Colors.white;
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
  static const Size buttonSize = Size(200, 50);
  static int counter = 0;
  void _changeColor(Color color) => setState(() => _backgroundColor = color);
  void _changeColorAppBar(Color color) => setState(() => _AppBarColor = color);
  void _changeColorText(Color color) => setState(() => _TextColor = color);
  void _changeColorCounter(Color color) => setState(() => _TextColor = color);

  Color _changeColorRandom() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void buttonAction(Color color) => _changeColor(color);

  void onTapCounterReset() => setState(() => counter = 0);

  void onTapCounterIncrement() => counter++;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _changeColor(_changeColorRandom());
        onTapCounterIncrement();
        _changeColorText(_changeColorRandom());
        _changeColorCounter(_changeColorRandom());
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: GestureDetector(
            onTap: () {
              onTapCounterReset();
              _changeColorAppBar(_changeColorRandom());
            },
            child: CustomAppBar(
              appBarText: "Color App",
              textColor: Colors.black,
              backgroundColor: _AppBarColor,
              isCenterTirtle: true,
              actions: Icon(Icons.info),
            ),
          ),
        ),
        // backgroundColor: _backgroundColor,
        body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            color: _backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      style: TextStyle(color: _TextColor, fontSize: 18),
                      child: Text(
                        "The application has 3 buttons in the middle of the screen, an application bar and a background.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  CustomElevatedButton(
                    buttonTitle: "Blue",
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: buttonSize,
                    ),
                    onPressed: () => buttonAction(Colors.blue),
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    textStyle: buttonTextStyle,
                  ),
                  CustomElevatedButton(
                    buttonTitle: "Green",
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: buttonSize,
                    ),
                    onPressed: () => buttonAction(Colors.green),
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    textStyle: buttonTextStyle,
                  ),
                  CustomElevatedButton(
                    buttonTitle: "Red",
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: buttonSize,
                    ),
                    onPressed: () => buttonAction(Colors.red),
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    textStyle: buttonTextStyle,
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () => _changeColorCounter(_changeColorRandom()),
                    child: Text(
                      "Color changed $counter times",
                      style: TextStyle(color: _TextColor, fontSize: 18),
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
