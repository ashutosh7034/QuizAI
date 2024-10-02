import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'edit_profile_screen.dart'; // Ensure this file exists

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

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Fetch user data from Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
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

  Future<void> _updateUserData(String updatedName, String updatedEmail, String updatedDescription) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'name': updatedName,
        'email': updatedEmail,
        'description': updatedDescription,
      });

      // Update the local state
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
        elevation: 0,
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
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(profileImage),
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9C27B0),
                  ),
                ),
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
            ),
            const SizedBox(height: 20),

            // Statistics Section
            _buildStatisticsSection(),

            // Edit Profile Button
            ElevatedButton(
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
                  // Update user data with the new values from the EditProfileScreen
                  await _updateUserData(result['name'], result['email'], result['description']);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF9C27B0),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              ),
              child: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),

            // Achievements Section
            _buildAchievementsSection(),
          ],
        ),
      ),
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
