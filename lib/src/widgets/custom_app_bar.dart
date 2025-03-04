import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appBarText,
    required this.textColor,
    required this.backgroundColor,
    required this.isCenterTirtle,
    required Icon actions,
  });

  final String appBarText;
  final Color textColor;
  final Color backgroundColor;
  final bool isCenterTirtle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarText,
        style: TextStyle(color: textColor),
      ),
      centerTitle: isCenterTirtle,
      backgroundColor: backgroundColor,
    );
  }
}
