import 'package:flutter/material.dart';
import '../data/leaderboard_data.dart';
import '../models/leaderboard_entry.dart';

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(color: Colors.white),
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
        child: leaderboardEntries.isNotEmpty
            ? ListView.builder(
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
                  backgroundColor: Color(0xFF9C27B0).withOpacity(0.5),
                  child: Text(
                    entry.rank.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
        )
            : const Center(
          child: Text(
            'No leaderboard data available!',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}