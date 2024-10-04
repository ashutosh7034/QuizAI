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

  // Function to update quiz in Firestore
  Future<void> _updateQuiz() async {
    // Validate inputs
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Quiz title cannot be empty")),
      );
      return;
    }

    if (_descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Quiz description cannot be empty")),
      );
      return;
    }

    // Validate each question
    for (int i = 0; i < questions.length; i++) {
      if (_questionControllers[i].text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Question ${i + 1} cannot be empty")),
        );
        return;
      }

      if (questions[i]['type'] == 'Multiple Choice') {
        if (_optionControllers[i].isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Multiple Choice Question ${i + 1} must have options")),
          );
          return;
        }

        for (int j = 0; j < _optionControllers[i].length; j++) {
          if (_optionControllers[i][j].text.trim().isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Option ${j + 1} of Question ${i + 1} cannot be empty")),
            );
            return;
          }
        }
      }
    }

    try {
      // Prepare updated questions data
      List<Map<String, dynamic>> updatedQuestions = [];
      for (int i = 0; i < questions.length; i++) {
        Map<String, dynamic> updatedQuestion = {
          'text': _questionControllers[i].text.trim(),
          'type': questions[i]['type'] ?? 'Multiple Choice', // Default to 'Multiple Choice' if not specified
        };

        if (updatedQuestion['type'] == 'Multiple Choice') {
          updatedQuestion['options'] = _optionControllers[i].map((controller) => controller.text.trim()).toList();
          // Optionally, handle 'correctAnswer' if applicable
          if (questions[i]['correctAnswer'] != null) {
            updatedQuestion['correctAnswer'] = questions[i]['correctAnswer'];
          }
        }

        // Add other question types handling here if necessary

        updatedQuestions.add(updatedQuestion);
      }

      // Update Firestore
      await FirebaseFirestore.instance.collection('quizzes').doc(widget.quiz['id']).update({
        'title': _titleController.text.trim(),
        'description': _descriptionController.text.trim(),
        'questions': updatedQuestions,
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Quiz updated successfully")),
      );

      Navigator.pop(context); // Go back after updating
    } catch (e) {
      print("Error updating quiz: $e");
      // Handle error (show a message to the user)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update quiz: $e")),
      );
    }
  }

  // Function to add a new question
  void _addQuestion() {
    setState(() {
      questions.add({'text': '', 'type': 'Multiple Choice', 'options': []});
      _questionControllers.add(TextEditingController());
      _optionControllers.add([]);
    });
  }

  // Function to remove a question
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

  // Function to add an option to a question
  void _addOption(int questionIndex) {
    setState(() {
      _optionControllers[questionIndex].add(TextEditingController());
      questions[questionIndex]['options'].add('');
    });
  }

  // Function to remove an option from a question
  void _removeOption(int questionIndex, int optionIndex) {
    setState(() {
      _optionControllers[questionIndex][optionIndex].dispose();
      _optionControllers[questionIndex].removeAt(optionIndex);
      questions[questionIndex]['options'].removeAt(optionIndex);
    });
  }

  // Function to update question text
  void _updateQuestion(int index) {
    setState(() {
      questions[index]['text'] = _questionControllers[index].text;
    });
  }

  // Function to update an option text
  void _updateOption(int questionIndex, int optionIndex) {
    setState(() {
      questions[questionIndex]['options'][optionIndex] = _optionControllers[questionIndex][optionIndex].text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Quiz"),
        backgroundColor: Colors.blueAccent, // Use your preferred color
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
            // Quiz Title
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
            // Quiz Description
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
              child: questions.isEmpty
                  ? Center(child: Text("No questions added yet. Add a new question!"))
                  : ListView.builder(
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
                          // Question Text
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Question ${index + 1}',
                              labelStyle: TextStyle(color: Colors.grey[700]),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400]!),
                              ),
                            ),
                            controller: _questionControllers[index],
                            onChanged: (text) => _updateQuestion(index),
                          ),
                          const SizedBox(height: 10),
                          // Question Type Dropdown
                          DropdownButtonFormField<String>(
                            value: questions[index]['type'] ?? 'Multiple Choice',
                            items: <String>['Multiple Choice', 'Short Answer', 'Paragraph']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              labelText: 'Question Type',
                              labelStyle: TextStyle(color: Colors.grey[700]),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                questions[index]['type'] = newValue!;
                                // If the new type doesn't support options, clear existing options
                                if (newValue != 'Multiple Choice') {
                                  _optionControllers[index].forEach((controller) => controller.dispose());
                                  _optionControllers[index].clear();
                                  questions[index]['options'] = [];
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          // Display options for Multiple Choice questions
                          if (questions[index]['type'] == 'Multiple Choice')
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Options:",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
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
                                              labelStyle: TextStyle(color: Colors.grey[700]),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.blueAccent),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[400]!),
                                              ),
                                            ),
                                            controller: _optionControllers[index][optionIndex],
                                            onChanged: (text) => _updateOption(index, optionIndex),
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
                                const SizedBox(height: 5),
                                ElevatedButton.icon(
                                  onPressed: () => _addOption(index),
                                  icon: const Icon(Icons.add, color: Colors.white),
                                  label: const Text("Add Option"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent, // Your button color
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 10),
                          // Remove Question Button
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton.icon(
                              onPressed: () => _removeQuestion(index),
                              icon: const Icon(Icons.remove_circle, color: Colors.red),
                              label: const Text(
                                "Remove Question",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Add Question Button
            ElevatedButton.icon(
              onPressed: _addQuestion,
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text("Add Question"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            // Update Quiz Button
            ElevatedButton(
              onPressed: _updateQuiz,
              child: const Text("Update Quiz"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
