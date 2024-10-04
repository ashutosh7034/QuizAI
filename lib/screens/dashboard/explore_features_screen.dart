import 'package:flutter/material.dart';

class ExploreFeaturesScreen extends StatelessWidget {
  const ExploreFeaturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Features'),
        backgroundColor: const Color(0xFF9C27B0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Feature 1
            FeatureCard(
              title: 'Personalized Quizzes',
              description:
              'Take quizzes that adapt to your learning style and pace. Enhance your knowledge with tailored questions.',
              icon: Icons.check_circle,
            ),
            const SizedBox(height: 20),

            // Feature 2
            FeatureCard(
              title: 'Progress Tracking',
              description:
              'Track your progress over time. Review your quiz history, scores, and areas for improvement.',
              icon: Icons.bar_chart,
            ),
            const SizedBox(height: 20),

            // Feature 3
            FeatureCard(
              title: 'Resource Access',
              description:
              'Access a variety of resources to help you study, including articles, videos, and more.',
              icon: Icons.library_books,
            ),
            const SizedBox(height: 20),

            // Feature 4
            FeatureCard(
              title: 'Community Engagement',
              description:
              'Join a community of learners. Share your achievements, ask questions, and help others.',
              icon: Icons.group,
            ),
            const SizedBox(height: 20),

            // Feature 5
            FeatureCard(
              title: 'Quizzes on Demand',
              description:
              'Take quizzes anytime, anywhere. Our app is available on all devices for your convenience.',
              icon: Icons.access_time,
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: const Color(0xFF9C27B0),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
