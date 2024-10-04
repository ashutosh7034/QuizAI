import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String title;
  final String description;
  final List<Map<String, dynamic>> questions;

  const QuizScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.questions,
  }) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<String> userAnswers = [];

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
            const SizedBox(height: 20),
            _buildAnswerInput(currentQuestionIndex), // New method to build answer input
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
                  }
                      : null,
                  child: const Text("Previous"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (currentQuestionIndex < widget.questions.length - 1) {
                      setState(() {
                        currentQuestionIndex++;
                      });
                    } else {
                      _submitQuiz();
                    }
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

    // TextEditingController to hold the answer text
    TextEditingController textController = TextEditingController(
      text: userAnswers.length > index ? userAnswers[index] : '',
    );

    if (questionType == 'Multiple Choice') {
      return Column(
        children: widget.questions[index]['options']
            .map<Widget>((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: userAnswers.length > currentQuestionIndex
                ? userAnswers[currentQuestionIndex]
                : null,
            onChanged: (value) {
              setState(() {
                if (userAnswers.length > currentQuestionIndex) {
                  userAnswers[currentQuestionIndex] = value!;
                } else {
                  userAnswers.add(value!);
                }
              });
            },
          );
        }).toList(),
      );
    } else if (questionType == 'Short Answer' || questionType == 'Paragraph') {
      return TextField(
        controller: textController,
        onChanged: (value) {
          // Update user answers
          if (userAnswers.length > index) {
            userAnswers[index] = value;
          } else {
            userAnswers.add(value);
          }
        },
        maxLines: questionType == 'Paragraph' ? 3 : 1, // Adjust line count for paragraphs
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
      return const SizedBox(); // Return empty widget for unknown types
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
