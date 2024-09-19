import 'package:flutter/material.dart';
import 'screens/dashboard.dart'; // Import dashboard
import 'screens/login_screen.dart'; // Import login screen
import 'screens/register_screen.dart'; // Import register screen

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
      home: const StudentPortalScreen(), // Set the home to dashboard initially
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const StudentPortalScreen(),
      },
    );
  }
}
