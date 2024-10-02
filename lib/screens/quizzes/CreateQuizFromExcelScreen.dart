import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Ensure you have this package added in pubspec.yaml
import 'package:excel/excel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateQuizFromExcelScreen extends StatefulWidget {
  const CreateQuizFromExcelScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizFromExcelScreenState createState() => _CreateQuizFromExcelScreenState();
}

class _CreateQuizFromExcelScreenState extends State<CreateQuizFromExcelScreen> {
  String? _fileName;
  String? _filePath; // To hold the path for reading
  bool isLoading = false;

  Future<void> _pickFile() async {
    // Use File Picker to select an Excel file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _fileName = result.files.single.name;
        _filePath = result.files.single.path; // Save the file path
      });
    }
  }

  Future<void> _createQuiz() async {
    if (_filePath != null) {
      setState(() {
        isLoading = true; // Show loading indicator
      });

      try {
        final quizData = await _readExcelFile(_filePath!);
        await _uploadQuizToFirebase(quizData);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Quiz created from $_fileName successfully!')),
        );
      } catch (e) {
        print("Error creating quiz: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error creating quiz, please try again')),
        );
      } finally {
        setState(() {
          isLoading = false; // Reset loading state
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
      for (var row in file.tables[table]!.rows) {
        if (row.isNotEmpty) {
          // Assuming the first cell is the question, second cell is the type,
          // third cell is the options, and fourth cell is the answer
          String question = row[0]?.value.toString() ?? '';
          String type = row[1]?.value.toString() ?? '';
          String options = row[2]?.value.toString() ?? '';
          String answer = row[3]?.value.toString() ?? '';

          // Split options by comma and remove leading/trailing whitespaces
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

    return questions;
  }

  Future<void> _uploadQuizToFirebase(List<Map<String, dynamic>> questions) async {
    final quizData = {
      'title': _fileName, // You might want to use a more appropriate title
      'questions': questions,
      'created_at': FieldValue.serverTimestamp(),
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

class MyQuizzesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Quizzes'),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF9C27B0),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9C27B0), Color(0xFF03A9F4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('quizzes')
              .orderBy('created_at', descending: true) // Sort by timestamp
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            // Extract quiz data from Firestore documents
            final quizzes = snapshot.data!.docs.map((doc) {
              return {
                'title': doc['title'] ?? "Untitled Quiz",
                'description': doc['description'] ?? "No Description",
                'questions': doc['questions'] ?? [],
              };
            }).toList();

            // Display quizzes in a ListView
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                final quiz = quizzes[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF9C27B0).withOpacity(0.5),
                      child: const Icon(
                        Icons.school,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      quiz['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      quiz['description'],
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                    trailing: const Icon(Icons.play_arrow, color: Color(0xFF9C27B0)),
                    onTap: () {
                      // Navigate to the QuizScreen when a quiz is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            title: quiz['title'], // Pass the title
                            description: quiz['description'], // Pass the description
                            questions: quiz['questions'], // Pass the questions
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final String title;
  final String description;
  final List<Map<String, dynamic>> questions;

  const QuizScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.questions,
  }) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              widget.description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _currentQuestion < widget.questions.length
                  ? QuestionWidget(
                question: widget.questions[_currentQuestion],
                onNext: () {
                  setState(() {
                    _currentQuestion++;
                  });
                },
                onAnswer: (isCorrect) {
                  if (isCorrect) {
                    setState(() {
                      _score++;
                    });
                  }
                },
              )
                  : ResultWidget(
                score: _score,
                total: widget.questions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final Map<String, dynamic> question;
  final VoidCallback onNext;
  final ValueChanged<bool> onAnswer;

  const QuestionWidget({
    Key? key,
    required this.question,
    required this.onNext,
    required this.onAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question['text'],
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 20),
        if (question['type'] == 'Multiple Choice')
          ...question['options'].map((option) {
            return ListTile(
              title: Text(option),
              onTap: () {
                onAnswer(option == question['answer']);
                onNext();
              },
            );
          }).toList()
        else
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your answer',
            ),
            onSubmitted: (answer) {
              onAnswer(answer == question['answer']);
              onNext();
            },
          ),
      ],
    );
  }
}

class ResultWidget extends StatelessWidget {
  final int score;
  final int total;

  const ResultWidget({
    Key? key,
    required this.score,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your score is $score out of $total',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back to quizzes'),
        ),
      ],
    );
  }
}