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
        title: const Text(
          'Top Achievers',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
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
        child: achievers.isNotEmpty
            ? ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: achievers.length,
          itemBuilder: (context, index) {
            final Achiever achiever = achievers[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
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
                    color: Color(0xFF9C27B0), // purple
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
                    color: Color(0xFF9C27B0).withOpacity(0.5),
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
      ),
    );
  }
}