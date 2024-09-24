import 'package:flutter/material.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  // Form fields
  final TextEditingController _formTitleController = TextEditingController();
  bool collectEmail = false;
  bool limitResponses = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("[App Name]"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create a New Form",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "Step 1: Form Title & Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Form Title Input
            TextField(
              controller: _formTitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: "Enter your form title",
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 20),

            // Form Description Section (Optional)
            const Text(
              "Form Description (Optional)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // Options for Short Answer, Paragraph, Multiple Choice
            _buildFormDescriptionOptions(),

            const SizedBox(height: 20),

            // Form Settings
            const Text(
              "Form Settings",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            _buildFormSettings(),

            const SizedBox(height: 20),

            // Customize Design
            const Text(
              "Customize Design (Optional)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // Buttons for Preview and Share
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  // Form Description Options Widget
  Widget _buildFormDescriptionOptions() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.short_text, color: Colors.blueAccent),
          title: const Text("Short Answer"),
          trailing: const Icon(Icons.add, color: Colors.blueAccent),
          onTap: () {
            // Logic to add Short Answer question
          },
        ),
        ListTile(
          leading: const Icon(Icons.article, color: Colors.blueAccent),
          title: const Text("Paragraph"),
          trailing: const Icon(Icons.add, color: Colors.blueAccent),
          onTap: () {
            // Logic to add Paragraph question
          },
        ),
        ListTile(
          leading: const Icon(Icons.radio_button_checked, color: Colors.blueAccent),
          title: const Text("Multiple Choice"),
          trailing: const Icon(Icons.add, color: Colors.blueAccent),
          onTap: () {
            // Logic to add Multiple Choice question
          },
        ),
      ],
    );
  }

  // Form Settings Widget
  Widget _buildFormSettings() {
    return Column(
      children: [
        SwitchListTile(
          title: const Text("Collect Email Addresses"),
          value: collectEmail,
          activeColor: Colors.blueAccent,
          onChanged: (bool value) {
            setState(() {
              collectEmail = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text("Limit responses to one person"),
          value: limitResponses,
          activeColor: Colors.blueAccent,
          onChanged: (bool value) {
            setState(() {
              limitResponses = value;
            });
          },
        ),
      ],
    );
  }

  // Bottom Buttons for Preview and Share
  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            // Preview the form
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: const Text(
            "Preview",
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Share the form
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: const Text(
            "Share",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}