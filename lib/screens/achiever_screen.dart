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
        title: const Text('Top Achievers'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: achievers.isNotEmpty
          ? ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: achievers.length,
        itemBuilder: (context, index) {
          final Achiever achiever = achievers[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(achiever.imageUrl),
                onBackgroundImageError: (_, __) => const Icon(Icons.error, color: Colors.red),
                radius: 30,
              ),
              title: Text(
                achiever.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Score: ${achiever.score}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  achiever.badge,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      )
          : const Center(
        child: Text(
          'No achievers yet!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}