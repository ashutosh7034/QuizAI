class LeaderboardEntry {
  final String name;
  final int score;
  final String email;
  final String profilePicture; // Add profile picture field

  LeaderboardEntry({
    required this.name,
    required this.score,
    required this.email,
    required this.profilePicture, // Initialize profile picture
  });
}
