import 'package:flutter/material.dart';

class Alert {
  final String type;
  final String text;

  Alert(this.type, this.text, BuildContext context) {
    _show(context, type);
  }

  void _show(BuildContext context, String type) {
    final messenger = ScaffoldMessenger.of(context);
    SnackBar snackBar;

    switch (type) {
      case 'warning':
        snackBar = SnackBar(
          content: Text(
            text, // Použitie custom textu
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 234, 180, 2),
        );
        break;
      case 'error':
        snackBar = SnackBar(
          content: Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.red,
        );
        break;
      default:
        return;
    }

    messenger.showSnackBar(snackBar);
  }
}
