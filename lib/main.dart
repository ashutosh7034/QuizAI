import 'package:flutter/material.dart';
import 'screens/dashboard.dart'; // Import the dashboard.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Set the home to StudentPortalScreen
      home: const StudentPortalScreen(), // Replaces MyHomePage with the dashboard screen
    );
  }
}
