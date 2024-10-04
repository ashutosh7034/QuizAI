import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  final TextEditingController _formTitleController = TextEditingController();
  final TextEditingController _formDescriptionController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _questionType = 'Short Answer';
  List<String> _multipleChoices = [];
  String? _correctAnswer;
  List<Map<String, dynamic>> questions = [];
  bool collectEmail = false;
  bool limitResponses = false;
  int timePerQuestion = 5;
  bool isLoading = false;

  // Adjust these colors to match your app's theme
  final Color primaryColor = Color(0xFF006699); // Replace with your primary color
  final Color secondaryColor = Color(0xFF0099CC); // Replace with your secondary color
  final Color accentColor = Color(0xFFFFCC00); // Replace with your accent color
  final Color textColor = Colors.white;

  void _addQuestion() {
    if (_questionController.text.isNotEmpty) {
      setState(() {
        questions.add({
          'text': _questionController.text,
          'type': _questionType,
          'options': _questionType == 'Multiple Choice' ? List.from(_multipleChoices) : [],
          'correctAnswer': _correctAnswer,
        });
        _questionController.clear();
        _multipleChoices.clear();
        _correctAnswer = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Question cannot be empty!')),
      );
    }
  }

  Future<void> _createQuiz() async {
    if (_formTitleController.text.isEmpty || questions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quiz title and at least one question are required.')),
      );
      return;
    }

    final quizData = {
      'title': _formTitleController.text,
      'description': _formDescriptionController.text,
      'questions': questions,
      'collectEmail': collectEmail,
      'limitResponses': limitResponses,
      'timePerQuestion': timePerQuestion,
      'created_at': FieldValue.serverTimestamp(),
      'createdBy': 'manual',
    };

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseFirestore.instance.collection('quizzes').add(quizData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quiz created successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating quiz: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a Quiz"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuizDetailsSection(),
            const SizedBox(height: 20),
            _buildQuestionSection(),
            const SizedBox(height: 20),
            _buildAddedQuestionsList(),
            const SizedBox(height: 20),
            _buildFormSettings(),
            const SizedBox(height: 20),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Create a New Quiz",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
        const SizedBox(height: 16),
        _buildTextField(_formTitleController, 'Quiz Title'),
        const SizedBox(height: 16),
        _buildTextField(_formDescriptionController, 'Quiz Description'),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: secondaryColor.withOpacity(0.1),
      ),
    );
  }

  Widget _buildQuestionSection() {
    final TextEditingController optionController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Add Questions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
        const SizedBox(height: 10),
        _buildTextField(_questionController, 'Question'),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: _questionType,
          items: ['Short Answer', 'Paragraph', 'Multiple Choice'].map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
          onChanged: (value) {
            setState(() {
              _questionType = value!;
            });
          },
        ),
        if (_questionType == 'Multiple Choice') ...[
          _buildTextField(optionController, 'Option'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: accentColor),
            onPressed: () {
              setState(() {
                if (optionController.text.isNotEmpty) {
                  _multipleChoices.add(optionController.text);
                  optionController.clear();
                }
              });
            },
            child: const Text("Add Option"),
          ),
          Wrap(
            spacing: 6,
            children: _multipleChoices
                .map((option) => Chip(
              label: Text(option),
              backgroundColor: accentColor.withOpacity(0.2),
              deleteIconColor: primaryColor,
              onDeleted: () {
                setState(() {
                  _multipleChoices.remove(option);
                });
              },
            ))
                .toList(),
          ),
          DropdownButton<String>(
            hint: const Text("Select Correct Answer"),
            value: _correctAnswer,
            items: _multipleChoices.map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
            onChanged: (value) {
              setState(() {
                _correctAnswer = value;
              });
            },
          ),
        ],
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
          onPressed: _addQuestion,
          child: const Text("Add Question"),
        ),
      ],
    );
  }

  Widget _buildAddedQuestionsList() {
    return Column(
      children: questions
          .map((question) => ListTile(
        tileColor: secondaryColor.withOpacity(0.1),
        title: Text(question['text'], style: TextStyle(color: primaryColor)),
        subtitle: Text("Type: ${question['type']}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            setState(() {
              questions.remove(question);
            });
          },
        ),
      ))
          .toList(),
    );
  }

  Widget _buildFormSettings() {
    return Column(
      children: [
        CheckboxListTile(
          activeColor: primaryColor,
          title: const Text("Collect Email Addresses"),
          value: collectEmail,
          onChanged: (value) {
            setState(() {
              collectEmail = value!;
            });
          },
        ),
        CheckboxListTile(
          activeColor: primaryColor,
          title: const Text("Limit Responses"),
          value: limitResponses,
          onChanged: (value) {
            setState(() {
              limitResponses = value!;
            });
          },
        ),
        Row(
          children: [
            const Text("Time per question (seconds):"),
            const SizedBox(width: 10),
            DropdownButton<int>(
              value: timePerQuestion,
              items: [5, 10, 15, 20, 30, 60].map((time) => DropdownMenuItem(value: time, child: Text("$time"))).toList(),
              onChanged: (value) {
                setState(() {
                  timePerQuestion = value!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
          onPressed: _previewQuiz,
          child: const Text("Preview"),
        ),
        GestureDetector(
          onTap: _createQuiz,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: isLoading
                ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                : const Text("Share", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  void _previewQuiz() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Quiz Preview"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Title: ${_formTitleController.text}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 10),
                Text("Description: ${_formDescriptionController.text}", style: const TextStyle(fontSize: 16, color: Colors.black54)),
                const SizedBox(height: 20),
                const Text("Questions:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 10),
                for (var question in questions)
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(question['text'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          if (question['type'] == 'Multiple Choice') ...[
                            const SizedBox(height: 10),
                            for (var option in question['options'])
                              Text("- $option", style: const TextStyle(fontSize: 14)),
                          ],
                          if (question['correctAnswer'] != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Correct Answer: ${question['correctAnswer']}", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                            ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
