// File: lib/screens/quiz_screen.dart

import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  final String category;

  const QuizScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Updated title to 'Practice Quiz'
        title: Text('Practice Quiz'),
      ),
      body: Center(
        child: Text(
          'This is the $category practice quiz!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
