import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Create_Quiz_manually.dart';
import 'EditManualQuizScreen.dart'; // Import the new screen

class ManageYourQuizzes extends StatefulWidget {
  const ManageYourQuizzes({Key? key}) : super(key: key);

  @override
  _ManageYourQuizzesState createState() => _ManageYourQuizzesState();
}

class _ManageYourQuizzesState extends State<ManageYourQuizzes>
    with SingleTickerProviderStateMixin {
  // List to hold fetched quizzes
  List<Map<String, dynamic>> quizzes = [];
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    fetchQuizzes();

    // Initialize AnimationController and Animation
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));
  }

  // Function to fetch quizzes from Firestore
  Future<void> fetchQuizzes() async {
    try {
      // Only fetch quizzes created manually
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('quizzes')
          .where('creationMethod', isEqualTo: 'manually') // Adjust this field as per your Firestore structure
          .get();
      setState(() {
        quizzes = snapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          data['id'] = doc.id; // Add the document ID for editing
          data['questions'] = List<Map<String, dynamic>>.from(data['questions'] ?? []);
          return data;
        }).toList();
      });
      // Start the animation after fetching quizzes
      _animationController.forward();
    } catch (e) {
      // Handle error
      print("Error fetching quizzes: $e");
      // Optionally, show a snackbar or dialog to inform the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch quizzes: $e")),
      );
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Quiz deleted successfully")),
      );
    } catch (e) {
      print("Error deleting quiz: $e");
      // Handle error (show a message to the user)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete quiz: $e")),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manage Your Quizzes",
          style: TextStyle(color: Colors.white), // Make text white
        ),
        backgroundColor: const Color(0xFF9C27B0), // Dark Purple
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Quizzes",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF9C27B0)), // Dark Purple
            ),
            const SizedBox(height: 20),
            Expanded(
              child: quizzes.isEmpty
                  ? Center(child: Text("No quizzes found. Create a new quiz!"))
                  : FadeTransition(
                opacity: _fadeAnimation,
                child: ListView.builder(
                  itemCount: quizzes.length,
                  itemBuilder: (context, index) {
                    final quiz = quizzes[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(quiz['title'] ?? 'No Title', style: const TextStyle(color: Color(0xFF9C27B0))), // Dark Purple
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(quiz['description'] ?? 'No Description'),
                            const SizedBox(height: 5),
                            Text("Questions: ${quiz['questions'].length}"),
                            if (quiz['questions'].isNotEmpty)
                              Text("First Question: ${quiz['questions'][0]['text'] ?? 'No Question Text'}"),
                          ],
                        ),
                        onTap: () {
                          // Navigate to EditQuizDetailsScreen with the selected quiz data
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditQuizDetailsScreen(quiz: quiz),
                            ),
                          ).then((_) {
                            // Refresh the list after returning from the edit screen
                            fetchQuizzes();
                          });
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
                                      _deleteQuiz(quiz['id']); // Delete quiz
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
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to CreateQuizScreen to create a new quiz
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateQuizScreen()),
                ).then((_) {
                  fetchQuizzes(); // Refresh quizzes after creating a new one
                });
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Increased padding for a larger button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners for a modern look
                ),
                backgroundColor: const Color(0xFF03A9F4), // Light Blue
                elevation: 10, // Elevation for a shadow effect
                shadowColor: Colors.blue.withOpacity(0.5), // Slight shadow to add depth
                textStyle: const TextStyle(
                  fontSize: 18, // Larger font size for readability
                  fontWeight: FontWeight.bold, // Bold text for prominence
                  letterSpacing: 1.2, // Increased letter spacing for a sleek design
                ),
              ),
              child: const Text(
                "Create New Quiz",
                style: TextStyle(
                  color: Colors.white, // Ensure text is white for contrast
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
