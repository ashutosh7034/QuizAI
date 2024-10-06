import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
          String fileUrl = await _uploadFileToFirebaseStorage(_filePath!);
          await _uploadQuizToFirebase(quizData, fileUrl);
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
      bool isHeaderRow = true;

      for (var row in file.tables[table]!.rows) {
        if (isHeaderRow) {
          isHeaderRow = false; // Skip the header row
          continue;
        }

        if (row.length >= 4) {
          String question = row[0]?.value?.toString().trim() ?? '';
          String type = row[1]?.value?.toString().trim() ?? '';
          String options = row[2]?.value?.toString().trim() ?? '';
          String answer = row[3]?.value?.toString().trim() ?? '';
          int timePerQuestion = 5; // Default time per question

          if (question.isNotEmpty && type.isNotEmpty && options.isNotEmpty && answer.isNotEmpty) {
            List<String> optionsList = options.split(',').map((option) => options.trim()).toList();
            questions.add({
              'text': question,
              'type': type,
              'options': optionsList,
              'answer': answer,
              'timePerQuestion': timePerQuestion,
            });
          }
        }
      }
    }
    return questions;
  }

  Future<String> _uploadFileToFirebaseStorage(String path) async {
    File file = File(path);
    String fileName = file.path.split('/').last;
    Reference storageReference = FirebaseStorage.instance.ref().child('quizzes/$fileName');
    UploadTask uploadTask = storageReference.putFile(file);
    await uploadTask;
    String fileUrl = await storageReference.getDownloadURL();
    return fileUrl;
  }

  Future<void> _uploadQuizToFirebase(List<Map<String, dynamic>> questions, String fileUrl) async {
    final quizData = {
      'title': _fileName,
      'description': 'Quiz created from $_fileName',
      'fileUrl': fileUrl,
      'questions': questions,
      'created_at': FieldValue.serverTimestamp(),
      'createdBy': 'excel',
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
        backgroundColor: const Color(0xFF9C27B0), // Dark Purple
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
                color: Color(0xFF9C27B0), // Dark Purple
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
                backgroundColor: Colors.yellow[800], // Light Gray
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
