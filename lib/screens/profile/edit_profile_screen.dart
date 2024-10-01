import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentEmail; // Changed from currentUsername
  final String currentDescription; // Changed from currentBio

  const EditProfileScreen({
    Key? key,
    required this.currentName,
    required this.currentEmail, // Updated constructor parameter
    required this.currentDescription, // Updated constructor parameter
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = ''; // New field for email
  String _description = ''; // Changed from _bio to _description
  File? _image;

  @override
  void initState() {
    super.initState();
    _name = widget.currentName;
    _email = widget.currentEmail; // Updated to set current email
    _description = widget.currentDescription; // Updated to set current description
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : const NetworkImage('https://via.placeholder.com/100')
                    as ImageProvider,
                    child: _image == null
                        ? const Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Name',
                  initialValue: _name,
                  onSaved: (value) => _name = value!,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Email', // Changed from Username to Email
                  initialValue: _email, // Using email variable
                  onSaved: (value) => _email = value!,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Description', // Changed from Bio to Description
                  initialValue: _description, // Using description variable
                  maxLines: 3,
                  onSaved: (value) => _description = value!,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pop(context, {
                        'name': _name,
                        'email': _email, // Added email to the result
                        'description': _description, // Changed from bio to description
                        'image': _image,
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.blueAccent,
                    elevation: 5,
                  ),
                  child: const Text('Save Changes', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    int maxLines = 1,
    required void Function(String?) onSaved,
  }) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ' Please enter your $label';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
