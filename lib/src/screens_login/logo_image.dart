import 'package:flutter/material.dart';

/// Simple widget that displays the app logo image with fixed dimensions
class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    const image = AssetImage('assets/images/logo.png');
    const size = 144.0;
    return const Image(
      image: image,
      width: size,
      height: size,
    );
  }
}
