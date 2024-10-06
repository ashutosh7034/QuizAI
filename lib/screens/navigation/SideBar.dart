import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../about/AboutUsScreen.dart';
import '../auth/ChangePasswordScreen.dart';
import '../auth/PrivacyPolicyScreen.dart';
import '../profile/HelpSupportScreen.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String userName = 'User Name';
  String userEmail = 'user@example.com';
  String profileImage = 'https://via.placeholder.com/150';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Fetch data from Firestore
      DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (snapshot.exists) {
        var userData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          userName = userData['username'] ?? user.displayName ?? 'User Name'; // Ensure to get the name
          userEmail = userData['email'] ?? user.email ?? 'user@example.com';
          profileImage = userData['profileImage'] ?? profileImage; // Optional: Add profileImage field in Firestore if required
        });
      } else {
        // In case Firestore data is not available, you can set a default name
        setState(() {
          userName = user.displayName ?? 'User Name'; // Fallback to displayName if available
          userEmail = user.email ?? 'user@example.com';
        });
      }

      // If the user signed in using Google, get the Google account data
      if (user.providerData.any((provider) => provider.providerId == 'google.com')) {
        GoogleSignInAccount? googleUser = await GoogleSignIn().signInSilently();
        if (googleUser != null) {
          setState(() {
            userName = googleUser.displayName ?? userName;
            userEmail = googleUser.email ?? userEmail;
            profileImage = googleUser.photoUrl ?? profileImage;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(userName, userEmail, profileImage),
          _createProfileButton(context),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10),
            child: Text(
              'Others',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const Divider(thickness: 1),
          _createDrawerItem(
            icon: Icons.lock,
            text: 'Change Password',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
              );
            },
            textColor: Colors.purple, // Change color for this item
          ),
          _createDrawerItem(
            icon: Icons.info,
            text: 'About Us',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()),
              );
            },
            textColor: Colors.purple, // Change color for this item
          ),
          _createDrawerItem(
            icon: Icons.help,
            text: 'Help & Support',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpSupportScreen()),
              );
            },
            textColor: Colors.purple, // Change color for this item
          ),
          _createDrawerItem(
            icon: Icons.privacy_tip,
            text: 'Privacy Policy',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
              );
            },
            textColor: Colors.purple, // Change color for this item
          ),
          _createDrawerItem(
            icon: Icons.article,
            text: 'Terms of Service',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
              );
            },
            textColor: Colors.purple, // Change color for this item
          ),
          const SizedBox(height: 20),
          _createLogoutButton(context),
        ],
      ),
    );
  }

  Widget _createHeader(String name, String email, String imageUrl) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF9C27B0), Color(0xFFE040FB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      accountName: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      accountEmail: Text(
        email,
        style: const TextStyle(color: Colors.white70),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }

  Widget _createProfileButton(BuildContext context) {
    return ListTile(
      title: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF9C27B0),
            minimumSize: const Size.fromHeight(40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/profile'); // Ensure that the '/profile' route is defined
          },
          child: const Text(
            'View Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
    Color textColor = Colors.black87, // Default text color
  }) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF9C27B0)),
      title: Text(
        text,
        style: TextStyle(color: textColor), // Use the specified text color
      ),
      onTap: onTap,
    );
  }

  Widget _createLogoutButton(BuildContext context) {
    return ListTile(
      title: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent,
            minimumSize: const Size.fromHeight(40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            await GoogleSignIn().signOut(); // Ensure Google Sign-Out
            Navigator.pushReplacementNamed(context, '/login'); // Navigate to Login page
          },
          child: const Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
