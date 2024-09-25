import 'package:flutter/material.dart';
import '../data/category_data.dart';
import '../models/category.dart';
import 'quiz_screen.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Programming Languages',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFF9C27B0), // purple
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9C27B0), Color(0xFF03A9F4)], // purple to blue-green
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final Category category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(category: category.name),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF9C27B0).withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 8,
                  shadowColor: Color(0xFF9C27B0).withOpacity(0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: category.isAsset
                            ? Image.asset(
                          category.imageUrl,
                          height: 80,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error, size: 80, color: Colors.redAccent),
                          fit: BoxFit.cover,
                        )
                            : Image.network(
                          category.imageUrl,
                          height: 80,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error, size: 80, color: Colors.redAccent),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9C27B0), // purple
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}