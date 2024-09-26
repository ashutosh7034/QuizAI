import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class CreateQuizFromFileScreen extends StatefulWidget {
  const CreateQuizFromFileScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizFromFileScreenState createState() => _CreateQuizFromFileScreenState();
}

class _CreateQuizFromFileScreenState extends State<CreateQuizFromFileScreen> {
  String? _fileName;
  String? _fileContent;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['txt']);

    if (result != null && result.files.single.path != null) {
      setState(() {
        _fileName = result.files.single.name;
        _fileContent = String.fromCharCodes(result.files.single.bytes!);
      });
    }
  }

  void _createQuiz() {
    if (_fileContent != null) {
      // Logic to create quiz from file content
      print('Creating quiz from file content: $_fileContent');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a file first')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quizai", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Quiz from File",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _pickFile,
              icon: const Icon(Icons.upload_file, size: 24),
              label: const Text(
                'Select File',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 5,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
            const SizedBox(height: 20),
            if (_fileName != null) ...[
              Text(
                'Selected File: $_fileName',
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Text(
                'File Content: $_fileContent',
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),
            ],
            ElevatedButton.icon(
              onPressed: _createQuiz,
              icon: const Icon(Icons.check_circle, size: 24),
              label: const Text(
                'Create Quiz',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 5,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}