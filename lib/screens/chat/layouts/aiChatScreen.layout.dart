import 'package:flutter/material.dart';
import 'package:helloworld/core/helpers/alerts.snackBar.dart';
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
  List<Map<String, dynamic>> messages = [
    {'text': 'How may i be of service?', 'user': false},
  ];

  Future<void> sendRequest(String path, String message) async {
    if (message.trim().isEmpty) return;
    ApiService apiService = ApiService();

    setState(() {
      messages = [
        {'text': message, 'user': true},
        ...messages
      ];
    });

    try {
      Map<String, dynamic> response =
          await apiService.postData(path, {"payload": message});
      setState(() {
        messages
            .insert(0, {'text': response['data'].toString(), 'user': false});
      });
    } catch (e) {
      Alert('error', 'Something went wrong', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ReqResWindow(messages: messages),
          ),
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
