// File: lib/screens/achiever_screen.dart

import 'package:flutter/material.dart';
import '../data/achiever_data.dart';
import '../models/achiever.dart';

class AchieverScreen extends StatefulWidget {
  @override
  _AchieverScreenState createState() => _AchieverScreenState();
}

class _AchieverScreenState extends State<AchieverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Achievers'),
        automaticallyImplyLeading: false,
      ),
      body: achievers.isNotEmpty ? ListView.builder(
        itemCount: achievers.length,
        itemBuilder: (context, index) {
          final Achiever achiever = achievers[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(achiever.imageUrl),
                onBackgroundImageError: (_, __) => Icon(Icons.error),
              ),
              title: Text(achiever.name),
              subtitle: Text('Score: ${achiever.score}'),
              trailing: Text(achiever.badge),
            ),
          );
        },
      ) : Center(
        child: Text('No achievers yet!'),
      ),
    );
  }
}
