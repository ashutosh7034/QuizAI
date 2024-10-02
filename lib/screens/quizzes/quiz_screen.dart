import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class QuizScreen extends StatelessWidget {
  final String title;
  final String description;
  final List<dynamic> questions; // Assuming questions are a list of maps

  QuizScreen({
    required this.title,
    required this.description,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color(0xFF9C27B0),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: QuizForm(questions: questions),
      ),
    );
  }
}

class QuizForm extends StatefulWidget {
  final List<dynamic> questions;

  QuizForm({required this.questions});

  @override
  _QuizFormState createState() => _QuizFormState();
}

class _QuizFormState extends State<QuizForm> {
  late List<String?> answers; // To track user answers

  @override
  void initState() {
    super.initState();
    answers = List.filled(widget.questions.length, null); // Initialize with null
  }

  Future<void> handleSubmit() async {
    // Handle submission logic here
    Map<String, String?> submittedAnswers = {}; // Change key type to String
    for (int i = 0; i < answers.length; i++) {
      submittedAnswers[i.toString()] = answers[i]; // Collect answers as String keys
    }

    // Prepare data to store in Firestore
    final quizData = {
      'title': widget.questions[0]['title'], // Store the quiz title
      'description': widget.questions[0]['description'], // Store the quiz description
      'answers': submittedAnswers,
      'submitted_at': FieldValue.serverTimestamp(),
    };

    print("Submitting Quiz Data: $quizData"); // Debug print

    // Store answers in Firestore
    try {
      await FirebaseFirestore.instance.collection('submissions').add(quizData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Answers submitted successfully!')),
      );
      // Optionally clear the answers after submission
      setState(() {
        answers = List.filled(widget.questions.length, null); // Reset answers
      });
    } catch (e) {
      print("Error submitting answers: $e"); // Print error to console
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting answers. Please try again.')),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.questions.isNotEmpty ? widget.questions[0]['description'] ?? '' : '',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: widget.questions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: QuestionWidget(
                  question: widget.questions[index],
                  answer: answers[index], // Pass the current answer
                  onChanged: (value) {
                    setState(() {
                      answers[index] = value; // Update answer
                    });
                  },
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: answers.contains(null) ? null : handleSubmit, // Disable if not all answered
          child: Text('Submit Answers'),
        ),
      ],
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final dynamic question; // Assuming question is a map
  final String? answer; // Track the answer
  final ValueChanged<String?> onChanged; // Callback to update the answer

  QuestionWidget({
    required this.question,
    required this.answer,
    required this.onChanged,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.answer); // Initialize with current answer
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question['text'] ?? 'No Question',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            TextField(
              controller: _controller, // Use the controller
              onChanged: (value) {
                widget.onChanged(value); // Call the callback to update the answer
              },
              decoration: InputDecoration(
                hintText: 'Type your answer here',
                border: OutlineInputBorder(),
              ),
              maxLines: 1, // Allow single-line input
            ),
          ],
        ),
      ),
    );
  }
}
