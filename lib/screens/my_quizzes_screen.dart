import 'package:flutter/material.dart';

class MyQuizzesScreen extends StatelessWidget {
  final List<Map<String, String>> quizzes = [
    {
      'title': 'Operating Systems',
      'description': 'Test your knowledge on concepts of Process Management, Memory, Scheduling, and more.',
    },
    {
      'title': 'Database Management Systems (DBMS)',
      'description': 'Assess yourself on database fundamentals, SQL, ER Diagrams, Normalization, and more.',
    },
    {
      'title': 'Computer Networks',
      'description': 'Evaluate your understanding of OSI model, TCP/IP, Networking Protocols, and more.',
    },
    {
      'title': 'Software Engineering',
      'description': 'Challenge your skills on SDLC, Agile methodologies, UML Diagrams, and more.',
    },
    {
      'title': 'Theory of Computation',
      'description': 'Test your knowledge on Automata, Grammars, Languages, and Turing Machines.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Quizzes'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: quizzes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              title: Text(
                quizzes[index]['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                quizzes[index]['description']!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              trailing: const Icon(Icons.play_arrow, color: Colors.blue),
              onTap: () {
                // Navigate to the specific quiz screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizDetailScreen(
                      quizTitle: quizzes[index]['title']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// A placeholder for the detailed quiz screen for each subject.
class QuizDetailScreen extends StatelessWidget {
  final String quizTitle;

  const QuizDetailScreen({Key? key, required this.quizTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quizTitle),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'This is the quiz for $quizTitle',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyQuizzesScreen(),
  ));
}
