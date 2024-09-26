import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.help_outline),
            SizedBox(width: 10),
            Text("Help & Support"),
          ],
        ),
        backgroundColor: Color(0xFF9C27B0), // Primary color (Purple)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFf7f7f7),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Frequently Asked Questions (FAQs)',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Q: How do I create a quiz?\n'
                          'A: To create a quiz, go to the "Create Quiz" section from the main menu. You can add questions, set the correct answers, and save your quiz.\n\n'
                          'Q: How do I attempt a quiz?\n'
                          'A: To attempt a quiz, go to the "Attempt Quiz" section from the main menu. Select the quiz you want to take and start answering the questions.\n\n'
                          'Q: How do I view my quiz results?\n'
                          'A: To view your quiz results, go to the "Results" section from the main menu. You can see your scores and detailed performance for each quiz.\n\n'
                          'Q: Can I share my quiz with others?\n'
                          'A: Yes, you can share your quiz with others. After creating a quiz, you will get a shareable link that you can send to your friends or classmates.\n\n'
                          'Q: How do I reset my password?\n'
                          'A: To reset your password, go to the "Change Password" section in the sidebar. Follow the instructions to update your password.\n\n'
                          'Q: What should I do if I encounter a problem?\n'
                          'A: If you encounter any issues, please contact our support team at support@quizai.com. We are here to help you!',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFf7f7f7),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'If you have any questions, feedback, or suggestions, feel free to reach out to us at support@quizai.com. We would love to hear from you!',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFf7f7f7),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Social Media',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.facebook, color: Color(0xFF3b5998)),
                          onPressed: () {
                            // Open Facebook page
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.twitter, color: Color(0xFF00acee)),
                          onPressed: () {
                            // Open Twitter page
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.instagram, color: Color(0xFFC13584)),
                          onPressed: () {
                            // Open Instagram page
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}