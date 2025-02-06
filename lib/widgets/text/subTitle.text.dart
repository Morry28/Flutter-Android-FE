import 'package:flutter/material.dart';
import 'package:helloworld/styles/palette.colors.dart';

class SubTitleText extends StatelessWidget {
  final String text;

  const SubTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: ColorPalette().primaryColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
