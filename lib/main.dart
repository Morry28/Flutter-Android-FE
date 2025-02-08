import 'package:flutter/material.dart';
import 'package:helloworld/core/helpers/alerts.snackBar.dart';
import 'package:helloworld/core/network/apiCall.network.dart';
import 'package:helloworld/styles/palette.colors.dart';
import 'package:helloworld/screens/main/layouts/mainScreen.layout.dart';

void main() {
  runApp(const FluAi());
}

class FluAi extends StatefulWidget {
  const FluAi({super.key});

  @override
  _FluAiState createState() => _FluAiState();
}

class _FluAiState extends State<FluAi> {
  bool alive = false;

  Future<void> isAlive() async {
    ApiService apiService = ApiService();

    try {
      final res = await apiService.status();
      setState(() {
        alive = res;
      });
    } catch (e) {
      Alert('error', 'Something went wrong', context);
    }
  }

  @override
  void initState() {
    super.initState();

    isAlive();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ColorPalette().secondaryColor,
        appBar: AppBar(
          backgroundColor: ColorPalette().primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Flu-Ai',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                alive ? '🟢 online' : '🟠 offline',
                style: TextStyle(
                  color: ColorPalette().secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16.0, top: 16),
          child: const MainScreen(),
        ),
      ),
    );
  }
}
