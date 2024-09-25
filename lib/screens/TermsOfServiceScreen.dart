import 'package:flutter/material.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.description),
            SizedBox(width: 10),
            Text("Terms of Service"),
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
                      'Terms of Service',
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
                      'Welcome to Quiz AI. These terms and conditions outline the rules and regulations for the use of our App. By accessing this App we assume you accept these terms and conditions. Do not continue to use Quiz AI if you do not agree to take all of the terms and conditions stated on this page.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'License',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Unless otherwise stated, Quiz AI and/or its licensors own the intellectual property rights for all material on Quiz AI. All intellectual property rights are reserved. You may access this from Quiz AI for your own personal use subjected to restrictions set in these terms and conditions.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'User Comments',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Parts of this App offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Quiz AI does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Quiz AI,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Hyperlinking to our Content',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'The following organizations may link to our App without prior written approval: Government agencies; Search engines; News organizations; Online directory distributors may link to our App in the same manner as they hyperlink to the Websites of other listed businesses; and System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Frames',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our App.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Content Liability',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We shall not be hold responsible for any content that appears on your App. You agree to protect and defend us against all claims that is rising on your App. No link(s) should appear on any App that may be interpreted as libelous, obscene or criminal or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.',
                      style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C27B0), // Primary color (Purple)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'If you have questions or comments about this terms and conditions, you may email us at support@quizai.com.',
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