import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/quizzes/quiz_analysis.dart';

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
  List<String> selectedAnswers = [];
  int totalQuestions = 0;
  List<Map<String, dynamic>> selectedQuestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Java Quiz' ,style: TextStyle(color: Colors.white)),
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
        child: totalQuestions == 0 ? _buildQuestionInput() : _buildQuiz(),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          selectedQuestions[currentQuestionIndex]['question'],
          style: const TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ...selectedQuestions[currentQuestionIndex]['options'].map<Widget>((option) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(option, style: const TextStyle(fontSize: 16)),
              tileColor: Colors.purpleAccent.shade100,
              onTap: () => selectAnswer(option),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }).toList(),
      ],
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

    // Navigate to QuizAnalysisScreen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => QuizAnalysisScreen(
          score: score,
          totalQuestions: totalQuestions,
          selectedAnswers: selectedAnswers,
          selectedQuestions: selectedQuestions,
        ),
      ),
    );
  }
}
