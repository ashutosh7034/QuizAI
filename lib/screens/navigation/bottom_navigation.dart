import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/navigation/SideBar.dart';
import 'package:quiz_ai/screens/Home_Page.dart';
import 'package:quiz_ai/screens/achiever_screen.dart';
import 'package:quiz_ai/screens/quizzes/my_quizzes_screen.dart';
import 'package:quiz_ai/screens/categories/categoriesScreen.dart';
import 'package:quiz_ai/screens/leaderboard_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Track the current tab index
  PageController _pageController = PageController(); // Controller for PageView

  // List of screens for each tab
  final List<Widget> _screens = [
    SelectQuizScreen(),          // Updated to HomeScreen from Home_Page
    CategoriesScreen(),    // Categories tab
    MyQuizzesScreen(),     // My Quizzes tab
    LeaderboardScreen(),   // Leaderboard tab
    AchieverScreen(),      // Achievements tab
  ];

  // Handles the tap on the bottom navigation bar
  void _onTap(int index) {
    setState(() {
      _currentIndex = index; // Update current index
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  // Updates the current index when the page changes
  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index; // Update current index
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
      drawer: Sidebar(), // Sidebar navigation
      body: PageView.builder(
        controller: _pageController, // Connect the controller
        onPageChanged: _onPageChanged, // Page change listener
        itemCount: _screens.length, // Number of screens
        itemBuilder: (context, index) {
          return _screens[index]; // Return current screen
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
          currentIndex: _currentIndex, // Highlight the current tab
          onTap: _onTap, // Handle tap on tab
          items: [
            _buildBottomNavigationBarItem(Icons.home, 'Home', 0),
            _buildBottomNavigationBarItem(Icons.category, 'Categories', 1),
            _buildBottomNavigationBarItem(Icons.list, 'My Quizzes', 2),
            _buildBottomNavigationBarItem(Icons.leaderboard, 'Leaderboard', 3),
            _buildBottomNavigationBarItem(Icons.star, 'Achievements', 4),
          ],
          selectedItemColor: Colors.blue, // Color for selected item
          unselectedItemColor: Colors.grey, // Color for unselected items
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed, // Fixed type
          elevation: 8,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Method to build individual items for the BottomNavigationBar
  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Animation duration
        padding: EdgeInsets.symmetric(vertical: _currentIndex == index ? 8.0 : 0.0), // Dynamic padding based on selection
        child: Icon(icon, color: _currentIndex == index ? Colors.blue : Colors.grey),
      ),
      label: label,
    );
  }
}
