import 'package:flutter/material.dart';
import 'package:helloworld/styles/palette.colors.dart';

class ReqResWindow extends StatefulWidget {
  final List<Map<String, dynamic>> messages;

  const ReqResWindow({super.key, required this.messages});

  @override
  State<ReqResWindow> createState() => _ReqResWindowState();
}

class _ReqResWindowState extends State<ReqResWindow> {
  List<Map<String, dynamic>> messages = [
    {'text': 'How may i be of service?', 'user': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      color: const Color.fromARGB(255, 239, 239, 239),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true, // Makes new messages appear at the bottom
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    message: messages[index]['text'],
                    user: messages[index]['user'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool user;

  const ChatBubble({super.key, required this.message, required this.user});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: user ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: user ? ColorPalette().primaryColor : Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: user ? const Radius.circular(12) : Radius.zero,
            bottomRight: user ? Radius.zero : const Radius.circular(12),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: user ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
