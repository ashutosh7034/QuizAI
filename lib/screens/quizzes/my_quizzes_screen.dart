import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/quizzes/quiz_screen.dart';
import '../../widgets/back_navigation_wrapper.dart';

class MyQuizzesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Quizzes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, // Make the title bold
          ),
        ),
        automaticallyImplyLeading: false,
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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('quizzes')
              .orderBy('created_at', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final quizzes = snapshot.data!.docs.map((doc) {
              // Cast doc.data() to Map<String, dynamic>
              final data = doc.data() as Map<String, dynamic>;

              return {
                'title': data['title'] ?? "Untitled Quiz",
                'description': data['description'] ?? "No Description",
                'questions': List<Map<String, dynamic>>.from(data['questions'] ?? []),
                'timePerQuestion': data.containsKey('timePerQuestion') ? data['timePerQuestion'] : 5, // Default to 5 if not found
              };
            }).toList();

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
                        color: Color(0xFF9C27B0), // Change title color to purple
                      ),
                    ),
                    subtitle: Text(
                      quiz['description'],
                      style: const TextStyle(color: Color(0xFF9C27B0)), // Change subtitle color to purple
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
