// categories_screen.dart
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to Select Quiz screen
            Navigator.pushNamed(context, '/select_quiz');
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          ),
          child: const Text(
            'Go to Select Quiz',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
