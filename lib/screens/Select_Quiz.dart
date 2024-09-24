import 'package:flutter/material.dart';

class SelectQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quiz Header Image
              Image.network(
                'https://via.placeholder.com/400x200',
                height: 200,
              ),
              const SizedBox(height: 20),

              // Title and description
              const Text(
                'Quiz Time',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Start Your Quiz',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome to QuizApp, your ultimate destination for testing your knowledge and improving your skills. Whether you\'re a student looking to ace your exams or a faculty member aiming to create engaging quizzes, we have the tools for you.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Attempt Quiz Button
              ElevatedButton(
                onPressed: () {
                  // Handle Attempt Quiz action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_circle_fill),
                    SizedBox(width: 10),
                    Text(
                      'Attempt Quiz',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Create Quiz Button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/create_quiz');
                },
                icon: const Icon(Icons.edit),
                label: const Text(
                  'Create Quiz',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
              const SizedBox(height: 20),




            ],
          ),
        ),
      ),
    );
  }
}