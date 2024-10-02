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
      // Fetch additional Google account data
      GoogleSignInAccount? googleUser = await GoogleSignIn().signInSilently();
      if (googleUser != null) {
        setState(() {
          userName = googleUser.displayName ?? userName;
          userEmail = googleUser.email ?? userEmail;
          profileImage = googleUser.photoUrl ?? profileImage;
        });
      }

      // Fetch data from Firestore
      DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (snapshot.exists) {
        var userData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          userName = userData['name'] ?? userName;
          userEmail = userData['email'] ?? userEmail;
          profileImage = userData['profileImage'] ?? profileImage;
        });
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
            Navigator.pushNamed(context, '/profile');
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
  }) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF9C27B0)),
      title: Text(
        text,
        style: const TextStyle(color: Colors.black87),
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
            Navigator.pushReplacementNamed(context, '/login');
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
