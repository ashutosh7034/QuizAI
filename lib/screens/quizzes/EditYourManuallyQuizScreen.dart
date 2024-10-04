import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Create_Quiz_manually.dart';
import 'EditQuizDetailsScreen.dart'; // Import the new screen

class EditYourManuallyQuizScreen extends StatefulWidget {
  const EditYourManuallyQuizScreen({Key? key}) : super(key: key);

  @override
  _EditYourManuallyQuizScreenState createState() => _EditYourManuallyQuizScreenState();
}

class _EditYourManuallyQuizScreenState extends State<EditYourManuallyQuizScreen> {
  // List to hold fetched quizzes
  List<Map<String, dynamic>> quizzes = [];

  @override
  void initState() {
    super.initState();
    fetchQuizzes();
  }

  // Function to fetch quizzes from Firestore
  Future<void> fetchQuizzes() async {
    try {
      // Only fetch quizzes created manually
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('quizzes')
          .where('createdBy', isEqualTo: 'manual') // Filter for manual quizzes
          .get();
      setState(() {
        quizzes = snapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          data['id'] = doc.id; // Add the document ID for editing
          return data;
        }).toList();
      });
    } catch (e) {
      // Handle error
      print("Error fetching quizzes: $e");
    }
  }

  // Function to delete a quiz
  Future<void> _deleteQuiz(String quizId) async {
    try {
      await FirebaseFirestore.instance.collection('quizzes').doc(quizId).delete();
      // Remove the deleted quiz from the local list
      setState(() {
        quizzes.removeWhere((quiz) => quiz['id'] == quizId);
      });
      print("Quiz deleted successfully");
    } catch (e) {
      print("Error deleting quiz: $e");
      // Handle error (show a message to the user)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Your Quiz"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "your Quizzes",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: quizzes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(quizzes[index]['title']),
                      subtitle: Text(quizzes[index]['description']),
                      onTap: () {
                        // Navigate to EditQuizDetailsScreen with the selected quiz data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditQuizDetailsScreen(quiz: quizzes[index]),
                          ),
                        );
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Confirm deletion
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Delete Quiz"),
                              content: const Text("Are you sure you want to delete this quiz?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close dialog
                                  },
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _deleteQuiz(quizzes[index]['id']); // Delete quiz
                                    Navigator.of(context).pop(); // Close dialog
                                  },
                                  child: const Text("Delete"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to CreateQuizScreen to create a new quiz
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateQuizScreen()),
                );
              },
              child: const Text("Create New Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
