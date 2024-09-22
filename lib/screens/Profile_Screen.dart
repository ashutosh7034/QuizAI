import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Handle settings action
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Section
            Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/100'), // Replace with user's profile image URL
                ),
                SizedBox(height: 10),
                Text(
                  'Oliver Smith',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '@oliversmith',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Avid quiz taker and trivia enthusiast. Always up for a challenge!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
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
              onPressed: () {
                // Handle edit profile action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              ),
              child: const Text('Edit Profile'),
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
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildAchievementBadge('Quiz Master'),
                        _buildAchievementBadge('Top Scorer'),
                        _buildAchievementBadge('Fast Learner'),
                        _buildAchievementBadge('Consistent'),
                        _buildAchievementBadge('All-Rounder'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Recent Activities Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Recent Activities',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add widgets to show recent activities
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set profile as the selected tab
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {*/
          // Handle bottom nav bar tap
          /*switch (index) {
            case 0:
              Navigator.pushNamed(context, '/dashboard');
              break;
            case 1:
              Navigator.pushNamed(context, '/search');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),*/
    );
  }

  // Helper method to build statistics items
  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Helper method to build achievement badges
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
