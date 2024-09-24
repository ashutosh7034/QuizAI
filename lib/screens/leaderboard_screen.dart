// File: lib/screens/leaderboard_screen.dart

import 'package:flutter/material.dart';
import '../data/leaderboard_data.dart';
import '../models/leaderboard_entry.dart';

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
        automaticallyImplyLeading: false, // Hides the back arrow
      ),
      body: leaderboardEntries.isNotEmpty
          ? ListView.builder(
        itemCount: leaderboardEntries.length,
        itemBuilder: (context, index) {
          final LeaderboardEntry entry = leaderboardEntries[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(entry.rank.toString()),
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
            ),
            title: Text(entry.name),
            subtitle: Text('Score: ${entry.score}'),
            trailing: Icon(
              Icons.star,
              color: Colors.orangeAccent,
            ),
          );
        },
      )
          : Center(
        child: Text('No leaderboard data available!'),
      ),
    );
  }
}