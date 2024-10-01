import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_ai/screens/auth/register_screen.dart';
import '../navigation/bottom_navigation.dart'; // Replace with your own HomePage or Bottom Navigation

class OTPScreen extends StatefulWidget {
  final String verificationId;
  const OTPScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _verifyOTP() async {
    String otp = _otpController.text.trim();

    if (otp.isNotEmpty) {
      try {
        // Create phone auth credential using the OTP and verification ID
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: otp,
        );

        // Sign in with the credential
        await _auth.signInWithCredential(credential);

        // Navigate to the home page upon successful OTP verification
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen()), // Replace with your home screen
        );
      } catch (e) {
        _showErrorSnackBar('Failed to verify OTP: $e');
      }
    } else {
      _showErrorSnackBar('Please enter the OTP');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter OTP"),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "We've sent an OTP to your phone",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter OTP",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: const Icon(Icons.security, color: Color(0xFF9C27B0)),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _verifyOTP,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFF9C27B0),
              ),
              child: const Text(
                "Verify OTP",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
