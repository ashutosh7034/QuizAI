// File: lib/screens/quiz_screen.dart

import 'dart:async'; // Import Timer class

import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String title;
  final String description;
  final List<Map<String, dynamic>> questions;
  final int timePerQuestion;

  const QuizScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.questions,
    required this.timePerQuestion,
  }) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  int currentQuestionIndex = 0;
  List<String?> userAnswers = [];
  late int remainingTime; // Variable to track remaining time
  Timer? _timer; // Timer variable to handle countdown

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    userAnswers = List<String?>.filled(widget.questions.length, null);
    _startTimer(); // Start the timer for the first question

    // Initialize AnimationController for question transitions
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    _animationController.forward();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer when widget is disposed
    _animationController.dispose();
    super.dispose();
  }

  // Function to start or reset the timer
  void _startTimer() {
    // Reset the remaining time to the time per question
    setState(() {
      remainingTime = widget.timePerQuestion;
    });

    // Cancel any existing timer
    _timer?.cancel();

    // Start a new countdown timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        _nextQuestionOrSubmit(); // Automatically move to next or submit when time reaches zero
      }
    });
  }

  // Function to handle moving to the next question or submitting the quiz
  void _nextQuestionOrSubmit() {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        _animationController.forward(from: 0.0);
      });
      _startTimer(); // Restart the timer for the new question
    } else {
      _submitQuiz(); // Submit the quiz when all questions are done
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF9C27B0),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFF9C27B0), const Color(0xFF03A9F4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Question ${currentQuestionIndex + 1}/${widget.questions.length}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          value: remainingTime / widget.timePerQuestion,
                          strokeWidth: 5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              remainingTime > widget.timePerQuestion * 0.3
                                  ? Colors.green
                                  : remainingTime > widget.timePerQuestion * 0.1
                                  ? Colors.orange
                                  : Colors.red),
                          backgroundColor: Colors.white24,
                        ),
                      ),
                      Text(
                        "$remainingTime",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        question['text'],
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      _buildAnswerInput(currentQuestionIndex),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: currentQuestionIndex > 0
                        ? () {
                      setState(() {
                        currentQuestionIndex--;
                        _animationController.forward(from: 0.0);
                      });
                      _startTimer(); // Restart timer when going to the previous question
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFF9C27B0), backgroundColor: currentQuestionIndex > 0
                          ? Colors.white
                          : Colors.white54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: currentQuestionIndex > 0 ? 5 : 0,
                    ),
                    child: const Text(
                      "Previous",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _nextQuestionOrSubmit(); // Use the same function for Next and automatic submission
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: const Color(0xFF4CAF50),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      currentQuestionIndex < widget.questions.length - 1
                          ? "Next"
                          : "Submit",
                      style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerInput(int index) {
    String questionType = widget.questions[index]['type'];

    TextEditingController textController = TextEditingController(
      text: userAnswers[index] ?? '',
    );

    if (questionType == 'Multiple Choice') {
      return Column(
        children: widget.questions[index]['options'].map<Widget>((option) {
          return RadioListTile<String>(
            title: Text(option, style: const TextStyle(color: Colors.white)),
            value: option,
            groupValue: userAnswers[index],
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                userAnswers[index] = value;
              });
            },
          );
        }).toList(),
      );
    } else if (questionType == 'Short Answer' ||
        questionType == 'Paragraph') {
      return TextField(
        controller: textController,
        onChanged: (value) {
          setState(() {
            userAnswers[index] = value;
          });
        },
        maxLines: questionType == 'Paragraph' ? 3 : 1,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white24,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          hintText: questionType == 'Short Answer'
              ? "Enter your answer"
              : "Write your response",
          hintStyle: const TextStyle(color: Colors.white54),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  void _submitQuiz() {
    int score = 0;

    for (int i = 0; i < widget.questions.length; i++) {
      if (userAnswers[i] == widget.questions[i]['correctAnswer']) {
        score++;
      }
    }

    // Optionally, you can navigate to the QuizAnalysisScreen here
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Quiz Completed"),
        content: Text("Your score is $score/${widget.questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).pop(); // Navigate back
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
