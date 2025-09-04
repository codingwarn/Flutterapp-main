import 'package:flutter/material.dart';

class ColorPalette extends StatelessWidget {
  final List<Color> colors;
  final double height;
  final double borderRadius;
  final String label;
  final double labelWidth;

  const ColorPalette({
    Key? key,
    required this.colors,
    this.height = 40,
    this.borderRadius = 0,
    this.label = 'pallette',
    this.labelWidth = 84,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          Container(
            width: labelWidth,
            color: colors.first,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          ...colors.skip(1).map((c) => Expanded(child: Container(color: c))),
        ],
      ),
    );
  }
}