import 'package:flutter/material.dart';
import 'package:helloworld/styles/palette.colors.dart';
import 'package:helloworld/screens/main/layouts/mainScreen.layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  void setState(Null Function() param0) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ColorPalette().secondaryColor,
        appBar: AppBar(
          backgroundColor: ColorPalette().primaryColor,
          title: const Text(
            'Flu-Ai',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: 16.0,
              top: 16,
            ),
            //Main tab form layout
            child: MainScreen()),
      ),
    );
  }
}
