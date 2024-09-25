import 'package:flutter/material.dart';
import 'edit_profile_screen.dart'; // Make sure to create this file

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Oliver Smith';
  String username = '@oliversmith';
  String bio = 'Avid quiz taker and trivia enthusiast. Always up for a challenge!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Section
            Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/100'), // Replace with user's profile image URL
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9C27B0), // Changed to purple
                  ),
                ),
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    bio,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Statistics Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Statistics',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9C27B0), // Changed to purple
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatItem('150', 'Quizzes'),
                      _buildStatItem('85%', 'Average'),
                      _buildStatItem('90%', 'Completion'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatItem('1.2K', 'Points'),
                      _buildStatItem('Top 10', 'Rank'),
                      _buildStatItem('5', 'Badges'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Edit Profile Button
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      currentName: name,
                      currentUsername: username,
                      currentBio: bio,
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {
                    name = result['name'];
                    username = result['username'];
                    bio = result['bio'];
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF9C27B0), // Changed to purple
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              ),
              child: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),

            // Achievements Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Achievements',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9C27B0), // Changed to purple
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildAchievementBadge('Quiz Master'),
                        _buildAchievementBadge('Top Scorer'),
                        _buildAchievementBadge('Fast Lear ner'),
                        _buildAchievementBadge ('Consistent'),
                        _buildAchievementBadge('All-Rounder'),
                      ],
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

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildAchievementBadge(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/60'), // Replace with achievement badge URL
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}