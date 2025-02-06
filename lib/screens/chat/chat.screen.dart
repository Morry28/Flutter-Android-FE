import 'package:flutter/material.dart';
import 'package:helloworld/styles/palette.colors.dart';
import 'package:helloworld/screens/chat/layouts/aiChatScreen.layout.dart';

class ChatScreen extends StatelessWidget {
  final dynamic model;

  ChatScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final String utfIcon = model.utfIcon;
    final String path = model.apiPath;

    return Scaffold(
      backgroundColor: ColorPalette().secondaryColor,
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Colors.white), // Nastaví farbu šípky
        title: Text(
          '$utfIcon Flu-Ai Chat',
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorPalette().primaryColor,
      ),
      body: Center(child: AiChatLayout(path: path)),
    );
  }
}
