import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateQuizFromPDFScreen extends StatefulWidget {
  const CreateQuizFromPDFScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizFromPDFScreenState createState() => _CreateQuizFromPDFScreenState();
}

class _CreateQuizFromPDFScreenState extends State<CreateQuizFromPDFScreen> {
  String? _fileName;
  String? _fileContent;

  // File picking method
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _fileName = result.files.single.name;
        _fileContent = String.fromCharCodes(result.files.single.bytes!);
      });
    }
  }

  // Quiz creation from PDF file content
  Future<void> _createQuiz() async {
    if (_fileContent != null) {
      print('Creating quiz from file content: $_fileContent');

      List<Map<String, dynamic>> questions = _parseFileContent(_fileContent!);

      try {
        await _uploadQuizToFirebase(questions);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Quiz created from $_fileName successfully!')),
        );
      } catch (e) {
        print("Error creating quiz: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error creating quiz, please try again')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a file first')),
      );
    }
  }

  // Parse file content into quiz questions
  List<Map<String, dynamic>> _parseFileContent(String content) {
    List<Map<String, dynamic>> questions = [];

    // Split content by new lines
    List<String> lines = content.split('\n');
    for (String line in lines) {
      if (line.trim().isNotEmpty) {
        questions.add({
          'text': line.trim(),
          'type': 'text',
          'options': [],
          'answer': '',
        });
      }
    }
    return questions;
  }

  // Upload quiz data to Firebase Firestore
  Future<void> _uploadQuizToFirebase(List<Map<String, dynamic>> questions) async {
    final quizData = {
      'title': _fileName,
      'description': 'Quiz created from $_fileName',
      'questions': questions,
      'created_at': FieldValue.serverTimestamp(),
      'createdBy': 'file',
    };

    // Add to Firestore
    await FirebaseFirestore.instance.collection('quizzes').add(quizData);
  }

  // UI Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QuizAI", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF9C27B0), // Dark Purple
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
                color: Color(0xFF9C27B0), // Dark Purple
              ),
            ),
            const SizedBox(height: 20),
            // File Picker Button
            ElevatedButton.icon(
              onPressed: _pickFile,
              icon: const Icon(Icons.upload_file, size: 24),
              label: const Text(
                'Select File',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[800], // Yellow color
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
              // Display selected file name and content preview
              Text(
                'Selected File: $_fileName',
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Text(
                'File Content: ${_fileContent != null ? _fileContent!.substring(0, 100) : ''}...',
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),
            ],
            // Create Quiz Button
            ElevatedButton.icon(
              onPressed: _createQuiz,
              icon: const Icon(Icons.check_circle, size: 24),
              label: const Text(
                'Create Quiz',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF03A9F4), // Light Blue
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
