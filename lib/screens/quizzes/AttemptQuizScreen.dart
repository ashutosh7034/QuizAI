import 'package:flutter/material.dart';
import 'my_quizzes_screen.dart'; // Import the MyQuizzesScreen

class AttemptQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // Adapt background color
      appBar: AppBar(
        title: const Text(
          "Attempt Quiz",
          style: TextStyle(
            color: Color(0xFF9C27B0), // Purple color for the AppBar title
            fontWeight: FontWeight.bold, // Make the title bold
            fontSize: 22, // Increase font size for better visibility
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white, // Adapt AppBar color
        automaticallyImplyLeading: true, // This will add the back arrow
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
                  'assets/quiz.png', // Make sure to add a relevant image in your assets
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Title and description
              Text(
                'Ready to Quiz?',
                style: TextStyle(
                  fontSize: 32, // Larger title font size
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Color(0xFF6200EE), // Deep purple or white for dark mode
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Test your knowledge with our quiz!',
                style: TextStyle(
                  fontSize: 20,
                  color: isDarkMode ? Colors.white70 : Colors.grey[800], // Adapt color for dark mode
                  fontWeight: FontWeight.w600, // Semi-bold
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Answer the following questions to the best of your ability. Good luck!',
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode ? Colors.white70 : Colors.grey,
                  height: 1.5, // Improved line height for readability
                ),
              ),
              const SizedBox(height: 20),

              // Start Quiz Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to MyQuizzesScreen when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyQuizzesScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF9C27B0), // Text color
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
                    Icon(Icons.play_arrow, size: 24, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Start Quiz',
                      style: TextStyle(
                        fontSize: 20, // Increased font size for button
                        fontWeight: FontWeight.bold, // Bold text
                      ),
                    ),
                  ],
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
