import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Ensure you have this package added in pubspec.yaml

class CreateQuizFromExcelScreen extends StatefulWidget {
  const CreateQuizFromExcelScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizFromExcelScreenState createState() => _CreateQuizFromExcelScreenState();
}

class _CreateQuizFromExcelScreenState extends State<CreateQuizFromExcelScreen> {
  String? _fileName;
  String? _fileContent; // Store content if needed

  Future<void> _pickFile() async {
    // Use File Picker to select an Excel file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _fileName = result.files.single.name;
        // Implement file reading logic here if needed
        _fileContent = 'File loaded. Implement reading logic.'; // Placeholder for file content
      });
    }
  }

  void _createQuiz() {
    if (_fileName != null) {
      // Logic to create quiz from the file
      print('Creating quiz from $_fileName');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Creating quiz from $_fileName...')),
      );
      // Implement further logic to read the Excel file and create the quiz
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
              "Create Quiz from Excel",
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
                'Select Excel File',
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
                'File Content: $_fileContent', // Placeholder for actual content
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
