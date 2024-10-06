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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // Track the current tab index
  PageController _pageController = PageController(); // Controller for PageView
  late AnimationController _animationController; // Animation controller
  late Animation<double> _animation; // Animation for scaling text
  bool _isBellEnabled = true; // Variable to track the state of the bell button

  // List of screens for each tab
  final List<Widget> _screens = [
    SelectQuizScreen(),
    CategoriesScreen(),
    MyQuizzesScreen(),
    LeaderboardScreen(),
    AchieverScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation and create a loop
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  // Handles the tap on the bottom navigation bar
  void _onTap(int index) {
    setState(() {
      _currentIndex = index; // Update current index
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      // Restart animation when changing tabs
      _animationController.forward(from: 0.0);
    });
  }

  // Updates the current index when the page changes
  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index; // Update current index
    });
  }

  // Method to handle bell button click
  void _onBellButtonClick() {
    setState(() {
      _isBellEnabled = !_isBellEnabled; // Toggle the state
    });

    // Additional actions can be added here, like showing a notification
    if (_isBellEnabled) {
      print("Notifications enabled");
    } else {
      print("Notifications disabled");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScaleTransition(
          scale: _animation,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Quiz",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                TextSpan(
                  text: "ai",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 4,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              _isBellEnabled ? Icons.notifications : Icons.notifications_off,
              color: _isBellEnabled ? Colors.black : Colors.grey,
            ),
            onPressed: _onBellButtonClick,
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
