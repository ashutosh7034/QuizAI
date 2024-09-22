import 'package:flutter/material.dart';
import 'screens/Select_Quiz.dart'; // Assuming the correct file name is Select_Quiz.dart
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/dashboard.dart';
import 'screens/Profile_Screen.dart'; // Import the ProfileScreen
import 'screens/Create_Quiz.dart'; // Import the new CreateQuizScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StudentPortalScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/select_quiz': (context) => const SelectQuizScreen(),  // Route to the Select Quiz screen
        '/dashboard': (context) => const StudentPortalScreen(),
        '/profile': (context) => const ProfileScreen(), // Route to the Profile screen
        '/create_quiz': (context) => const CreateQuizScreen(), // Route to the Create Quiz screen
      },
    );
  }
}
