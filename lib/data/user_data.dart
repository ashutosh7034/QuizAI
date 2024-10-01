import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> _updateUserData({
  required String name,
  required String email,
  required String description,
  String? profileImage, // This can be optional if the user doesn't change the image
}) async {
  final user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    try {
      // Update user data in Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'name': name,
        'email': email,
        'description': description,
        'profileImage': profileImage ?? FieldValue.delete(), // Only update if new image is provided
      });
      print("User data updated successfully!");
    } catch (e) {
      print("Failed to update user data: $e");
    }
  }
}
