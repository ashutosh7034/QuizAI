import 'package:flutter/material.dart';
import 'Profile_Screen.dart';

class SelectQuizScreen extends StatefulWidget {
  const SelectQuizScreen({Key? key}) : super(key: key);

  @override
  _SelectQuizScreenState createState() => _SelectQuizScreenState();
}

class _SelectQuizScreenState extends State<SelectQuizScreen> {
  int _currentIndex = 0;

  // List of screens to switch between
  final List<Widget> _screens = [
    SelectQuizScreenBody(),
    Container(), // Placeholder for Search (if you want to implement it later)
    const ProfileScreen(), // Profile Screen
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
      body: _screens[_currentIndex], // Switch between screens here

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Extract the body of the SelectQuizScreen into a separate widget to avoid rebuilds
class SelectQuizScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quiz Header Image
              Image.network(
                'https://via.placeholder.com/400x200', // Replace with your actual image
                height: 200,
              ),
              const SizedBox(height: 20),

              // Title and description
              const Text(
                'Quiz Time',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Start Your Quiz',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome to QuizApp, your ultimate destination for testing your knowledge and improving your skills. Whether you\'re a student looking to ace your exams or a faculty member aiming to create engaging quizzes, we have the tools for you.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Attempt Quiz Button
              ElevatedButton(
                onPressed: () {
                  // Handle Attempt Quiz action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_circle_fill),
                    SizedBox(width: 10),
                    Text(
                      'Attempt Quiz',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Create Quiz Button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/create_quiz');  // Navigate to the Create Quiz screen
                },
                icon: const Icon(Icons.edit),
                label: const Text(
                  'Create Quiz',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
              const SizedBox(height: 20),

              // Practice Programming Section
              const Text(
                'Practice Programming',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sharpen your coding skills with our AI-generated programming quizzes.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // Practice Programming Quiz Button
              OutlinedButton.icon(
                onPressed: () {
                  // Handle Practice Programming Quiz action
                },
                icon: const Icon(Icons.code),
                label: const Text(
                  'Practice Programming Quiz',
                  style: TextStyle(fontSize: 18),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
