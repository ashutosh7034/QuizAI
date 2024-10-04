import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditQuizDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> quiz;

  const EditQuizDetailsScreen({Key? key, required this.quiz}) : super(key: key);

  @override
  _EditQuizDetailsScreenState createState() => _EditQuizDetailsScreenState();
}

class _EditQuizDetailsScreenState extends State<EditQuizDetailsScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  List<TextEditingController> _questionControllers = [];
  List<List<TextEditingController>> _optionControllers = [];

  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.quiz['title']);
    _descriptionController = TextEditingController(text: widget.quiz['description']);
    questions = List<Map<String, dynamic>>.from(widget.quiz['questions'] ?? []);

    // Initialize controllers for existing questions and options
    for (var question in questions) {
      _questionControllers.add(TextEditingController(text: question['question']));
      List<TextEditingController> options = [];
      for (var option in question['options']) {
        options.add(TextEditingController(text: option));
      }
      _optionControllers.add(options);
    }
  }

  // Function to update quiz in Firestore
  Future<void> _updateQuiz() async {
    try {
      await FirebaseFirestore.instance.collection('quizzes').doc(widget.quiz['id']).update({
        'title': _titleController.text,
        'description': _descriptionController.text,
        'questions': questions.map((question) {
          return {
            'question': question['question'],
            'options': question['options'],
          };
        }).toList(),
      });
      Navigator.pop(context); // Go back after updating
    } catch (e) {
      print("Error updating quiz: $e");
      // Handle error (show a message to the user)
    }
  }

  // Function to add a new question
  void _addQuestion() {
    setState(() {
      questions.add({'question': '', 'options': []});
      _questionControllers.add(TextEditingController());
      _optionControllers.add([]);
    });
  }

  // Function to remove a question
  void _removeQuestion(int index) {
    setState(() {
      questions.removeAt(index);
      _questionControllers.removeAt(index);
      _optionControllers.removeAt(index);
    });
  }

  // Function to add an option to a question
  void _addOption(int questionIndex) {
    setState(() {
      questions[questionIndex]['options'].add('');
      _optionControllers[questionIndex].add(TextEditingController());
    });
  }

  // Function to update question text
  void _updateQuestion(int index) {
    setState(() {
      questions[index]['question'] = _questionControllers[index].text;
    });
  }

  // Function to update an option text
  void _updateOption(int questionIndex, int optionIndex) {
    setState(() {
      questions[questionIndex]['options'][optionIndex] =
          _optionControllers[questionIndex][optionIndex].text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Quiz"),
        backgroundColor: Colors.blueAccent, // Use your preferred color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Quiz Title',
                labelStyle: TextStyle(color: Colors.grey[700]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent), // Your color
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
                labelStyle: TextStyle(color: Colors.grey[700]),
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
            const Text(
              "Questions:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Question ${index + 1}',
                              labelStyle: TextStyle(color: Colors.grey[700]),
                            ),
                            controller: _questionControllers[index],
                            onChanged: (text) => _updateQuestion(index),
                          ),
                          const SizedBox(height: 10),
                          // Display options for the question
                          ListView.builder(
                            itemCount: questions[index]['options'].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, optionIndex) {
                              return TextField(
                                decoration: InputDecoration(
                                  labelText: 'Option ${optionIndex + 1}',
                                  labelStyle: TextStyle(color: Colors.grey[700]),
                                ),
                                controller: _optionControllers[index][optionIndex],
                                onChanged: (text) => _updateOption(index, optionIndex),
                              );
                            },
                          ),
                          ElevatedButton.icon(
                            onPressed: () => _addOption(index),
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: const Text("Add Option"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent, // Your button color
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () => _removeQuestion(index),
                            icon: const Icon(Icons.remove_circle, color: Colors.red),
                            label: const Text("Remove Question", style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _addQuestion,
              child: const Text("Add Question"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateQuiz,
              child: const Text("Update Quiz"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose all controllers
    _titleController.dispose();
    _descriptionController.dispose();
    for (var controller in _questionControllers) {
      controller.dispose();
    }
    for (var controllers in _optionControllers) {
      for (var controller in controllers) {
        controller.dispose();
      }
    }
    super.dispose();
  }
}
