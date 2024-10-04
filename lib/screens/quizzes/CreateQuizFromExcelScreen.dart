import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateQuizFromExcelScreen extends StatefulWidget {
  const CreateQuizFromExcelScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizFromExcelScreenState createState() => _CreateQuizFromExcelScreenState();
}

class _CreateQuizFromExcelScreenState extends State<CreateQuizFromExcelScreen> {
  String? _fileName;
  String? _filePath;
  bool isLoading = false;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _fileName = result.files.single.name;
        _filePath = result.files.single.path;
      });
    }
  }

  Future<void> _createQuiz() async {
    if (_filePath != null) {
      setState(() {
        isLoading = true;
      });

      try {
        final quizData = await _readExcelFile(_filePath!);
        if (quizData.isNotEmpty) {
          await _uploadQuizToFirebase(quizData);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Quiz created from $_fileName successfully!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No valid questions found in the file.')),
          );
        }
      } catch (e) {
        print("Error creating quiz: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error creating quiz, please try again')),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a file first')),
      );
    }
  }

  Future<List<Map<String, dynamic>>> _readExcelFile(String path) async {
    var file = Excel.decodeBytes(await File(path).readAsBytes());
    List<Map<String, dynamic>> questions = [];

    for (var table in file.tables.keys) {
      bool isHeaderRow = true; // Flag to skip the header row
      for (var row in file.tables[table]!.rows) {
        // Skip header row
        if (isHeaderRow) {
          isHeaderRow = false;
          continue;
        }

        // Check if the row is not empty before processing
        if (row.isNotEmpty) {
          String question = (row[0]?.value is String ? row[0]?.value.toString().trim() : '') ?? '';
          String type = (row[1]?.value is String ? row[1]?.value.toString().trim() : '') ?? '';
          String options = (row[2]?.value is String ? row[2]?.value.toString().trim() : '') ?? '';
          String answer = (row[3]?.value is String ? row[3]?.value.toString().trim() : '') ?? '';

          // Print for debugging
          print("Row Data - Question: $question, Type: $type, Options: $options, Answer: $answer");

          // Validate and add to the questions list
          if (question.isNotEmpty && type == 'multiple choice' && options.isNotEmpty && answer.isNotEmpty) {
            List<String> optionsList = options.split(',').map((option) => option.trim()).toList();

            questions.add({
              'text': question,
              'type': type,
              'options': optionsList,
              'answer': answer,
            });
          }
        }
      }
    }

    print("Valid Questions: $questions"); // Print the final list of questions for debugging
    return questions;
  }

  Future<void> _uploadQuizToFirebase(List<Map<String, dynamic>> questions) async {
    final quizData = {
      'title': _fileName,
      'description': 'Quiz created from $_fileName',
      'questions': questions,
      'created_at': FieldValue.serverTimestamp(),
      'createdBy': 'excel', // Set createdBy to 'excel'
    };

    await FirebaseFirestore.instance.collection('quizzes').add(quizData);
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
              const SizedBox(height: 20),
            ],
            ElevatedButton.icon(
              onPressed: isLoading ? null : _createQuiz,
              icon: isLoading
                  ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                  : const Icon(Icons.check_circle, size: 24),
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
