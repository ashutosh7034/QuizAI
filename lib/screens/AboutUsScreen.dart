import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
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
                      'About Quiz AI',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Quiz AI is a platform designed to help students and educators create, manage, and attempt quizzes with ease. Our mission is to provide a seamless and engaging experience for users to test their knowledge and improve their skills.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Features:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '• Create custom quizzes\n'
                          '• Attempt quizzes created by others\n'
                          '• Track your progress and performance\n'
                          '• Share quizzes with friends and classmates\n'
                          '• Access quizzes on various subjects and topics',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Our Team:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We are a team of passionate educators, developers, and designers committed to making learning fun and accessible for everyone. Our goal is to continuously improve Quiz AI and add new features to enhance your learning experience.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Contact Us:',
                      style: TextStyle(
                        fontSize: 20,
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
            ],
          ),
        ),
      ),
    );
  }
}