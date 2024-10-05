import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'PrivacyPolicyScreen.dart';
import 'TermsOfServiceScreen.dart';
import 'login_screen.dart'; // Ensure to import your LoginScreen

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isAgreed = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate() && _isAgreed) {
      setState(() {
        _isLoading = true; // Show loading indicator
      });

      try {
        // Create user with Firebase Authentication
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Store the user's full name, email, and last login in Firestore
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'username': _nameController.text.trim(),
          'email': _emailController.text.trim(),
          'last_login': FieldValue.serverTimestamp(), // Store last login time
        });

        // Send email verification
        await userCredential.user?.sendEmailVerification();

        // Show success message
        await _showSuccessDialog('Registration successful! Please verify your email.');

        // Navigate to LoginScreen after the dialog is dismissed
        Navigator.pushReplacement(
          context,
          _buildPageRoute(LoginScreen()), // Replace with your LoginScreen
        );
      } catch (e) {
        _showErrorSnackBar('Registration failed: ${e.toString()}');
      } finally {
        setState(() {
          _isLoading = false; // Hide loading indicator
        });
      }
    } else if (!_isAgreed) {
      _showErrorSnackBar('You must agree to the Privacy Policy and Terms of Use');
    }
  }

  Future<void> _showSuccessDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Prevents dismissing by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _openPrivacyPolicy() {
    Navigator.push(
      context,
      _buildPageRoute(PrivacyPolicyScreen()),
    );
  }

  void _openTermsOfUse() {
    Navigator.push(
      context,
      _buildPageRoute(TermsOfServiceScreen()),
    );
  }

  PageRoute _buildPageRoute(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Your Account"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField("Full Name", _nameController, Icons.person, "Enter your full name", false),
                  _buildTextField("Email", _emailController, Icons.email, "Enter your email address", false),
                  _buildPasswordField("Password", _passwordController, _isPasswordVisible, false),
                  _buildPasswordField("Confirm Password", _confirmPasswordController, _isConfirmPasswordVisible, true),
                  _buildPrivacyAndTerms(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _register, // Calls _register when pressed
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: const Color(0xFF9C27B0),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          _buildPageRoute(LoginScreen()), // Navigate to LoginScreen
                        );
                      },
                      child: const Text(
                        "Already registered? Login here.",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon, String hintText, bool isObscure) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(icon, color: const Color(0xFF9C27B0)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $label';
            } else if (label == "Email" && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller, bool isVisible, bool isConfirm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: !isVisible,
          decoration: InputDecoration(
            hintText: 'Enter your $label',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.lock, color: Color(0xFF9C27B0)),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  if (isConfirm) {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  } else {
                    _isPasswordVisible = !_isPasswordVisible;
                  }
                });
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $label';
            }
            if (!isConfirm && value.length < 6) {
              return 'Password must be at least 6 characters';
            } else if (isConfirm && value != _passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPrivacyAndTerms() {
    return Row(
      children: [
        Checkbox(
          value: _isAgreed,
          onChanged: (bool? value) {
            setState(() {
              _isAgreed = value ?? false;
            });
          },
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: 'I agree to the ', style: TextStyle(color: Colors.black)),
                TextSpan(
                  text: 'Privacy Policy',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()..onTap = _openPrivacyPolicy,
                ),
                const TextSpan(text: ' and ', style: TextStyle(color: Colors.black)),
                TextSpan(
                  text: 'Terms of Service',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()..onTap = _openTermsOfUse,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
