import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/leaderboard_entry.dart';
import '../widgets/back_navigation_wrapper.dart';

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back gesture
      child: BackNavigationWrapper(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Leaderboard',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
            automaticallyImplyLeading: false, // Hides the back arrow
            backgroundColor: Color(0xFF9C27B0), // purple
            centerTitle: true,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF9C27B0), Color(0xFF03A9F4)], // purple to blue-green
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('leaderboard')
                  .orderBy('score', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No leaderboard data available!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                }

                final leaderboardEntries = snapshot.data!.docs.map((doc) {
                  return LeaderboardEntry(
                    name: doc['name'],
                    score: doc['score'],
                    email: doc['email'],
                    profilePicture: doc['profilePicture'] ?? '', // Fetch profile picture
                  );
                }).toList();

                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: leaderboardEntries.length,
                  itemBuilder: (context, index) {
                    final LeaderboardEntry entry = leaderboardEntries[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: entry.profilePicture.isNotEmpty
                              ? NetworkImage(entry.profilePicture) // Display profile picture
                              : AssetImage('assets/default_profile.png') as ImageProvider, // Default image if no picture
                        ),
                        title: Text(
                          entry.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF9C27B0), // purple
                          ),
                        ),
                        subtitle: Text(
                          'Score: ${entry.score}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        trailing: Icon(
                          Icons.star,
                          color: index == 0
                              ? Colors.yellow
                              : index == 1
                              ? Colors.grey
                              : index == 2
                              ? Colors.brown
                              : Colors.orangeAccent,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
