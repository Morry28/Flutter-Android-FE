import 'package:flutter/material.dart';

class InputArea extends StatefulWidget {
  const InputArea({super.key});

  @override
  TextInputWidgetState createState() => TextInputWidgetState();
}

class TextInputWidgetState extends State<InputArea> {
  final TextEditingController _controller = TextEditingController();

  void _handleSubmitted(String text) {
    String text = _controller.text;
    if (text.isNotEmpty) {
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
                hintText: 'How many numbers are between x and y?',
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _handleSubmitted(_controller.text),
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
