import 'package:flutter/material.dart';
import 'ManageYourQuizzes.dart'; // Import your ManageYourQuizzes
import 'CreateQuizFromFileScreen.dart';
import 'CreateQuizFromExcelScreen.dart'; // Import the new screen for Excel

class CreateQuizOptionScreen extends StatelessWidget {
  const CreateQuizOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quizai", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF9C27B0), // Dark Purple
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create a Quiz",
              style: TextStyle(
                fontSize: 28, // Increased font size for better visibility
                fontWeight: FontWeight.bold,
                color: Color(0xFF9C27B0), // Dark Purple
              ),
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context: context,
              title: "Manual Quiz",
              description: "Create your quiz step by step.",
              icon: Icons.create,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ManageYourQuizzes()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context: context,
              title: "Quiz from File",
              description: "Upload a file to create a quiz.",
              icon: Icons.upload_file,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateQuizFromFileScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context: context,
              title: "Quiz from Excel",
              description: "Upload an Excel file to create a quiz.",
              icon: Icons.table_chart, // Use an icon that represents a table
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateQuizFromExcelScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Colors.white, // Card color
      shadowColor: const Color(0xFF9C27B0).withOpacity(0.2), // Shadow color matching theme
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(icon, size: 40, color: const Color(0xFF9C27B0)), // Dark Purple
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22, // Increased font size for better visibility
            fontWeight: FontWeight.bold,
            color: Color(0xFF9C27B0), // Dark Purple
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
