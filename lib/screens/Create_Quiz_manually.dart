import 'dart:convert'; // Import for JSON encoding
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import HTTP package

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  // Form fields
  final TextEditingController _formTitleController = TextEditingController();
  final TextEditingController _formDescriptionController = TextEditingController();
  bool collectEmail = false;
  bool limitResponses = false;
  bool isLoading = false; // For loading indicator

  // List to hold questions
  List<Map<String, String>> questions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a Quiz"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create a New Quiz",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Step 1: Quiz Title & Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Quiz Title Input
            TextField(
              controller: _formTitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: "Enter your quiz title",
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 20),

            // Quiz Description Input
            const Text(
              "Quiz Description (Optional)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: _formDescriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: "Enter a brief description of the quiz",
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 20),

            // Question Options
            const Text(
              "Add Questions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            _buildQuestionOptions(),
            const SizedBox(height: 20),

            // Form Settings
            const Text(
              "Form Settings",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            _buildFormSettings(),
            const SizedBox(height: 20),

            // Bottom Buttons for Preview and Share
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  // Build Question Options Widget
  Widget _buildQuestionOptions() {
    return Column(
      children: [
        for (var question in questions)
          ListTile(
            title: Text(question['type'] ?? "Unknown Type"),
            subtitle: Text(question['text'] ?? "No Question"),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  questions.remove(question);
                });
              },
            ),
          ),
        ElevatedButton(
          onPressed: () {
            // Logic to add a new question
            _showAddQuestionDialog();
          },
          child: const Text("Add Question"),
        ),
      ],
    );
  }

  // Function to show dialog for adding a new question
  void _showAddQuestionDialog() {
    final TextEditingController questionController = TextEditingController();
    String questionType = 'Short Answer';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add a Question"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: questionController,
                decoration: const InputDecoration(hintText: "Enter your question"),
              ),
              DropdownButton<String>(
                value: questionType,
                items: <String>['Short Answer', 'Paragraph', 'Multiple Choice']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    questionType = newValue!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (questionController.text.isNotEmpty) {
                    questions.add({'text': questionController.text, 'type': questionType});
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  // Form Settings Widget
  Widget _buildFormSettings() {
    return Column(
      children: [
        SwitchListTile(
          title: const Text("Collect Email Addresses"),
          value: collectEmail,
          activeColor: Colors.blueAccent,
          onChanged: (bool value) {
            setState(() {
              collectEmail = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text("Limit responses to one person"),
          value: limitResponses,
          activeColor: Colors.blueAccent,
          onChanged: (bool value) {
            setState(() {
              limitResponses = value;
            });
          },
        ),
      ],
    );
  }

  // Bottom Buttons for Preview and Share
  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: _previewQuiz,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: const Text(
            "Preview",
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: isLoading ? null : _shareQuiz,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: isLoading
              ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
              : const Text(
            "Share",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  // Sample Preview Quiz Function
  void _previewQuiz() {
    // Logic to preview the quiz
    print("Previewing Quiz: ${_formTitleController.text}");
  }

  // Share Quiz Function (Send data to backend)
  Future<void> _shareQuiz() async {
    if (_formTitleController.text.isEmpty || questions.isEmpty) {
      // Show an error message if title or questions are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in the quiz title and add at least one question.")),
      );
      return;
    }

    setState(() {
      isLoading = true; // Start loading
    });

    final quizData = {
      'title': _formTitleController.text,
      'description': _formDescriptionController.text,
      'questions': questions,
      'collectEmail': collectEmail,
      'limitResponses': limitResponses,
    };

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/quizzes'), // Update to your backend URL if different
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(quizData),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Quiz shared successfully!")),
        );
        // Optionally clear the form
        _clearForm();
      } else {
        throw Exception('Failed to share quiz');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() {
        isLoading = false; // Stop loading
      });
    }
  }

  // Clear the form after submission
  void _clearForm() {
    _formTitleController.clear();
    _formDescriptionController.clear();
    questions.clear();
    collectEmail = false;
    limitResponses = false;
  }
}
