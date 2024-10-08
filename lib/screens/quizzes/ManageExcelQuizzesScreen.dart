import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'CreateQuizFromExcelScreen.dart';
import 'EditExcelQuizScreen.dart'; // Import the screen for editing Excel-based quizzes

class ManageExcelQuizzes extends StatefulWidget {
  const ManageExcelQuizzes({Key? key}) : super(key: key);

  @override
  _ManageExcelQuizzesState createState() => _ManageExcelQuizzesState();
}

class _ManageExcelQuizzesState extends State<ManageExcelQuizzes>
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

  // Function to fetch Excel-created quizzes from Firestore
  Future<void> fetchQuizzes() async {
    try {
      // Only fetch quizzes created from Excel
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('quizzes')
          .where('creationMethod', isEqualTo: 'Excel') // Filter for Excel-based quizzes
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch quizzes: $e")),
      );
    }
  }

  // Function to delete a quiz
  Future<void> _deleteQuiz(String quizId) async {
    try {
      await FirebaseFirestore.instance.collection('quizzes').doc(quizId).delete();
      setState(() {
        quizzes.removeWhere((quiz) => quiz['id'] == quizId);
      });
      print("Quiz deleted successfully");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Quiz deleted successfully")),
      );
    } catch (e) {
      print("Error deleting quiz: $e");
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
          "Manage Excel Quizzes",
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
              "Your Excel Quizzes",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF9C27B0)), // Dark Purple
            ),
            const SizedBox(height: 20),
            Expanded(
              child: quizzes.isEmpty
                  ? const Center(child: Text("No quizzes found. Create a new quiz!"))
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
                          // Navigate to EditExcelQuizScreen with the selected quiz data
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditExcelQuizScreen(quiz: quiz),
                            ),
                          ).then((_) {
                            fetchQuizzes(); // Refresh the list after returning from the edit screen
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
                // Navigate to CreateQuizFromExcel screen to create a new Excel quiz
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateQuizFromExcelScreen()),
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
                "Create New Excel Quiz",
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
