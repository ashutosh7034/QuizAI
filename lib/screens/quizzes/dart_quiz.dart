// File: lib/quizzes/dart_quiz.dart

import 'package:flutter/material.dart';

class DartQuizScreen extends StatefulWidget {
  @override
  _DartQuizScreenState createState() => _DartQuizScreenState();
}

class _DartQuizScreenState extends State<DartQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the output of print("Dart" + " is awesome!")?',
      'options': ['Dart is awesome!', 'Error', 'Dart + is awesome!', 'None'],
      'answer': 'Dart is awesome!',
    },
    {
      'question': 'What type of programming language is Dart?',
      'options': ['Dynamically typed', 'Statically typed', 'Both', 'None'],
      'answer': 'Both',
    },
    {
      'question': 'Which of the following is used to declare a variable in Dart?',
      'options': ['var', 'let', 'const', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the correct way to define a function in Dart?',
      'options': ['void myFunction() {}', 'def myFunction() {}', 'function myFunction() {}', 'None'],
      'answer': 'void myFunction() {}',
    },
    {
      'question': 'How do you create a constant variable in Dart?',
      'options': ['const x = 10;', 'final x = 10;', 'var x = 10;', 'None'],
      'answer': 'const x = 10;',
    },
    {
      'question': 'What does the async keyword do in Dart?',
      'options': ['Makes a function synchronous', 'Makes a function asynchronous', 'None', 'All of the above'],
      'answer': 'Makes a function asynchronous',
    },
    {
      'question': 'What is the output of print(10.isEven)?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'true',
    },
    {
      'question': 'What is the purpose of the main() function in Dart?',
      'options': ['To declare a class', 'To start execution of the program', 'To create a variable', 'None'],
      'answer': 'To start execution of the program',
    },
    {
      'question': 'What is the use of the List class in Dart?',
      'options': ['To create an array', 'To create a map', 'To create a set', 'None'],
      'answer': 'To create an array',
    },
    {
      'question': 'What is a mixin in Dart?',
      'options': ['A way to reuse a class\'s code', 'A type of inheritance', 'None', 'All of the above'],
      'answer': 'A way to reuse a class\'s code',
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
        title: const Text('Dart Quiz'),
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
            ...questions[currentQuestionIndex ]['options'].map<Widget>((option) {
              return ElevatedButton(
                onPressed: () => selectAnswer(option),
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