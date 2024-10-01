// File: lib/quizzes/javascript_quiz.dart

import 'package:flutter/material.dart';

class JavaScriptQuizScreen extends StatefulWidget {
  @override
  _JavaScriptQuizScreenState createState() => _JavaScriptQuizScreenState();
}

class _JavaScriptQuizScreenState extends State<JavaScriptQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Which of the following is not a JavaScript data type?',
      'options': ['String', 'Boolean', 'Undefined', 'Character'],
      'answer': 'Character',
    },
    {
      'question': 'How do you create a function in JavaScript?',
      'options': ['function myFunction() {}', 'create function myFunction() {}', 'function: myFunction() {}', 'None'],
      'answer': 'function myFunction() {}',
    },
    {
      'question': 'What is the output of console.log(typeof NaN)?',
      'options': ['number', 'undefined', 'object', 'None'],
      'answer': 'number',
    },
    {
      'question': 'Which method is used to convert a JSON string into a JavaScript object?',
      'options': ['JSON.parse()', 'JSON.stringify()', 'JSON.convert()', 'None'],
      'answer': 'JSON.parse()',
    },
    {
      'question': 'What is the correct way to declare a variable in JavaScript?',
      'options': ['var x', 'x = var', 'var x =;', 'None'],
      'answer': 'var x',
    },
    {
      'question': 'Which symbol is used for comments in JavaScript?',
      'options': ['#', '//', '/* */', 'None'],
      'answer': '//',
    },
    {
      'question': 'What is the result of 2 + "2"?',
      'options': ['22', '4', 'Error', 'None'],
      'answer': '22',
    },
    {
      'question': 'What is the purpose of the `this` keyword?',
      'options': ['Refer to the current object', 'Refer to the global object', 'None', 'All of the above'],
      'answer': 'Refer to the current object',
    },
    {
      'question': 'Which of the following methods is used to add an element to the end of an array?',
      'options': ['push()', 'append()', 'add()', 'None'],
      'answer': 'push()',
    },
    {
      'question': 'What does JSON stand for?',
      'options': ['JavaScript Object Notation', 'Java Standard Object Notation', 'JavaScript Object Number', 'None'],
      'answer': 'JavaScript Object Notation',
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
        title: const Text('Quiz Completed!', style: TextStyle(color: Colors.deepPurple)),
        content: Text('Your score is $score out of ${questions.length}', style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            child: const Text('OK', style: TextStyle(color: Colors.deepPurple)),
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
        title: const Text('JavaScript Quiz', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
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
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...questions[currentQuestionIndex]['options'].map<Widget>((option) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.purpleAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
                onPressed: () => selectAnswer(option),
                child: Text(option, style: const TextStyle(fontSize: 18)),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
