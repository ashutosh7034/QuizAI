import 'package:flutter/material.dart';
import 'Create_Quiz_manually.dart';
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
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create a Quiz",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context: context,
              title: "Create Quiz Manually",
              description: "Build your quiz step by step.",
              icon: Icons.create,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateQuizScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context: context,
              title: "Create Quiz from File",
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
              title: "Create Quiz from Excel",
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
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(icon, size: 40, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
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
