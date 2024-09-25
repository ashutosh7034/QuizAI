import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.privacy_tip),
            SizedBox(width: 10),
            Text("Privacy Policy"),
          ],
        ),
        backgroundColor: Color(0xFF9C27B0), // Primary color (Purple)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFf7f7f7),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Introduction',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome to Quiz AI! Your privacy is critically important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our application. If you have any questions or concerns about our policy, or our practices with regards to your personal information, please contact us at support@quizai.com.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Information We Collect',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We collect information about you in a variety of ways. This includes:\n\n'
                          '• Personal Data: When you register on our app, we may ask for personal information such as your name, email address, and other contact details.\n'
                          '• Usage Data: We collect information about your interactions with our app, such as the pages you visit, the features you use, and the time you spend on the app.\n'
                          '• Device Data: We collect information about the device you use to access our app, including the hardware model, operating system, and device identifiers.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'How We Use Your Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We use the information we collect in various ways, including to:\n\n'
                          '• Provide and maintain our service: To ensure our app functions correctly and to provide you with the best possible experience.\n'
                          '• Improve our app: To understand how users interact with our app and to make improvements.\n'
                          '• Communicate with you: To send you updates, newsletters, and other information that may be of interest to you.\n'
                          '• Ensure security: To monitor and analyze usage and activity trends to keep our app safe and secure.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Sharing Your Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We only share information with your consent, to comply with laws, to provide you with services, to protect your rights, or to fulfill business obligations.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Contact Us',
                      style : TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'If you have any questions or concerns about our policy, or our practices with regards to your personal information, please contact us at support@quizai.com.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}