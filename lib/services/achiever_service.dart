// lib/services/achiever_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/achiever.dart';

class AchieverService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch achievers from Firestore
  Future<List<Achiever>> fetchAchievers() async {
    try {
      // Fetch all documents in the 'leaderboard' collection
      QuerySnapshot snapshot = await _firestore
          .collection('leaderboard')
          .orderBy('score', descending: true)
          .get();

      // Map documents to Achiever objects
      List<Achiever> achievers = snapshot.docs.map((doc) {
        return Achiever.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      // Achievers are already ordered by score descending
      return achievers;
    } catch (e) {
      print('Error fetching achievers: $e');
      return [];
    }
  }
}
