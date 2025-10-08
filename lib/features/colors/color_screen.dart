import 'package:auto_route/auto_route.dart';
import 'package:color_aap/core/services/service_locator.dart';
import 'package:color_aap/features/auth/widgets/custom_elevated_button.dart';
import 'package:color_aap/features/colors/color_logic.dart';
import 'package:color_aap/features/colors/widgets/custom_app_bar.dart';
import 'package:color_aap/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Main screen where users can customize app colors and
/// interact with color-changing elements
@RoutePage()
class ColorScreen extends StatelessWidget {
  /// Constructor for ColorScreen
  final String email;

  /// Constructor for ColorScreen
  const ColorScreen({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorLogic>(
      create: (context) => serviceLocator.get<ColorLogic>(param1: email),
      child: Consumer<ColorLogic>(
        builder: (context, colorLogic, child) => GestureDetector(
          onTap: colorLogic.handleBackgroundTap,
          child: Scaffold(
            appBar: _ColorAppBar(),
            body: const _ColorBody(),
          ),
        ),
      ),
    );
  }
}

/// Custom app bar widget with gesture detection
class _ColorAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
      child: GestureDetector(
        onTap: context.read<ColorLogic>().handleAppBarTap,
        child: CustomAppBar(
          appBarText: "Color App",
          textColor: Colors.black,
          backgroundColor: context.watch<ColorLogic>().appBarColor,
          isCenterTirtle: true,
          userEmail: context.watch<ColorLogic>().email,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

/// Main body widget with animated background
class _ColorBody extends StatelessWidget {
  const _ColorBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: context.watch<ColorLogic>().backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _HeaderText(),
              const SizedBox(height: 20),
              const _InfoText(),
              const SizedBox(height: 40),
              const _ColorButtons(),
              const SizedBox(height: 40),
              _CounterText(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Header text widget
class _HeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).hello,
      style: TextStyle(
        color: context.watch<ColorLogic>().textColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// Info text widget with animation
class _InfoText extends StatelessWidget {
  const _InfoText();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        style: TextStyle(
          color: context.watch<ColorLogic>().textColor,
          fontSize: 18,
        ),
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
  const _ColorButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ColorButton(
          title: S.of(context).blueColorColorScreen,
          color: Colors.blue,
        ),
        _ColorButton(
          title: S.of(context).greenColorColorScreen,
          color: Colors.green,
        ),
        _ColorButton(
          title: S.of(context).redColorColorScreen,
          color: Colors.red,
        ),
      ],
    );
  }
}

/// Individual color button widget
class _ColorButton extends StatelessWidget {
  final String title;
  final Color color;

  const _ColorButton({
    required this.title,
    required this.color,
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
      onPressed: () => context.read<ColorLogic>().handleButtonTap(color),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      textStyle: buttonTextStyle,
    );
  }
}

/// Counter text widget with gesture detection
class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<ColorLogic>().counter;
    final textColor = context.watch<ColorLogic>().textColor;

    return GestureDetector(
      onTap: context.read<ColorLogic>().handleTextTap,
      child: Text(
        S.of(context).colorChangedTimes(counter),
        style: TextStyle(color: textColor, fontSize: 18),
      ),
    );
  }
}
