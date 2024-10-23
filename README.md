QuizAI
QuizAI is a cross-platform quiz application designed to enhance the learning experience for students, educators, and competitive programmers. It leverages artificial intelligence to generate quizzes from study materials, providing real-time progress tracking, leaderboards, and achievements to make learning engaging and efficient.

Features
AI-Generated Quizzes: Automatically generates quiz questions from uploaded PDFs using AI.
Real-Time Data Synchronization: Data is synchronized across platforms (Android/iOS) using Firebase.
User Profiles: Allows users to create profiles, track progress, and view achievements.
Leaderboards & Achievements: Motivate users by allowing them to compete with others and earn badges.
Cross-Platform Compatibility: Compatible with Android and iOS devices.
Firebase Integration: Utilizes Firebase for user authentication, real-time data storage, and file handling.
Tech Stack
Frontend: Flutter (Dart)
Backend: Firebase (Firestore, Authentication, Storage)
AI Model: Google Cloud for generating quiz questions from PDF documents.
Getting Started
Prerequisites
Before you can build and run QuizAI, make sure you have the following:

Flutter SDK: Download here
Firebase Account: Create Firebase project
Google Cloud Account: Set up Google Cloud to host the AI model for quiz generation.
Installation
Clone the repository:

bash
Copy code
git clone https://github.com/ashutosh7034/QuizAI.git
Navigate to the project directory:

bash
Copy code
cd QuizAI
Install dependencies:

bash
Copy code
flutter pub get
Configure Firebase:

Add your Firebase configuration files (google-services.json for Android and GoogleService-Info.plist for iOS).
Ensure Firestore, Authentication, and Storage are enabled in your Firebase project.
Run the app:

bash
Copy code
flutter run
Firebase Setup
Firestore: Structure your Firestore database to store quizzes, users, and results.
Authentication: Enable Google Sign-In and Email/Password authentication in Firebase.
Storage: Use Firebase Storage to handle PDF uploads from which quizzes will be generated.
Google Cloud Setup
Set up an AI model in Google Cloud to process uploaded PDFs and generate quiz questions.
Integrate the model with your Flutter app by calling Google Cloud functions.
Contributions
Contributions are welcome! If you'd like to contribute:

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Make your changes and commit (git commit -m 'Add new feature').
Push to your branch (git push origin feature-branch).
Open a Pull Request.
License
This project is licensed under the MIT License. See the LICENSE file for details.

Contact
For any inquiries or issues, feel free to reach out:

GitHub: QuizAI Repository
Email: ashutosh3276s16@gmail.com
