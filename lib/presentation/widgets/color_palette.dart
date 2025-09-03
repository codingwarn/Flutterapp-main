import 'package:flutter/material.dart';

class ColorPalette extends StatelessWidget {
  final List<Color> colors;
  final double height;
  final double borderRadius;

  const ColorPalette({
    Key? key,
    required this.colors,
    this.height = 24,
    this.borderRadius = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
    );
  }
}