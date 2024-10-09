import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditPDFQuizScreen extends StatefulWidget {
  final Map<String, dynamic> quiz;

  const EditPDFQuizScreen({Key? key, required this.quiz}) : super(key: key);

  @override
  _EditPDFQuizScreenState createState() => _EditPDFQuizScreenState();
}

class _EditPDFQuizScreenState extends State<EditPDFQuizScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  List<TextEditingController> _questionControllers = [];
  List<List<TextEditingController>> _optionControllers = [];
  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.quiz['title'] ?? '');
    _descriptionController = TextEditingController(text: widget.quiz['description'] ?? '');
    questions = List<Map<String, dynamic>>.from(widget.quiz['questions'] ?? []);

    // Initialize controllers for existing questions and options
    for (var question in questions) {
      _questionControllers.add(TextEditingController(text: question['text'] ?? ''));
      List<TextEditingController> options = [];
      if (question['options'] != null && question['options'] is List) {
        for (var option in question['options']) {
          options.add(TextEditingController(text: option));
        }
      }
      _optionControllers.add(options);
    }
  }

  Future<void> _updateQuiz() async {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Quiz title cannot be empty")));
      return;
    }

    if (_descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Quiz description cannot be empty")));
      return;
    }

    for (int i = 0; i < questions.length; i++) {
      if (_questionControllers[i].text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Question ${i + 1} cannot be empty")));
        return;
      }

      if (_optionControllers[i].isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Question ${i + 1} must have options")));
        return;
      }

      for (int j = 0; j < _optionControllers[i].length; j++) {
        if (_optionControllers[i][j].text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Option ${j + 1} cannot be empty")));
          return;
        }
      }
    }

    try {
      List<Map<String, dynamic>> updatedQuestions = [];
      for (int i = 0; i < questions.length; i++) {
        Map<String, dynamic> updatedQuestion = {
          'text': _questionControllers[i].text.trim(),
          'type': questions[i]['type'] ?? 'Multiple Choice',
          'options': _optionControllers[i].map((controller) => controller.text.trim()).toList(),
        };

        updatedQuestions.add(updatedQuestion);
      }

      await FirebaseFirestore.instance.collection('quizzes').doc(widget.quiz['id']).update({
        'title': _titleController.text.trim(),
        'description': _descriptionController.text.trim(),
        'questions': updatedQuestions,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Quiz updated successfully")));
      Navigator.pop(context); // Go back after updating
    } catch (e) {
      print("Error updating quiz: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to update quiz: $e")));
    }
  }

  void _addQuestion() {
    setState(() {
      questions.add({'text': '', 'type': 'Multiple Choice', 'options': []});
      _questionControllers.add(TextEditingController());
      _optionControllers.add([]);
    });
  }

  void _removeQuestion(int index) {
    setState(() {
      questions.removeAt(index);
      _questionControllers[index].dispose();
      _questionControllers.removeAt(index);
      for (var controller in _optionControllers[index]) {
        controller.dispose();
      }
      _optionControllers.removeAt(index);
    });
  }

  void _addOption(int questionIndex) {
    setState(() {
      _optionControllers[questionIndex].add(TextEditingController());
      questions[questionIndex]['options'].add('');
    });
  }

  void _removeOption(int questionIndex, int optionIndex) {
    setState(() {
      _optionControllers[questionIndex][optionIndex].dispose();
      _optionControllers[questionIndex].removeAt(optionIndex);
      questions[questionIndex]['options'].removeAt(optionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Quiz from PDF"),
        backgroundColor: Color(0xFF03A9F4),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _updateQuiz,
            tooltip: "Save Changes",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Quiz Title',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Quiz Description',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            const Text("Questions:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF03A9F4))),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[100],
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Question ${index + 1}',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400]!),
                              ),
                            ),
                            controller: _questionControllers[index],
                            onChanged: (text) => setState(() {
                              questions[index]['text'] = text;
                            }),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Options:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 5),
                              ListView.builder(
                                itemCount: _optionControllers[index].length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, optionIndex) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Option ${optionIndex + 1}',
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.blueAccent),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey[400]!),
                                            ),
                                          ),
                                          controller: _optionControllers[index][optionIndex],
                                          onChanged: (text) => setState(() {
                                            questions[index]['options'][optionIndex] = text;
                                          }),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove_circle, color: Colors.redAccent),
                                        onPressed: () {
                                          _removeOption(index, optionIndex);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                              ElevatedButton.icon(
                                onPressed: () => _addOption(index),
                                icon: const Icon(Icons.add, color: Colors.white),
                                label: const Text("Add Option"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF03A9F4),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton.icon(
                              onPressed: () => _removeQuestion(index),
                              icon: const Icon(Icons.remove_circle, color: Colors.red),
                              label: const Text("Remove Question", style: TextStyle(color: Colors.red)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _addQuestion,
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text("Add New Question"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF03A9F4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
