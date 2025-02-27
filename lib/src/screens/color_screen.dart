import 'package:color_aap/src/widgets/custom_app_bar.dart';
import 'package:color_aap/src/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color _backgroundColor = Colors.white;
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
  static const Size buttonSize = Size(200, 50);
  static int counter = 0;
  void _changeColor(Color color) => setState(() => _backgroundColor = color);

  void buttonAction(Color color) {
    _changeColor(color);
    onTapCounterIncrement();
  }

  void onTapCounterReset() => setState(() => counter = 0);

  void onTapCounterIncrement() => counter++;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: GestureDetector(
            onTap: () => onTapCounterReset(),
            child: CustomAppBar(
              appBarText: "Color App",
              textColor: Colors.pink,
              backgroundColor: Colors.white,
              isCenterTirtle: true,
            ),
          ),
        ),
        backgroundColor: _backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                buttonTitle: "Синий",
                buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: buttonSize,
                ),
                onPressed: () => buttonAction(Colors.blue),
                padding: EdgeInsets.symmetric(vertical: 5.0),
                textStyle: buttonTextStyle,
              ),
              CustomElevatedButton(
                buttonTitle: "Зеленый",
                buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: buttonSize,
                ),
                onPressed: () => buttonAction(Colors.green),
                padding: EdgeInsets.symmetric(vertical: 5.0),
                textStyle: buttonTextStyle,
              ),
              CustomElevatedButton(
                buttonTitle: "Красный",
                buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: buttonSize,
                ),
                onPressed: () => buttonAction(Colors.red),
                padding: EdgeInsets.symmetric(vertical: 5.0),
                textStyle: buttonTextStyle,
              ),
              Text("Counter: $counter"),
            ],
          ),
        ),
      ),
    );
  }
}
