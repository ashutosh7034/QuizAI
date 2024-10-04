import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore package
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth for user details
import 'package:quiz_ai/screens/navigation/bottom_navigation.dart';

class QuizAnalysisScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<Map<String, dynamic>> selectedQuestions;
  final List<String> selectedAnswers;

  const QuizAnalysisScreen({
    Key? key,
    required this.score,
    required this.totalQuestions,
    required this.selectedQuestions,
    required this.selectedAnswers,
  }) : super(key: key);

  Future<void> _saveScoreToFirestore() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String email = user.email ?? 'Unknown email';
      String displayName = user.displayName ?? 'Unknown name';
      String? profilePicture = user.photoURL ?? ''; // Fetch profile picture

      // Reference to the leaderboard collection
      CollectionReference leaderboard = FirebaseFirestore.instance.collection('leaderboard');

      // Check if the user already exists in the leaderboard
      DocumentSnapshot userDoc = await leaderboard.doc(email).get();

      if (userDoc.exists) {
        // User exists, so update the score by adding to the existing score
        int currentScore = userDoc['score'];
        await leaderboard.doc(email).update({
          'score': currentScore + score,
        });
      } else {
        // New user, so create a new document with the user's details
        await leaderboard.doc(email).set({
          'name': displayName,
          'email': email,
          'score': score,
          'profilePicture': profilePicture, // Store the profile picture
          'timestamp': FieldValue.serverTimestamp(), // Store the current timestamp
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Analysis', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Your Score: $score out of $totalQuestions',
              style: const TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: totalQuestions,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white.withOpacity(0.3),
                    child: ListTile(
                      title: Text(
                        selectedQuestions[index]['question'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Your answer: ${selectedAnswers[index]}'
                            '\nCorrect answer: ${selectedQuestions[index]['answer']}',
                        style: const TextStyle(color: Colors.yellowAccent),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Save the score to Firestore
                _saveScoreToFirestore().then((_) {
                  // Navigate to HomePage
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                });
              },
              child: const Text('Back to Quiz', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
