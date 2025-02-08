import 'package:flutter/material.dart';
import 'package:helloworld/styles/palette.colors.dart';

class ParagraphText extends StatelessWidget {
  final String text;

  const ParagraphText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: ColorPalette().primaryColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
