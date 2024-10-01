import 'dart:math';
import 'package:flutter/material.dart';
import 'quiz_analysis.dart'; // Import the analysis screen

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

  List<Map<String, dynamic>> selectedQuestions = [];
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];
  int totalQuestions = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Quiz', style: TextStyle(color: Colors.white)),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: totalQuestions == 0 ? _buildQuestionInput() : _buildQuiz(),
        ),
      ),
    );
  }

  Widget _buildQuestionInput() {
    final TextEditingController questionCountController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Enter the number of questions you want to practice:',
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: questionCountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.3),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Number of Questions',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            int? count = int.tryParse(questionCountController.text);
            if (count != null && count > 0) {
              setState(() {
                totalQuestions = count > questions.length ? questions.length : count; // Limit to available questions
                selectedQuestions = _getRandomQuestions(totalQuestions);
                selectedAnswers = List.filled(totalQuestions, '');
                currentQuestionIndex = 0;
              });
            }
          },
          child: const Text('Start Quiz', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  Widget _buildQuiz() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Column(
        key: ValueKey<int>(currentQuestionIndex),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Question ${currentQuestionIndex + 1} of $totalQuestions',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            selectedQuestions[currentQuestionIndex]['question'],
            style: const TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: selectedQuestions[currentQuestionIndex]['options']
                  .map<Widget>((option) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10), // Add margin for spacing
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purpleAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    ),
                    onPressed: () => selectAnswer(option),
                    child: Text(option, style: const TextStyle(fontSize: 18)),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getRandomQuestions(int count) {
    // Shuffle the list of questions and select the number specified by the user
    final random = Random();
    List<Map<String, dynamic>> shuffledQuestions = List.from(questions)..shuffle(random);
    return shuffledQuestions.take(count).toList();
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;
      if (currentQuestionIndex < selectedQuestions.length - 1) {
        currentQuestionIndex++;
      } else {
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    int score = 0;
    for (int i = 0; i < selectedQuestions.length; i++) {
      if (selectedAnswers[i] == selectedQuestions[i]['answer']) {
        score++;
      }
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed!', style: TextStyle(color: Colors.deepPurple)),
        content: Text('Your score is $score out of $totalQuestions', style: const TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            child: const Text('OK', style: TextStyle(color: Colors.deepPurple)),
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              // Navigate to analysis screen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => QuizAnalysisScreen(
                    score: score,
                    totalQuestions: totalQuestions,
                    selectedQuestions: selectedQuestions,
                    selectedAnswers: selectedAnswers,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
