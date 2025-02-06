import 'package:flutter/material.dart';
import 'package:helloworld/screens/chat/layouts/responseWindow.layout.dart';
import 'package:helloworld/screens/chat/layouts/writeSend.layout.dart';

class AiChatLayout extends StatefulWidget {
  final String path;

  const AiChatLayout({super.key, required this.path});

  @override
  _AiChatLayoutState createState() => _AiChatLayoutState();
}

class _AiChatLayoutState extends State<AiChatLayout> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ReqResWindow(), // Your response window

          WriteSend(
            controller: messageController,
            onSend: () {
              print("Message sent: ${messageController.text}");
              messageController.clear();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose(); // Clean up the controller
    super.dispose();
  }
}
