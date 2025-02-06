import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/styles/palette.colors.dart';

class UploadFile extends StatefulWidget {
  final Function(bool) useSampleData;
  final Function(String) useCustomData;

  const UploadFile(
      {super.key, required this.useSampleData, required this.useCustomData});

  @override
  _UploadFileState createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  bool isCheckedCustom = false;
  String? _fileName;

  void _toggleChecked(bool? value) {
    setState(() {
      isCheckedCustom = !isCheckedCustom;
      widget.useSampleData(isCheckedCustom);
    });
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        widget.useCustomData(_fileName ?? '');
      });
      widget.useSampleData(isCheckedCustom || _fileName != null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16, top: 16),
      color: ColorPalette().tertiaryColor,
      child: Column(
        children: [
          Visibility(
            visible: !isCheckedCustom,
            child: ElevatedButton(
              onPressed: pickFile,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPalette().secondaryColor,
                textStyle: TextStyle(color: ColorPalette().primaryColor),
              ),
              child: Text(
                'Upload file',
                style: TextStyle(color: ColorPalette().primaryColor),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('sample data (100,000 numbers):',
                  style: TextStyle(color: ColorPalette().secondaryColor)),
              Checkbox(value: isCheckedCustom, onChanged: _toggleChecked),
            ],
          ),
          if (_fileName != null) Text('Selected file: $_fileName')
        ],
      ),
    );
  }
}
