import 'package:flutter/material.dart';
import '../profile/settings_screen.dart'; // Import your settings screen
import 'explore_features_screen.dart'; // Import the Explore Features screen

class StudentPortalScreen extends StatefulWidget {
  const StudentPortalScreen({Key? key}) : super(key: key);

  @override
  _StudentPortalScreenState createState() => _StudentPortalScreenState();
}

class _StudentPortalScreenState extends State<StudentPortalScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller for managing animations
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Loop the animation

    // Define fade and scale animations
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: orientation == Orientation.portrait
              ? _buildPortraitLayout(context)
              : _buildLandscapeLayout(context),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header section with app name and icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Quiz AI Portal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9C27B0),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Color(0xFF9C27B0)),
                onPressed: () {
                  // Navigate to Settings Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(
                        onThemeChanged: (isDarkMode) {
                          // Implement your theme change logic here
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Animated Image section
          FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                'assets/dashboard.png',
                height: 200,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Title and subtitle
          ScaleTransition(
            scale: _scaleAnimation,
            child: const Text(
              'Welcome to Your Quiz Dashboard',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center, // Centering the text
            ),
          ),
          const SizedBox(height: 10),
          ScaleTransition(
            scale: _scaleAnimation,
            child: const Text(
              'Get ready to boost your knowledge with personalized quizzes!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center, // Centering the text
            ),
          ),
          const SizedBox(height: 20),

          // Descriptive text
          ScaleTransition(
            scale: _scaleAnimation,
            child: const Text(
              'Our Quiz AI Portal offers tailored quizzes and resources that enhance your learning experience. '
                  'Challenge yourself, track your progress, and discover new insights as you navigate through engaging quizzes.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center, // Centering the text
            ),
          ),
          const SizedBox(height: 40),

          // Buttons: Let's Start & Explore Features
          ElevatedButton(
            onPressed: () {
              // Navigate to the login screen
              Navigator.pushNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9C27B0),
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 5,
            ),
            child: const Text(
              "Let's Start",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Implementing the Explore Features button
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExploreFeaturesScreen()),
              );
            },
            child: const Text(
              'Explore Features',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF9C27B0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          // Animated Image section
          FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                'assets/dashboard.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Title and subtitle
          ScaleTransition(
            scale: _scaleAnimation,
            child: const Text(
              'Welcome to Your Quiz Dashboard',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center, // Centering the text
            ),
          ),
          const SizedBox(height: 10),
          ScaleTransition(
            scale: _scaleAnimation,
            child: const Text(
              'Get ready to boost your knowledge with personalized quizzes!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center, // Centering the text
            ),
          ),
          const SizedBox(height: 20),

          // Descriptive text
          ScaleTransition(
            scale: _scaleAnimation,
            child: const Text(
              'Our Quiz AI Portal offers tailored quizzes and resources that enhance your learning experience. '
                  'Challenge yourself, track your progress, and discover new insights as you navigate through engaging quizzes.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center, // Centering the text
            ),
          ),
          const SizedBox(height: 40),

          // Buttons: Let's Start & Explore Features
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to the login screen
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C27B0),
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Let's Start",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExploreFeaturesScreen()),
                  );
                },
                child: const Text(
                  'Explore Features',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF9C27B0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
