import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/SideBar.dart';
import 'package:quiz_ai/screens/Select_Quiz.dart';
import 'package:quiz_ai/screens/AchievementsScreen.dart';
import 'package:quiz_ai/screens/my_quizzes_screen.dart'; // Import my_quizzes_screen.dart
import 'package:quiz_ai/screens/categoriesScreen.dart'; // Ensure CategoriesScreen is imported

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    SelectQuizScreen(),
    CategoriesScreen(), // Index 1 for Categories
    MyQuizzesScreen(),  // Index 2 for My Quizzes


  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QuizApp"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      drawer: Sidebar(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'My Quizzes', // Clicking this icon will show MyQuizzesScreen
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Achievements',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
