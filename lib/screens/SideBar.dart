import 'package:flutter/material.dart';
import 'package:quiz_ai/screens/login_screen.dart'; // Import LoginScreen to manage the logout
import 'package:quiz_ai/screens/ChangePasswordScreen.dart';

import 'ChangePasswordScreen.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF9C27B0), Color(0xFFE040FB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: Text(
              "Oliver Smith",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            accountEmail: Text(
              "@oliversmith",
              style: TextStyle(color: Colors.white70),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://via.placeholder.com/150"), // Replace with your actual image URL
            ),
          ),
          ListTile(
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: const Text(
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
              Navigator.pushNamed(context, '/about_us');
            },
          ),
          _createDrawerItem(
            icon: Icons.help,
            text: 'Help & Support',
            onTap: () {
              Navigator.pushNamed(context, '/help_support');
            },
          ),
          _createDrawerItem(
            icon: Icons.privacy_tip,
            text: 'Privacy Policy',
            onTap: () {
              Navigator.pushNamed(context, '/privacy_policy');
            },
          ),
          _createDrawerItem(
            icon: Icons.article,
            text: 'Terms of Service',
            onTap: () {
              Navigator.pushNamed(context, '/terms_of_service');
            },
          ),
          const SizedBox(height: 20),
          ListTile(
            title: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
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
          ),
        ],
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
        style: TextStyle(color: Colors.black87),
      ),
      onTap: onTap,
    );
  }
}