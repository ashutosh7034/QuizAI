import 'package:flutter/material.dart';
import 'quizzes/CreateQuizOptionScreen.dart'; // Import the CreateQuizOptionScreen
import 'quizzes/AttemptQuizScreen.dart'; // Import the AttemptQuizScreen

class SelectQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to disable the back gesture and back button
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Select Quiz",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFF9C27B0), // purple
          automaticallyImplyLeading: false, // Removes the back arrow
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Quiz Header Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'assets/home.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),

                // Title and description
                const Text(
                  'Quiz Time',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9C27B0), // purple
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Start Your Quiz',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome to QuizApp, your ultimate destination for testing your knowledge and improving your skills. Whether you\'re a student looking to ace your exams or a faculty member aiming to create engaging quizzes, we have the tools for you.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Attempt Quiz Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AttemptQuizScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9C27B0), // purple
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_circle_fill, size: 24, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Attempt Quiz',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                // Create Quiz Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CreateQuizOptionScreen()),
                    );
                  },
                  icon: const Icon(Icons.edit, size: 24, color: Colors.white),
                  label: const Text(
                    'Create Quiz',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF03A9F4), // blue-green
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                    minimumSize: const Size.fromHeight(50),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

