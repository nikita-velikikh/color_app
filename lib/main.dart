import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  _ColorChangerScreenState createState() =>
      _ColorChangerScreenState(); // состояния для StatefulWidget
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color _backgroundColor = Colors.white; // переменная фона

  void _changeColor(Color color) {
    setState(() {
      _backgroundColor = color; // изменение цвета и обнова
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor, //  цвет фона
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // выравнивание кнопок по центру
          children: [
            _buildColorButton("Синий", Colors.blue),
            _buildColorButton("Жёлтый", Colors.yellow),
            _buildColorButton("Красный", Colors.red),
            _buildColorButton("Серый", Colors.grey),
            _buildColorButton("Фиолетовый", Colors.purple),
            _buildColorButton("Розовый", Colors.pink),
          ],
        ),
      ),
    );
  }

  Widget _buildColorButton(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0), // отступ
      child: ElevatedButton(
        onPressed: () =>
            _changeColor(color), // Изменение цвета фона при нажатии
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // цвета кнопки
          minimumSize: const Size(200, 50), // размера кнопки
        ),
        child: Text(
          text, // Отображение текста кнопки
          style: const TextStyle(
              color: Colors.white, fontSize: 25), // Настройка стиля текста
        ),
      ),
    );
  }
}
