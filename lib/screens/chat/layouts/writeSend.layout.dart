import 'package:flutter/material.dart';
import 'package:helloworld/styles/palette.colors.dart';

class WriteSend extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const WriteSend({super.key, required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a message',
              ),
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: onSend,
            child: Icon(Icons.send, color: ColorPalette().secondaryColor),
            backgroundColor: ColorPalette().primaryColor,
          ),
        ],
      ),
    );
  }
}
