import 'dart:convert'; // Import for JSON encoding
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import HTTP package
import 'package:firebase_auth/firebase_auth.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  // Form fields
  final TextEditingController _formTitleController = TextEditingController();
  final TextEditingController _formDescriptionController =
  TextEditingController();
  bool collectEmail = false;
  bool limitResponses = false;
  bool isLoading = false; // For loading indicator
  int timePerQuestion = 5; // Default time per question in seconds

  // List to hold questions
  List<Map<String, dynamic>> questions = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _createQuiz() async {
    try {
      await FirebaseFirestore.instance.collection('quizzes').add({
        'title': _formTitleController.text,
        'description': _formDescriptionController.text,
        'createdBy': 'manual', // Set createdBy to 'manual'
        'questions': [], // Include questions if applicable
      });
      // Optionally navigate back or show a success message
      print("Quiz created successfully.");
    } catch (e) {
      print("Error creating quiz: $e");
      // Handle error (show a message to the user)
    }
  }

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
              "Quiz Title ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
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
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionOptions() {
    return Column(
      children: [
        for (int index = 0; index < questions.length; index++)
          ListTile(
            title: Text(questions[index]['text'] ?? "No Question"),
            subtitle: Text(
                "Type: ${questions[index]['type'] ?? "Unknown Type"}\nCorrect Answer: ${questions[index]['correctAnswer'] ?? "Not Set"}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    _showEditQuestionDialog(index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      questions.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          ),
        ElevatedButton(
          onPressed: () {
            _showAddQuestionDialog();
          },
          child: const Text ("Add Question"),
        ),
      ],
    );
  }

  void _showAddQuestionDialog() {
    final TextEditingController questionController = TextEditingController();
    String questionType = 'Short Answer';
    List<String> multipleChoices = [];
    final TextEditingController optionController = TextEditingController();
    String? correctAnswer; // Variable to hold the correct answer
    bool showAnswer = false; // Variable to hold whether to show the answer

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Add a Question"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Please enter your question below:",
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextField(
                      controller: questionController,
                      decoration: const InputDecoration(
                          hintText: "Enter your question"),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Select Question Type:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      value: questionType,
                      items: <String>[
                        'Short Answer',
                        'Paragraph',
                        'Multiple Choice'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setDialogState(() {
                          questionType = newValue!;
                          if (questionType != 'Multiple Choice') {
                            multipleChoices.clear();
                            correctAnswer = null; // Reset the correct answer
                          }
                        });
                      },
                    ),
                    if (questionType == 'Multiple Choice') ...[
                      const SizedBox(height: 10),
                      const Text("Add Options:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextField(
                        controller: optionController,
                        decoration:
                        const InputDecoration(hintText: "Enter an option"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setDialogState(() {
                            if (optionController.text.isNotEmpty) {
                              multipleChoices.add(optionController.text);
                              optionController.clear();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Option cannot be empty!')),
                              );
                            }
                          });
                        },
                        child: const Text("Add Option"),
                      ),
                      for (var option in multipleChoices)
                        ListTile(
                          title: Text(option),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setDialogState(() {
                                multipleChoices.remove(option);
                              });
                            },
                          ),
                        ),
                      DropdownButton<String>(
                        value: correctAnswer,
                        hint: const Text("Select the correct answer"),
                        items: multipleChoices.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setDialogState(() {
                            correctAnswer = newValue;
                          });
                        },
                      ),
                    ],
                    CheckboxListTile(
                      title: const Text("Show Correct Answer"),
                      value: showAnswer,
                      onChanged: (bool? value) {
                        setDialogState(() {
                          showAnswer = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (questionController.text.isNotEmpty) {
                        final question = {
                          'text': questionController.text,
                          'type': questionType,
                          'options': questionType == 'Multiple Choice'
                              ? multipleChoices
                              : [],
                          'correctAnswer':
                          correctAnswer, // Add the correct answer to the question
                          'showAnswer':
                          showAnswer, // Add the show answer preference
                        };
                        questions.add(question);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Question cannot be empty!')),
                        );
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
      },
    );
  }

  void _showEditQuestionDialog(int index) {
    final TextEditingController questionController =
    TextEditingController(text: questions[index]['text']);
    String questionType = questions[index]['type'];
    List<String> multipleChoices =
    List<String>.from(questions[index]['options']);
    final TextEditingController optionController = TextEditingController();
    String? correctAnswer = questions[index]['correct Answer'];
    bool showAnswer = questions[index]['showAnswer'];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Edit Question"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: questionController,
                      decoration: const InputDecoration(
                          hintText: "Enter your question"),
                    ),
                    DropdownButton<String>(
                      value: questionType,
                      items: <String>[
                        'Short Answer',
                        'Paragraph',
                        'Multiple Choice'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setDialogState(() {
                          questionType = newValue!;
                          if (questionType != 'Multiple Choice') {
                            // Reset options if the type is not Multiple Choice
                            multipleChoices.clear();
                            correctAnswer = null; // Reset the correct answer
                          }
                        });
                      },
                    ),
                    if (questionType == 'Multiple Choice') ...[
                      Column(
                        children: [
                          TextField(
                            controller: optionController,
                            decoration: const InputDecoration(
                                hintText: "Enter an option"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setDialogState(() {
                                if (optionController.text.isNotEmpty) {
                                  multipleChoices.add(optionController.text);
                                  optionController.clear();
                                }
                              });
                            },
                            child: const Text("Add Option"),
                          ),
                          for (var option in multipleChoices)
                            ListTile(
                              title: Text(option),
                              trailing: IconButton(
                                icon:
                                const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setDialogState(() {
                                    multipleChoices.remove(option);
                                  });
                                },
                              ),
                            ),
                          // Add dropdown for selecting the correct answer
                          DropdownButton<String>(
                            value: correctAnswer,
                            hint: const Text("Select the correct answer"),
                            items: multipleChoices.map((String option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setDialogState(() {
                                correctAnswer = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                    // Checkbox for showing the correct answer
                    CheckboxListTile(
                      title: const Text("Show Correct Answer"),
                      value: showAnswer,
                      onChanged: (bool? value) {
                        setDialogState(() {
                          showAnswer = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (questionController.text.isNotEmpty) {
                        final question = {
                          'text': questionController.text,
                          'type': questionType,
                          'options': questionType == 'Multiple Choice'
                              ? multipleChoices
                              : [],
                          'correctAnswer': correctAnswer,
                          'showAnswer': showAnswer,
                        };
                        questions[index] =
                            question; // Update the existing question
                      }
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text("Update"),
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
      },
    );
  }

  Widget _buildFormSettings() {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text("Collect Email Addresses"),
          value: collectEmail,
          onChanged: (bool? value) {
            setState(() {
              collectEmail = value!;
              if (value) {
                _storeEmailInFirestore();
              }
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Limit Responses"),
          value: limitResponses,
          onChanged: (bool? value) {
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
              items: const [
                DropdownMenuItem<int>(child: Text("5"), value: 5),
                DropdownMenuItem<int>(child: Text("10"), value: 10),
                DropdownMenuItem<int>(child: Text("15"), value: 15),
                DropdownMenuItem<int>(child: Text("20"), value: 20),
                DropdownMenuItem<int>(child: Text("30"), value: 30),
                DropdownMenuItem<int>(child: Text("60"), value: 60),
              ],
              onChanged: (int? newValue) {
                setState(() {
                  timePerQuestion = newValue!;
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
          onPressed: _previewQuiz,
          child: const Text("Preview"),
        ),
        GestureDetector(
          onTap: _shareQuiz,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: isLoading
                ? const CircularProgressIndicator (
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                : const Text(
              "Share",
              style: TextStyle(color: Colors.white),
            ),
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
                Text(
                  "Title: ${_formTitleController.text}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  "Description: ${_formDescriptionController.text}",
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Questions:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
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
                          Text(
                            question['text'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          if (question['type'] == 'Multiple Choice') ...[
                            const SizedBox(height: 10),
                            for (var option in question['options'])
                              Text("- $option",
                                  style: const TextStyle(fontSize: 14)),
                          ],
                          if (question['showAnswer'] == true)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Correct Answer: ${question['correctAnswer']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
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

  Future<void> _shareQuiz() async {
    if (_formTitleController.text.isEmpty || questions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quiz title and questions are required')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

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

    try {
      await FirebaseFirestore.instance.collection('quizzes').add(quizData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quiz shared successfully!')),
      );
    } on FirebaseException catch (e) {
      print("Error sharing quiz: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sharing quiz: ${e.message}')),
      );
    } catch (e) {
      print("Error sharing quiz: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error sharing quiz, please try again')),
      );
    } finally {
      setState(() {
        isLoading = false; // Reset loading state
      });
    }
  }

  void _storeEmailInFirestore() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'email': user.email,
      });
    }
  }
}