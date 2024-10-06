// lib/models/achiever.dart

import 'package:flutter/material.dart';

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
    if (score >= 2500) {
      badge = 'Galaxy Medal';
    } else if (score >= 2000) {
      badge = 'Meteorite Medal';
    } else if (score >= 1800) {
      badge = 'Crystal Medal';
    } else if (score >= 1600) {
      badge = 'Onyx Medal';
    } else if (score >= 1400) {
      badge = 'Titanium Medal';
    } else if (score >= 1200) {
      badge = 'Opal Medal';
    } else if (score >= 1000) {
      badge = 'Pearl Medal';
    } else if (score >= 900) {
      badge = 'Jade Medal';
    } else if (score >= 800) {
      badge = 'Topaz Medal';
    } else if (score >= 700) {
      badge = 'Amethyst Medal';
    } else if (score >= 600) {
      badge = 'Obsidian Medal';
    } else if (score >= 500) {
      badge = 'Sapphire Medal';
    } else if (score >= 400) {
      badge = 'Emerald Medal';
    } else if (score >= 300) {
      badge = 'Ruby Medal';
    } else if (score >= 200) {
      badge = 'Diamond Medal';
    } else if (score >= 100) {
      badge = 'Platinum Medal';
    } else if (score >= 50) {
      badge = 'Gold Medal';
    } else if (score >= 20) {
      badge = 'Silver Medal';
    } else if (score >= 10) {
      badge = 'Bronze Medal';
    } else {
      badge = 'Copper Medal';
    }
  }

  // Method to get the badge color
  Color getBadgeColor() {
    switch (badge) {
      case 'Galaxy Medal':
        return Colors.black; // You can set a custom color
      case 'Meteorite Medal':
        return Colors.grey[800]!;
      case 'Crystal Medal':
        return Colors.cyan;
      case 'Onyx Medal':
        return Colors.black;
      case 'Titanium Medal':
        return Colors.blueGrey;
      case 'Opal Medal':
        return Colors.teal;
      case 'Pearl Medal':
        return Colors.white;
      case 'Jade Medal':
        return Colors.green;
      case 'Topaz Medal':
        return Colors.amber;
      case 'Amethyst Medal':
        return Colors.purple;
      case 'Obsidian Medal':
        return Colors.black;
      case 'Sapphire Medal':
        return Colors.blue;
      case 'Emerald Medal':
        return Colors.greenAccent;
      case 'Ruby Medal':
        return Colors.red;
      case 'Diamond Medal':
        return Colors.blueAccent;
      case 'Platinum Medal':
        return Colors.lightBlue;
      case 'Gold Medal':
        return Colors.yellow;
      case 'Silver Medal':
        return Colors.grey;
      case 'Bronze Medal':
        return Colors.brown;
      case 'Copper Medal':
        return Colors.orange;
      default:
        return Colors.transparent; // Default color
    }
  }
}
