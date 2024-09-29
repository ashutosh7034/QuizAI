import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_ai/screens/bottom_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isPasswordVisible = false;

  Future<void> _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signOut();
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (error) {
      _showErrorDialog('Google Sign-In failed: $error');
    }
  }

  Future<void> _handleFacebookSignIn() async {
    try {
      await FacebookAuth.instance.logOut();
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (error) {
      _showErrorDialog('Facebook Sign-In failed: $error');
    }
  }

  Future<void> _handleEmailSignIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } catch (error) {
        _showErrorDialog('Invalid email or password. Please try again.');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[20],
      appBar: AppBar(
        title: const Text("Login", style: TextStyle(color: Colors.black)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF9C27B0)),
                ),
                const SizedBox(height: 8),
                const Text('Please log in to continue.', style: TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(height: 40),
                _buildEmailField(),
                const SizedBox(height: 20),
                _buildPasswordField(),
                const SizedBox(height: 10),
                _buildForgotPasswordButton(),
                const SizedBox(height: 30),
                _buildLoginButton(),
                const SizedBox(height: 15),
                _buildRegisterButton(),
                const SizedBox(height: 30),
                Center(child: Text('Or continue with', style: TextStyle(color: Colors.grey.shade500))),
                const SizedBox(height: 20),
                _buildSocialLoginButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.email),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      validator: (value) => (value == null || value.isEmpty) ? 'Please enter your email' : null,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.lock_outline),
        filled: true,
        fillColor: Colors.grey.shade100,
        suffixIcon: IconButton(
          icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
        ),
      ),
      obscureText: !_isPasswordVisible,
      validator: (value) => (value == null || value.isEmpty) ? 'Please enter your password' : null,
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Handle "Forgot Password"
        },
        child: const Text('Forgot Password?', style: TextStyle(color: Color(0xFF9C27B0), fontSize: 14)),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _handleEmailSignIn,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Color(0xFF9C27B0),
        elevation: 5,
      ),
      child: const Text('Login', style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, '/register'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
      ),
      child: const Text('Register', style: TextStyle(fontSize: 18, color: Colors.black)),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialLoginButton(
          onPressed: _handleGoogleSignIn,
          imageAsset: 'assets/google.png',
          label: 'Google',
        ),
        const SizedBox(width: 20),
        _buildSocialLoginButton(
          onPressed: _handleFacebookSignIn,
          imageAsset: 'assets/facebook.png',
          label: 'Facebook',
        ),
      ],
    );
  }

  Widget _buildSocialLoginButton({required VoidCallback onPressed, required String imageAsset, required String label}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.grey.shade200,
        elevation: 3,
      ),
      icon: Image.asset(imageAsset, height: 24.0),
      label: Text(label, style: const TextStyle(color: Colors.black)),
    );
  }
}
