import 'package:flutter/material.dart';
import '../../data/category_data.dart';
import '../../models/category.dart';
import 'python_quiz.dart'; // Import the relevant quiz screens
import 'javascript_quiz.dart';
import 'java_quiz.dart';
import 'c_plus_plus_quiz.dart';
import 'dart_quiz.dart';

class PracticeProgrammingQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Programming Languages',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF9C27B0),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9C27B0), Color(0xFF03A9F4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02, horizontal: screenWidth * 0.04),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _getCrossAxisCount(screenWidth),
            childAspectRatio: _getChildAspectRatio(screenWidth, screenHeight),
            crossAxisSpacing: screenWidth * 0.04,
            mainAxisSpacing: screenHeight * 0.02,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final Category category = categories[index];
            return GestureDetector(
              onTap: () => _navigateToQuizScreen(context, category),
              child: _buildCategoryCard(category, screenWidth),
            );
          },
        ),
      ),
    );
  }

  // Helper to dynamically determine the number of grid columns
  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth < 600) {
      return 2; // For phones
    } else {
      return 3; // For tablets
    }
  }

  // Helper to adjust the aspect ratio of the grid items
  double _getChildAspectRatio(double screenWidth, double screenHeight) {
    if (screenWidth < 600) {
      return 3 / 2; // For phones
    } else {
      return 4 / 3; // For tablets
    }
  }

  Widget _buildCategoryCard(Category category, double screenWidth) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF9C27B0).withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 8,
        shadowColor: Color(0xFF9C27B0).withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: category.isAsset
                      ? Image.asset(
                    category.imageUrl,
                    height: screenWidth * 0.2, // Adjust size dynamically
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.error,
                      size: 80,
                      color: Colors.redAccent,
                    ),
                  )
                      : Image.network(
                    category.imageUrl,
                    height: screenWidth * 0.2, // Adjust size dynamically
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.error,
                      size: 80,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9C27B0),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToQuizScreen(BuildContext context, Category category) {
    Widget targetScreen;
    switch (category.name) {
      case 'Python':
        targetScreen = PythonQuizScreen();
        break;
      case 'JavaScript':
        targetScreen = JavaScriptQuizScreen();
        break;
      case 'Java':
        targetScreen = JavaQuizScreen();
        break;
      case 'C++':
        targetScreen = CPlusPlusQuizScreen();
        break;
      case 'Dart':
        targetScreen = DartQuizScreen();
        break;
      default:
        targetScreen = Container(); // Fallback for unrecognized categories
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => targetScreen),
    );
  }
}
