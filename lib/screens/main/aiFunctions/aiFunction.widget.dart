import 'package:flutter/material.dart';
import 'package:helloworld/models/aiFunction.model.dart'; // Import modelu
import 'package:helloworld/styles/palette.colors.dart'; // Import farieb

class AIFunctionCard extends StatelessWidget {
  final AIFunction aiFunction;

  final Function(Object) tapSignal;

  const AIFunctionCard(
      {super.key, required this.aiFunction, required this.tapSignal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tapSignal(aiFunction);
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: ColorPalette().primaryColor),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: ColorPalette().tertiaryColor,
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              aiFunction.utfIcon,
              style: TextStyle(
                fontSize: 48,
              ),
            ), // Ikona AI funkcie
            const SizedBox(height: 10),
            Text(aiFunction.name,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
