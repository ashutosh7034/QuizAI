import 'package:flutter/material.dart';

void main() {
  runApp(const StudentPortalApp());
}

class StudentPortalApp extends StatelessWidget {
  const StudentPortalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StudentPortalScreen(),
    );
  }
}

class StudentPortalScreen extends StatelessWidget {
  const StudentPortalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header section with app name and icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Student Portal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.wifi),
                      SizedBox(width: 10),
                      Icon(Icons.battery_full),
                      SizedBox(width: 10),
                      Icon(Icons.notifications),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Image section
              Image.network(
                'https://via.placeholder.com/150', // replace with your actual image URL
                height: 200,
              ),
              const SizedBox(height: 20),

              // Title and subtitle
              const Text(
                'Welcome to Your Dashboard',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Access your courses, assignments, and more from here.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Descriptive text
              const Text(
                'The Student Portal is designed to provide you with all the tools and resources '
                    'you need to succeed in your studies. From accessing course materials to '
                    'submitting assignments and checking your grades, everything is at your fingertips.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Buttons: Get Started & Learn More
              ElevatedButton(
                onPressed: () {
                  // Handle "Get Started" button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Updated to backgroundColor
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 30.0),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Handle "Learn More" button press
                },
                child: const Text(
                  'Learn More',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
