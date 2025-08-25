import 'package:color_aap/generated/l10n.dart';
import 'package:color_aap/local_storage_service.dart';
import 'package:color_aap/logic/color_logic.dart';
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
  final _storageService = LocalStorageService();

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

  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
  static const Size buttonSize = Size(200, 50);

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

  /// Button action handler that changes the background color
  void buttonAction(Color color) => _changeColor(color);

  /// Resets the counter to zero
  void onTapCounterReset() => setState(() => counter = 0);

  /// Increments the counter by one
  void onTapCounterIncrement() => setState(() => counter++);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _changeColor(_colorLogic.generateRandomColor());
        onTapCounterIncrement();
        _changeColorText(_colorLogic.generateRandomColor());
        _changeColorText(_colorLogic.generateRandomColor());
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: GestureDetector(
            onTap: () {
              onTapCounterReset();
              _changeColorAppBar(_colorLogic.generateRandomColor());
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
                  Text(
                    'Hello there',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                    onTap: () =>
                        _changeColorText(_colorLogic.generateRandomColor()),
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
