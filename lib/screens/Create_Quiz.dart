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
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create a New Form",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            const Text("Step 1: Form Title & Description"),
            const SizedBox(height: 16),

            // Form Title Input
            TextField(
              controller: _formTitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your form title",
              ),
            ),
            const SizedBox(height: 20),

            // Form Description Section (Optional)
            const Text(
              "Form Description (Optional)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
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
          leading: const Icon(Icons.short_text),
          title: const Text("Short Answer"),
          trailing: const Icon(Icons.add),
          onTap: () {
            // Logic to add Short Answer question
          },
        ),
        ListTile(
          leading: const Icon(Icons.article),
          title: const Text("Paragraph"),
          trailing: const Icon(Icons.add),
          onTap: () {
            // Logic to add Paragraph question
          },
        ),
        ListTile(
          leading: const Icon(Icons.radio_button_checked),
          title: const Text("Multiple Choice"),
          trailing: const Icon(Icons.add),
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
          onChanged: (bool value) {
            setState(() {
              collectEmail = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text("Limit responses to one person"),
          value: limitResponses,
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
            backgroundColor: Colors.grey,
          ),
          child: const Text("Preview"),
        ),
        ElevatedButton(
          onPressed: () {
            // Share the form
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: const Text("Share"),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CreateQuizScreen(),
  ));
}
