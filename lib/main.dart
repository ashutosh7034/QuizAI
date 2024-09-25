import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/student_portal_screen_large.dart';
import 'package:quiz_ai/screens/student_portal_screen_medium.dart';
import 'package:quiz_ai/screens/student_portal_screen_small.dart';
import 'screens/login_screen.dart';  // Ensure the correct file paths
import 'screens/register_screen.dart';
import 'screens/Profile_Screen.dart';
import 'screens/Create_Quiz.dart';
import 'screens/HomePage.dart';  // Import HomePage for Bottom Navigation
import 'screens/dashboard.dart'; // Import StudentPortalScreen
import 'screens/my_quizzes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          if (screenWidth < 400) {
            // Small screen size (e.g. phone)
            return StudentPortalScreenSmall();
          } else if (screenWidth < 800) {
            // Medium screen size (e.g. tablet)
            return StudentPortalScreenMedium();
          } else {
            // Large screen size (e.g. desktop)
            return StudentPortalScreenLarge();
          }
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => HomePage(),  // Route to HomePage (Bottom Navigation and Sidebar)
        '/profile': (context) => const ProfileScreen(),
        '/create_quiz': (context) => const CreateQuizScreen(),
        '/my_quizzes': (context) => MyQuizzesScreen(),  // Fixed route name
      },
    );
  }
}