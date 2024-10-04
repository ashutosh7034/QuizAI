// lib/screens/achiever_screen.dart

import 'package:flutter/material.dart';
import '../models/achiever.dart';
import '../services/achiever_service.dart';
import '../widgets/back_navigation_wrapper.dart';

class AchieverScreen extends StatefulWidget {
  @override
  _AchieverScreenState createState() => _AchieverScreenState();
}

class _AchieverScreenState extends State<AchieverScreen> {
  final AchieverService _achieverService = AchieverService();
  late Future<List<Achiever>> _achieversFuture;

  @override
  void initState() {
    super.initState();
    _achieversFuture = _achieverService.fetchAchievers();
  }

  @override
  Widget build(BuildContext context) {
    return BackNavigationWrapper(
      child:Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Achievers',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF9C27B0), // Purple
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9C27B0), Color(0xFF03A9F4)], // Purple to Blue-Green
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<List<Achiever>>(
          future: _achieversFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Error fetching achievers!',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'No achievers yet!',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              );
            }

            List<Achiever> achievers = snapshot.data!;

            return ListView.builder(
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
                      backgroundImage: achiever.imageUrl.isNotEmpty
                          ? NetworkImage(achiever.imageUrl)
                          : const AssetImage('assets/default_profile.png') as ImageProvider,
                      onBackgroundImageError: (_, __) =>
                      const Icon(Icons.error, color: Colors.red),
                      radius: 30,
                    ),
                    title: Text(
                      achiever.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF9C27B0), // Purple
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
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
            );
          },
        ),
      ),
      )
    );
  }
}
