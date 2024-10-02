import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged; // Callback to change theme mode

  const SettingsScreen({Key? key, required this.onThemeChanged}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    // Load saved theme preference if needed
  }

  void _toggleDarkMode(bool? value) {
    setState(() {
      _isDarkMode = value ?? false;
      widget.onThemeChanged(_isDarkMode ? ThemeMode.dark : ThemeMode.light); // Notify parent about theme change
    });
    // This example does not persist theme preference
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: _toggleDarkMode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
