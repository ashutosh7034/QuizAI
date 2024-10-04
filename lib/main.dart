import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_ai/screens/categories/categoriesScreen.dart';
import 'package:quiz_ai/screens/student_portal_screen_large.dart';
import 'package:quiz_ai/screens/student_portal_screen_medium.dart';
import 'package:quiz_ai/screens/student_portal_screen_small.dart';
import 'package:quiz_ai/screens/auth/login_screen.dart';
import 'package:quiz_ai/screens/auth/register_screen.dart';
import 'package:quiz_ai/screens/profile/Profile_Screen.dart';
import 'package:quiz_ai/screens/quizzes/Create_Quiz_manually.dart';
import 'package:quiz_ai/screens/navigation/bottom_navigation.dart';
import 'package:quiz_ai/screens/quizzes/my_quizzes_screen.dart';
import 'package:quiz_ai/screens/quizzes/quiz_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();  // Change here
}

class MyAppState extends State<MyApp> {
  // Change here
  ThemeMode _themeMode = ThemeMode.light; // Default to light mode

  void toggleThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      // Set the theme mode
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
        '/profile': (context) => ProfileScreen(),
        '/create_quiz': (context) => CreateQuizScreen(),
        '/my_quizzes': (context) => MyQuizzesScreen(),
        '/categories': (context) => CategoriesScreen(),
      },
    );
  }

  // Method to navigate to QuizScreen with parameters
  // Navigation method remains the same
  static void navigateToQuizScreen(BuildContext context, String title,
      String description, List<Map<String, dynamic>> questions) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            QuizScreen(
              title: title,
              description: description,
              questions: questions,
            ),
      ),
    );
  }
}

