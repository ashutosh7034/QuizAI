import 'dart:math';
import 'package:flutter/material.dart';
import 'quiz_analysis.dart'; // Import the analysis screen

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

  List<Map<String, dynamic>> selectedQuestions = [];
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];
  int totalQuestions = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C++ Quiz', style: TextStyle(color: Colors.white)),
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
