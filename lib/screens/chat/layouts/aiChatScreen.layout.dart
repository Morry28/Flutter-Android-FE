import 'package:flutter/material.dart';
import 'package:helloworld/core/network/apiCall.network.dart';
import 'package:helloworld/screens/chat/layouts/reqResWindow.layout.dart';
import 'package:helloworld/screens/chat/layouts/writeSend.layout.dart';

class AiChatLayout extends StatefulWidget {
  final String path;

  const AiChatLayout({
    super.key,
    required this.path,
  });

  @override
  _AiChatLayoutState createState() => _AiChatLayoutState();
}

class _AiChatLayoutState extends State<AiChatLayout> {
  final TextEditingController messageController = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  Future<void> sendRequest(String path, String message) async {
    ApiService apiService = ApiService();
    setState(() {
      messages.insert(0, {'text': message, 'user': true});
    });

    try {
      print('calling api: $path, message: $message');
      Map<String, dynamic> response =
          await apiService.postData(path, {"payload": message});
      setState(() {
        messages.insert(0, {'text': response['message'], 'user': false});
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ReqResWindow(messages: messages),
          WriteSend(
            controller: messageController,
            onSend: () {
              sendRequest(widget.path, messageController.text);
              messageController.clear();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
