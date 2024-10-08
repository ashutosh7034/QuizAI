import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:quiz_ai/screens/quizzes/quiz_screen.dart';
import 'Create_Quiz_manually.dart';

class StartYourQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser; // Get the current user

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Quizzes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFF9C27B0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreateQuizScreen(), // Navigate to CreateQuizScreen
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9C27B0), Color(0xFF03A9F4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('quizzes')
              .where('createdBy', isEqualTo: currentUser?.uid) // Filter quizzes by user ID
          //.orderBy('created_at', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final quizzes = snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;

              return {
                'title': data['title'] ?? "Untitled Quiz",
                'description': data['description'] ?? "No Description",
                'questions': List<Map<String, dynamic>>.from(data['questions'] ?? []),
                'timePerQuestion': data.containsKey('timePerQuestion') ? data['timePerQuestion'] : 5,
              };
            }).toList();

            // Check if the user has any quizzes
            if (quizzes.isEmpty) {
              return const Center(child: Text('No quizzes found.'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                final quiz = quizzes[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF9C27B0).withOpacity(0.5),
                      child: const Icon(
                        Icons.school,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      quiz['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF9C27B0),
                      ),
                    ),
                    subtitle: Text(
                      quiz['description'],
                      style: const TextStyle(color: Color(0xFF9C27B0)),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.play_arrow),
                      color: Colors.blueAccent,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              title: quiz['title'],
                              description: quiz['description'],
                              questions: quiz['questions'],
                              timePerQuestion: quiz['timePerQuestion'],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
