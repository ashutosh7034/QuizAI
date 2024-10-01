// File: lib/quizzes/java_quiz.dart

import 'package:flutter/material.dart';

class JavaQuizScreen extends StatefulWidget {
  @override
  _JavaQuizScreenState createState() => _JavaQuizScreenState();
}

class _JavaQuizScreenState extends State<JavaQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the default value of a boolean variable in Java?',
      'options': ['true', 'false', '1', '0'],
      'answer': 'false',
    },
    {
      'question': 'What is the correct way to declare an array in Java?',
      'options': ['int arr[]', 'int[] arr', 'Both a and b', 'None'],
      'answer': 'Both a and b',
    },
    {
      'question': 'Which of the following is not a valid access modifier in Java?',
      'options': ['public', 'private', 'protected', 'visible'],
      'answer': 'visible',
    },
    {
      'question': 'What is a constructor?',
      'options': ['A method to initialize an object', 'A method to destroy an object', 'None', 'All of the above'],
      'answer': 'A method to initialize an object',
    },
    {
      'question': 'How do you handle exceptions in Java?',
      'options': ['try and catch', 'throw', 'throws', 'None'],
      'answer': 'try and catch',
    },
    {
      'question': 'What is the difference between == and .equals()?',
      'options': ['== checks reference, .equals() checks value', 'Both are the same', '.equals() checks reference, == checks value', 'None'],
      'answer': '== checks reference, .equals() checks value',
    },
    {
      'question': 'What is polymorphism?',
      'options': ['The ability to take on many forms', 'The ability to inherit properties', 'The ability to encapsulate data', 'None'],
      'answer': 'The ability to take on many forms',
    },
    {
      'question': 'What are interfaces in Java?',
      'options': ['Abstract classes', 'Contracts for classes', 'Concrete classes', 'None'],
      'answer': 'Contracts for classes',
    },
    {
      'question': 'What is the output of 5 + 2 + "3"?',
      'options': ['53', '73', 'Error', 'None'],
      'answer': '53',
    },
    {
      'question': 'Which of the following is not a primitive data type in Java?',
      'options': ['int', 'char', 'String', 'float'],
      'answer': 'String',
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
        title: const Text('Java Quiz'),
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
        padding: const EdgeInsets.all( 16.0),
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