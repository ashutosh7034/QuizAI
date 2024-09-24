// File: lib/screens/leaderboard_screen.dart

import 'package:flutter/material.dart';
import '../data/leaderboard_data.dart';
import '../models/leaderboard_entry.dart';

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        automaticallyImplyLeading: false, // Hides the back arrow
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: leaderboardEntries.isNotEmpty
          ? ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: leaderboardEntries.length,
        itemBuilder: (context, index) {
          final LeaderboardEntry entry = leaderboardEntries[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  entry.rank.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.blueAccent,
              ),
              title: Text(
                entry.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
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
      )
          : const Center(
        child: Text(
          'No leaderboard data available!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}