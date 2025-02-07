import 'package:flutter/material.dart';
import 'package:helloworld/screens/chat/chat.screen.dart';
import 'package:helloworld/screens/main/aiFunctions/functionRoller.container.dart';
import 'package:helloworld/widgets/text/paragraph.text.dart';
import 'package:helloworld/widgets/text/subTitle.text.dart';
import 'package:helloworld/widgets//text/headLine.text.dart';
import 'package:helloworld/screens/main/layouts/uploadFile.layout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _useSample = false;
  String _fileName = '';

  /// finalizeFormMain
  /// @param model.apiPath
  ///
  /// Funkcia na zavolanie API s vybranou funkciou
  ///
  /// Ak nie je vybrany subor alebo je vybrany sample data, zobrazi sa chybova sprava
  ///
  /// Ak je vybrany subor alebo sample data, zavola sa API s danou cestou
  void finalizeFormMain(Object model) {
    if (!_useSample && _fileName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please upload a file or use sample data'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    //prechadzame na chatove okno ak je vsetko ok
    if (_useSample || _fileName.isEmpty) {
      print('Calling API: $model.apiPath with sample data');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen(model: model)),
      );
    } else {
      print('Calling API: $model.apiPath with file: $_fileName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
// 🔹 Nadpis main tabu
        HeadLine(text: 'How can i help?'),

        SubTitleText(
            text:
                'Upload data you want to analyze for fraction of cost. If you dont have data, you can use our sample data to see the magic.'),

// zaznamename zmenu input dat
        UploadFile(useSampleData: (bool useSampleBool) {
          setState(() {
            _useSample = useSampleBool;
            print(_useSample);
          });
        }, useCustomData: (String fileName) {
          setState(() {
            _fileName = fileName;
          });
        }),

        ParagraphText(
            text:
                'every request will cost ~0.006\$ \n original processing cost of sample data is 2\$\n'),
//zaznamename vyber funkcie a prejdeme na chat
        FunctionRoller(
          text: 'Select desired model ( only simple data available )',
          finalizeForm: (Object model) => finalizeFormMain(model),
        ),
      ],
    );
  }
}
