import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/SideBar.dart'; // Import the Sidebar widget
import 'package:quiz_ai/screens/Select_Quiz.dart'; // Import the SelectQuizScreen

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Pages to navigate between, where SelectQuizScreen is in the Home tab
  final List<Widget> _pages = [
    SelectQuizScreen(), // Set the home page as SelectQuizScreen
    CategoriesScreen(),
    MyQuizzesScreen(),
    LeaderboardScreen(),
    AchievementsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu), // Hamburger icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Opens the sidebar
            },
          ),
        ),
      ),
      drawer: Sidebar(), // Use the Sidebar widget
      body: _pages[_selectedIndex], // Switch between pages based on selectedIndex
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Change tab on tap
        items: const <BottomNavigationBarItem>[
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
            label: 'My Quizzes',
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

// Placeholder screens for other tabs
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Categories Screen'));
  }
}

class MyQuizzesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('My Quizzes Screen'));
  }
}

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Leaderboard Screen'));
  }
}

class AchievementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Achievements Screen'));
  }
}