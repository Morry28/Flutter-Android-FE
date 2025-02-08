import 'package:flutter/material.dart';
import 'package:helloworld/styles/palette.colors.dart';

class HeadLine extends StatelessWidget {
  final String text;

  const HeadLine({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: ColorPalette().primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
