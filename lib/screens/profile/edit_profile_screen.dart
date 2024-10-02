import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentEmail;
  final String currentDescription;

  const EditProfileScreen({
    Key? key,
    required this.currentName,
    required this.currentEmail,
    required this.currentDescription,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _description = '';
  File? _image;

  @override
  void initState() {
    super.initState();
    _name = widget.currentName;
    _email = widget.currentEmail;
    _description = widget.currentDescription;
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

  Future<void> _updateUserData(String updatedName, String updatedEmail, String updatedDescription) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'name': updatedName,
        'email': updatedEmail,
        'description': updatedDescription,
        // Optionally update the profile image URL here if needed
      });

      // Update the local state
      setState(() {
        _name = updatedName;
        _email = updatedEmail;
        _description = updatedDescription;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully!')));
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
                        : const NetworkImage('https://via.placeholder.com/100') as ImageProvider,
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
                  label: 'Email',
                  initialValue: _email,
                  onSaved: (value) => _email = value!,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Description',
                  initialValue: _description,
                  maxLines: 3,
                  onSaved: (value) => _description = value!,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await _updateUserData(_name, _email, _description); // Update data in Firestore
                      Navigator.pop(context, {
                        'name': _name,
                        'email': _email,
                        'description': _description,
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
          return 'Please enter your $label';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
