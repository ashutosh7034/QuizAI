import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/categoriesScreen.dart';
import 'package:quiz_ai/screens/student_portal_screen_large.dart';
import 'package:quiz_ai/screens/student_portal_screen_medium.dart';
import 'package:quiz_ai/screens/student_portal_screen_small.dart';
import 'package:quiz_ai/screens/login_screen.dart';
import 'package:quiz_ai/screens/register_screen.dart';
import 'package:quiz_ai/screens/Profile_Screen.dart';
import 'package:quiz_ai/screens/Create_Quiz_manually.dart';
import 'package:quiz_ai/screens/bottom_navigation.dart';
import 'package:quiz_ai/screens/my_quizzes_screen.dart';
import 'package:quiz_ai/screens/quiz_screen.dart'; // Import QuizScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          if (constraints.maxWidth < 400) {
            return StudentPortalScreenSmall();
          } else if (constraints.maxWidth < 800) {
            return StudentPortalScreenMedium();
          } else {
            return StudentPortalScreenLarge();
          }
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => HomePage(),
        '/profile': (context) => const ProfileScreen(),
        '/create_quiz': (context) => const CreateQuizScreen(),
        '/my_quizzes': (context) => MyQuizzesScreen(),
        '/categories': (context) => CategoriesScreen(), // Add CategoriesScreen route
        '/quiz': (context) => const QuizScreen(category: ''), // Add QuizScreen route
      },
    );
  }
}
