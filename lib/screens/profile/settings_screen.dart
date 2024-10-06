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
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF9C27B0), // purple
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Title and description
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9C27B0), // purple
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Adjust your preferences below',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // Dark Mode Switch
              Card(
                elevation: 5, // Add elevation for depth
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: ListTile(
                  title: const Text(
                    'Dark Mode',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500), // Text style
                  ),
                  trailing: Switch(
                    value: _isDarkMode,
                    activeColor: Color(0xFF9C27B0), // purple
                    onChanged: _toggleDarkMode,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Save Settings Button
              ElevatedButton(
                onPressed: () {
                  // Handle saving settings
                  Navigator.of(context).pop(); // Navigate back on save
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF03A9F4), // blue-green
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  'Save Settings',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
