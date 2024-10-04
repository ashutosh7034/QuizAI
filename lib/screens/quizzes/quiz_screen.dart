import 'dart:async'; // Import Timer class

import 'package:flutter/cupertino.dart';
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

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<String?> userAnswers = [];
  late int remainingTime; // Variable to track remaining time
  Timer? _timer; // Timer variable to handle countdown

  @override
  void initState() {
    super.initState();
    userAnswers = List<String?>.filled(widget.questions.length, null);
    _startTimer(); // Start the timer for the first question
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer when widget is disposed
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
      });
      _startTimer(); // Restart the timer for the new question
    } else {
      _submitQuiz(); // Submit the quiz when all questions are done
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFF9C27B0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.description,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            Text(
              "Question ${currentQuestionIndex + 1}/${widget.questions.length}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.questions[currentQuestionIndex]['text'],
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            // Display the remaining time
            Text(
              "Time: $remainingTime seconds",
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 20),
            _buildAnswerInput(currentQuestionIndex),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: currentQuestionIndex > 0
                      ? () {
                    setState(() {
                      currentQuestionIndex--;
                    });
                    _startTimer(); // Restart timer when going to the previous question
                  }
                      : null,
                  child: const Text("Previous"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _nextQuestionOrSubmit(); // Use the same function for Next and automatic submission
                  },
                  child: Text(
                    currentQuestionIndex < widget.questions.length - 1
                        ? "Next"
                        : "Submit",
                  ),
                ),
              ],
            ),
          ],
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
            title: Text(option),
            value: option,
            groupValue: userAnswers[index],
            onChanged: (value) {
              setState(() {
                userAnswers[index] = value;
              });
            },
          );
        }).toList(),
      );
    } else if (questionType == 'Short Answer' || questionType == 'Paragraph') {
      return TextField(
        controller: textController,
        onChanged: (value) {
          setState(() {
            userAnswers[index] = value;
          });
        },
        maxLines: questionType == 'Paragraph' ? 3 : 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.blueAccent),
          ),
          hintText: questionType == 'Short Answer'
              ? "Enter your answer"
              : "Write your response",
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

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Quiz Completed"),
        content: Text("Your score is $score/${widget.questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
