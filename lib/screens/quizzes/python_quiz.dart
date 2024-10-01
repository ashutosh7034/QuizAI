// File: lib/quizzes/python_quiz.dart

import 'package:flutter/material.dart';

class PythonQuizScreen extends StatefulWidget {
  @override
  _PythonQuizScreenState createState() => _PythonQuizScreenState();
}

class _PythonQuizScreenState extends State<PythonQuizScreen> {
  final List<Map<String, dynamic>> questions = [

    {
      'question': 'What is the output of print(2 * 3 ** 3)?',
      'options': ['54', '18', '6', 'None'],
      'answer': '54',
    },
    {
      'question': 'What keyword is used to create a function in Python?',
      'options': ['func', 'define', 'def', 'function'],
      'answer': 'def',
    },
    {
      'question': 'Which of the following is a mutable data type?',
      'options': ['Tuple', 'Set', 'String', 'None'],
      'answer': 'Set',
    },
    {
      'question': 'What does PEP stand for?',
      'options': ['Python Enhancement Proposal', 'Python Executive Program', 'Python Encoding Project', 'None'],
      'answer': 'Python Enhancement Proposal',
    },
    {
      'question': 'How do you create a variable with the numeric value 5?',
      'options': ['5 = x', 'x = 5', 'x := 5', 'None'],
      'answer': 'x = 5',
    },
    {
      'question': 'What is the correct file extension for Python files?',
      'options': ['.pyth', '.pt', '.py', '.python'],
      'answer': '.py',
    },
    {
      'question': 'What is the output of list(range(5))?',
      'options': ['0 1 2 3 4', '[0, 1, 2, 3, 4]', '[1, 2, 3, 4, 5]', 'None'],
      'answer': '[0, 1, 2, 3, 4]',
    },
    {
      'question': 'What is used to define a block of code in Python?',
      'options': ['{}', '[]', '()', ':'],
      'answer': ':',
    },
    {
      'question': 'What will be the output of the following code: print(type([]))?',
      'options': ['<class list>', '<type list>', '<class list()>', '<class dict>'],
      'answer': '<class list>',
    },
    {
      'question': 'Which operator is used for floor division?',
      'options': ['//', '%', '**', '/'],
      'answer': '//',
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
        title: const Text('Python Quiz', style: TextStyle(color: Colors.white)),
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

