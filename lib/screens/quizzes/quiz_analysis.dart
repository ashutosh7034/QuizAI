import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/navigation/bottom_navigation.dart';
import '../categories/categoriesScreen.dart';

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
                // Navigate to CategoriesScreen instead of popping the current screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text('Back to Quiz', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
