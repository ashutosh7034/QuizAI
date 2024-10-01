// File: lib/quizzes/c_plus_plus_quiz.dart

import 'package:flutter/material.dart';

class CPlusPlusQuizScreen extends StatefulWidget {
  @override
  _CPlusPlusQuizScreenState createState() => _CPlusPlusQuizScreenState();
}

class _CPlusPlusQuizScreenState extends State<CPlusPlusQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the output of cout << "Hello World";?',
      'options': ['Hello World', 'cout Hello World', 'Error', 'None'],
      'answer': 'Hello World',
    },
    {
      'question': 'What is the correct way to define a class in C++?',
      'options': ['class MyClass {}', 'MyClass class {}', 'class MyClass()', 'None'],
      'answer': 'class MyClass {}',
    },
    {
      'question': 'What is the purpose of the #include directive?',
      'options': ['To include libraries', 'To define classes', 'To create functions', 'None'],
      'answer': 'To include libraries',
    },
    {
      'question': 'What is the correct syntax to declare a pointer in C++?',
      'options': ['int* p', 'int p*', '*int p', 'None'],
      'answer': 'int* p',
    },
    {
      'question': 'What is the output of 5 % 2?',
      'options': ['2', '1', '0', '5'],
      'answer': '1',
    },
    {
      'question': 'What is a constructor?',
      'options': ['A method called when an object is created', 'A method to destroy an object', 'None', 'All of the above'],
      'answer': 'A method called when an object is created',
    },
    {
      'question': 'What is the purpose of the virtual keyword?',
      'options': ['To declare a virtual function', 'To create a pointer', 'To create a reference', 'None'],
      'answer': 'To declare a virtual function',
    },
    {
      'question': 'What is encapsulation?',
      'options': ['Hiding data', 'Inheriting properties', 'Creating interfaces', 'None'],
      'answer': 'Hiding data',
    },
    {
      'question': 'What is inheritance?',
      'options': ['Deriving new classes from existing ones', 'Creating new classes', 'None', 'All of the above'],
      'answer': 'Deriving new classes from existing ones',
    },
    {
      'question': 'What is a destructor?',
      'options': ['A method called when an object is destroyed', 'A method to create an object', 'None', 'All of the above'],
      'answer': 'A method called when an object is destroyed',
    },
  ];

  int currentQuestionIndex = 0;
  List<String> selectedAnswers = List.filled(10, '');

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i]['answer']) {
        score++;
      }
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text('Your score is $score out of ${questions.length}'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Close the quiz screen
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C++ Quiz'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade700, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ...questions[currentQuestionIndex]['options'].map<Widget>((option) {
              return ElevatedButton(
                onPressed: () => selectAnswer (option),
                child: Text(option),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.purpleAccent,
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}