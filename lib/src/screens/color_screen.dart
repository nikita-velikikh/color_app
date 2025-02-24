import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color _backgroundColor = Colors.white;

  void _changeColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            _buildColorButton("Синий", Colors.blue),
            _buildColorButton("Жёлтый", Colors.yellow),
            _buildColorTextButton("Красный", Colors.red),
            _buildColorButton("Серый", Colors.grey),
            _buildColorButton("Фиолетовый", Colors.purple),
            _buildColorTextButton("Розовый", Colors.pink),
          ],
        ),
      ),
    );
  }

  Widget _buildColorButton(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton(
        onPressed: () =>
            _changeColor(color),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(200, 50),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget _buildColorTextButton(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextButton(
        onPressed: () =>
            _changeColor(color),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 32),
        ),
      ),
    );
  }
}