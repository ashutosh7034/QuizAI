import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../main.dart';
import 'edit_profile_screen.dart'; // Ensure this file exists
import 'settings_screen.dart'; // Import the SettingsScreen

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Loading...';
  String email = 'Loading...';
  String description = 'Loading...';
  String profileImage = 'https://via.placeholder.com/100';
  List<String> achievements = []; // List to store user achievements
  List<String> medals = []; // List to store user medals
  int userScore = 0; // Variable to store user score
  String medalLevel = 'Beginner'; // Variable to store user medal level

  // New variables to store additional statistics
  int quizzesAttempted = 0;
  String rank = 'Not Ranked';
  int points = 0;
  int badges = 0;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _fetchUserAchievements(); // Fetch achievements
    _fetchUserMedals(); // Fetch medals
    _fetchUserScore(); // Fetch user score
    _fetchUserMedalLevel(); // Fetch user medal level
    _fetchUserStatistics(); // Fetch additional user statistics
  }

  Future<void> _fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (snapshot.exists) {
        var userData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          name = userData['name'] ?? user.displayName ?? 'User Name';
          email = userData['email'] ?? user.email ?? 'user@example.com';
          description = userData['description'] ?? 'A short description here';
          profileImage = userData['profileImage'] ?? user.photoURL ?? 'https://via.placeholder.com/100';
        });
      }
    }
  }

  Future<void> _fetchUserAchievements() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (snapshot.exists) {
        var userData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          achievements = List<String>.from(userData['achievements'] ?? []);
        });
      }
    }
  }

  Future<void> _fetchUserMedals() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (snapshot.exists) {
        var userData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          medals = List<String>.from(userData['medals'] ?? []); // Ensure the medals field exists in Firestore
        });
      }
    }
  }

  Future<void> _fetchUserScore() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (snapshot.exists) {
        var userData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          userScore = userData['score'] ?? 0; // Fetch user score
        });
      }
    }
  }

  Future<void> _fetchUserMedalLevel() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (snapshot.exists) {
        var userData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          medalLevel = userData['medalLevel'] ?? 'Beginner'; // Fetch user medal level
        });
      }
    }
  }

  // New method to fetch user statistics including quizzes attempted, rank, points, and badges
  Future<void> _fetchUserStatistics() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (snapshot.exists) {
        var userData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          quizzesAttempted = userData['quizzesAttempted'] ?? 0; // Fetch the number of quizzes attempted
          rank = userData['rank'] ?? 'Not Ranked'; // Fetch user rank
          points = userData['points'] ?? 0; // Fetch user points
          badges = userData['badges'] ?? 0; // Fetch number of badges
        });
      }
    }
  }

  Future<void> _updateUserData(String updatedName, String updatedEmail, String updatedDescription) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'name': updatedName,
        'email': updatedEmail,
        'description': updatedDescription,
      });

      setState(() {
        name = updatedName;
        email = updatedEmail;
        description = updatedDescription;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen(
                  onThemeChanged: (mode) {
                    final myApp = context.findAncestorStateOfType<MyAppState>();
                    if (myApp != null) {
                      myApp.toggleThemeMode(mode);
                    }
                  },
                )),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildProfileInfo(),
              const SizedBox(height: 20),
              _buildStatisticsSection(), // Now includes user score and medal level
              const SizedBox(height: 20),
              _buildEditProfileButton(),
              const SizedBox(height: 20),
              _buildAchievementsSection(),
              const SizedBox(height: 20),
              _buildMedalsSection(), // Display medals here
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(profileImage),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9C27B0),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildEditProfileButton() {
    return ElevatedButton(
      onPressed: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditProfileScreen(
              currentName: name,
              currentEmail: email,
              currentDescription: description,
            ),
          ),
        );

        if (result != null) {
          await _updateUserData(result['name'], result['email'], result['description']);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF9C27B0),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
      ),
      child: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildStatisticsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9C27B0),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('$quizzesAttempted', 'Quizzes Attempted'), // Display quizzes attempted
              _buildStatItem('$userScore', 'Score'), // Display user score
              _buildStatItem(medalLevel, 'Medal Level'), // Display user medal level
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('$points', 'Points'), // Display points
              _buildStatItem(rank, 'Rank'), // Display user rank
              _buildStatItem('$badges', 'Badges'), // Display number of badges
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF9C27B0)),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildAchievementsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Achievements',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9C27B0),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: achievements.map((badge) => _buildAchievementBadge(badge)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementBadge(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://via.placeholder.com/60'), // Replace with achievement badge URL
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF9C27B0))),
        ],
      ),
    );
  }

  // New method to build the medals section
  Widget _buildMedalsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Medals',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9C27B0),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: medals.map((medal) => _buildMedalBadge(medal)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedalBadge(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://via.placeholder.com/60'), // Replace with medal image URL
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF9C27B0))),
        ],
      ),
    );
  }
}
