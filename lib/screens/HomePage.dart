import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/SideBar.dart';
import 'package:quiz_ai/screens/Select_Quiz.dart';
import 'package:quiz_ai/screens/achiever_screen.dart';
import 'package:quiz_ai/screens/my_quizzes_screen.dart'; // Import my_quizzes_screen.dart
import 'package:quiz_ai/screens/categoriesScreen.dart'; // Ensure CategoriesScreen is imported
import 'package:quiz_ai/screens/leaderboard_screen.dart'; // Import LeaderboardScreen

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  final List<Widget> _screens = [
    SelectQuizScreen(),     // Index 0 for Select Quiz
    CategoriesScreen(),     // Index 1 for Categories
    MyQuizzesScreen(),      // Index 2 for My Quizzes
    LeaderboardScreen(),    // Index 3 for Leaderboard
    AchieverScreen(),       // Index 4 for Achievements
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quizai",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        elevation: 4,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Sidebar(),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: _screens.length,
        itemBuilder: (context, index) {
          return _screens[index];
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTap,
          items: [
            _buildBottomNavigationBarItem(Icons.home, 'Home', 0),
            _buildBottomNavigationBarItem(Icons.category, 'Categories', 1),
            _buildBottomNavigationBarItem(Icons.list, 'My Quizzes', 2),
            _buildBottomNavigationBarItem(Icons.leaderboard, 'Leaderboard', 3),
            _buildBottomNavigationBarItem(Icons.star, 'Achievements', 4),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: _currentIndex == index ? 8.0 : 0.0),
        child: Icon(icon, color: _currentIndex == index ? Colors.blue : Colors.grey),
      ),
      label: label,
    );
  }
}
