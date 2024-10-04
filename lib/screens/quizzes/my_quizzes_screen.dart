import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/quizzes/quiz_screen.dart';

import '../../widgets/back_navigation_wrapper.dart';

class MyQuizzesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackNavigationWrapper(
        child:Scaffold(
      appBar: AppBar(
        title: const Text('My Quizzes'),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF9C27B0),
        centerTitle: true,
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
              return {
                'title': doc['title'] ?? "Untitled Quiz",
                'description': doc['description'] ?? "No Description",
                'questions': List<Map<String, dynamic>>.from(doc['questions'] ?? []), // Cast here
                'timePerQuestion': doc['timePerQuestion'] ?? 30,
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
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      quiz['description'],
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                    trailing: const Icon(Icons.play_arrow, color: Color(0xFF9C27B0)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizScreen(
                          title: quiz['title'],
                          description: quiz['description'],
                          questions: quiz['questions'],
                          timePerQuestion: quiz['timePerQuestion'],
                        )),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
        )
    );
  }
}