import 'package:flutter/material.dart';
import 'package:helloworld/models/aiFunction.model.dart'; // Import modelu
import 'aiFunction.widget.dart'; // Import dynamického widgetu
import 'package:helloworld/core/consts/models.consts.dart'; // Import konštánt

class FunctionRoller extends StatelessWidget {
  final String text;
  final dynamic Function(Object) finalizeForm;
  const FunctionRoller(
      {super.key, required this.text, required this.finalizeForm});

  void upDriller(Object model) {
    // upDrill do mainScreen.layout.dart
    finalizeForm(model);
  }

  @override
  Widget build(BuildContext context) {
    // 🔹 Zoznam AI funkcií

    final List<AIFunction> aiFunctions = models
        .map((model) => AIFunction(
            name: model["name"]!,
            utfIcon: model["utfIcon"]!,
            apiPath: model["apiPath"]!))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Nadpis nad funkciami
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        // 🔹 Horizontálny scroll s AI funkciami
        SizedBox(
          height: 150,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(spacing: 24, children: [
              SizedBox(width: 8),
              ...aiFunctions.map((aiFunction) => AIFunctionCard(
                  aiFunction: aiFunction,
                  tapSignal: (aiFunction) => upDriller(aiFunction))),
              SizedBox(width: 8),
            ]),
          ),
        ),
      ],
    );
  }
}
