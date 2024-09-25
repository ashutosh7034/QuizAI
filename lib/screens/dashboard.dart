import 'package:flutter/material.dart';

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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9C27B0), // Changed to purple
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.settings, color: Color(0xFF9C27B0)), // New icon
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Image section
              Image.asset(
                'assets/dashboard.png',
                height: 200,
              ),
              const SizedBox(height: 20),

              // Title and subtitle
              const Text(
                'Welcome to Your Dashboard',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Access your courses, assignments, and more from here.',
                style: TextStyle(
                  fontSize: 18,
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
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Buttons: Get Started & Learn More
              ElevatedButton(
                onPressed: () {
                  // Navigate to the login screen
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9C27B0), // Changed to purple
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 30.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Changed to white
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Placeholder for Learn More action
                  // Implement navigation or information here
                },
                child: const Text(
                  'Learn More',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF9C27B0), // Changed to purple
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