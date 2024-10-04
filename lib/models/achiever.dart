// lib/models/achiever.dart

class Achiever {
  final String name;
  final int score;
  final String email;
  final String imageUrl;
  late final String badge;

  Achiever({
    required this.name,
    required this.score,
    required this.email,
    required this.imageUrl,
  }) {
    assignBadge();
  }

  // Factory constructor to create an Achiever from Firestore document data
  factory Achiever.fromFirestore(Map<String, dynamic> data) {
    return Achiever(
      name: data['name'] ?? 'Unknown',
      score: data['score'] ?? 0,
      email: data['email'] ?? '',
      imageUrl: data['profilePicture'] ?? '',
    );
  }

  // Method to assign badge based on score
  void assignBadge() {
    if (score >= 3000) {
      badge = 'Galaxy Medal';
    } else if (score >= 2500) {
      badge = 'Meteorite Medal';
    } else if (score >= 2000) {
      badge = 'Crystal Medal';
    } else if (score >= 1800) {
      badge = 'Onyx Medal';
    } else if (score >= 1600) {
      badge = 'Titanium Medal';
    } else if (score >= 1400) {
      badge = 'Opal Medal';
    } else if (score >= 1200) {
      badge = 'Pearl Medal';
    } else if (score >= 1000) {
      badge = 'Jade Medal';
    } else if (score >= 900) {
      badge = 'Topaz Medal';
    } else if (score >= 800) {
      badge = 'Amethyst Medal';
    } else if (score >= 700) {
      badge = 'Obsidian Medal';
    } else if (score >= 600) {
      badge = 'Sapphire Medal';
    } else if (score >= 500) {
      badge = 'Emerald Medal';
    } else if (score >= 400) {
      badge = 'Ruby Medal';
    } else if (score >= 300) {
      badge = 'Diamond Medal';
    } else if (score >= 200) {
      badge = 'Platinum Medal';
    } else if (score >= 100) {
      badge = 'Gold Medal';
    } else if (score >= 50) {
      badge = 'Silver Medal';
    } else if (score >= 20) {
      badge = 'Bronze Medal';
    } else {
      badge = 'Copper Medal';
    }
  }
}
