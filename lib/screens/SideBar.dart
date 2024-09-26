import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/login_screen.dart'; // Import LoginScreen to manage the logout
import 'package:quiz_ai/screens/ChangePasswordScreen.dart';
import 'package:quiz_ai/screens/AboutUsScreen.dart';

import 'HelpSupportScreen.dart';
import 'PrivacyPolicyScreen.dart'; // Import AboutUsScreen

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
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

  // Helper method to create the header
  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF9C27B0), Color(0xFFE040FB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      accountName: const Text(
        "Oliver Smith",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      accountEmail: const Text(
        "@oliversmith",
        style: TextStyle(color: Colors.white70),
      ),
      currentAccountPicture: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://via.placeholder.com/150"), // Replace with your actual image URL
      ),
    );
  }

  // Helper method to create the profile button
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
            // Action when 'View Profile' is clicked
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

  // Helper method to create drawer items
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

  // Helper method to create the logout button
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
          onPressed: () {
            // Action for logout
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