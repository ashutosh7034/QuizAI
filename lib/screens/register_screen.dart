import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:quiz_ai/screens/HomePage.dart'; // Replace with your actual HomePage

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Google sign-in instance
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Password visibility state
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Dispose the controllers
  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Method to handle Google Sign-Up
  Future<void> _handleGoogleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Successful registration, navigate to the home page or handle accordingly
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (error) {
      print("Google Sign-Up failed: $error");
      // Handle error appropriately in real apps
    }
  }

  // Method to handle Facebook Sign-Up
  Future<void> _handleFacebookSignUp() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        // Successful registration, navigate to the home page or handle accordingly
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (error) {
      print("Facebook Sign-Up failed: $error");
      // Handle error appropriately in real apps
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Your Account"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // For text color
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white, // Set background color to white
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Full Name',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your full name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person, color: Colors.black),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Email',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your email address',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Password',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock, color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState (() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Confirm Password',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Re-enter your password',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock, color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !_isConfirmPasswordVisible,
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle registration, then navigate to the login page or home
                          Navigator.pop(context); // Go back to login after registration
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: Color(0xFF6200EE), // Primary color
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('OR'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Google Registration Button
                    ElevatedButton.icon(
                      onPressed: _handleGoogleSignUp, // Handle Google registration
                      icon: Image.asset('assets/google.png', height: 24, width: 24), // Use the official Google logo
                      label: const Text('Register with Google'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        minimumSize: const Size.fromHeight(50),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Facebook Registration Button
                    ElevatedButton.icon(
                      onPressed: _handleFacebookSignUp, // Handle Facebook registration
                      icon: Image.asset('assets/facebook.png', height: 24, width: 24), // Use the official Facebook logo
                      label: const Text('Register with Facebook'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        minimumSize: const Size.fromHeight(50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}