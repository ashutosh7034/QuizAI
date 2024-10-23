# QuizAI

**QuizAI** is a cross-platform quiz application designed to enhance the learning experience for students, educators, and competitive programmers. It leverages artificial intelligence to generate quizzes from study materials, providing real-time progress tracking, leaderboards, and achievements to make learning engaging and efficient.

## Features

- **AI-Generated Quizzes**: Automatically generates quiz questions from uploaded PDFs using AI.
- **Real-Time Data Synchronization**: Data is synchronized across platforms (Android/iOS) using Firebase.
- **User Profiles**: Allows users to create profiles, track progress, and view achievements.
- **Leaderboards & Achievements**: Motivate users by allowing them to compete with others and earn badges.
- **Cross-Platform Compatibility**: Compatible with Android and iOS devices.
- **Firebase Integration**: Utilizes Firebase for user authentication, real-time data storage, and file handling.

## Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase (Firestore, Authentication, Storage)
- **AI Model**: Google Cloud for generating quiz questions from PDF documents.
  
## Getting Started

### Prerequisites

Before you can build and run QuizAI, make sure you have the following:

- **Flutter SDK**: [Download here](https://flutter.dev/docs/get-started/install)
- **Firebase Account**: [Create Firebase project](https://console.firebase.google.com/)
- **Google Cloud Account**: Set up Google Cloud to host the AI model for quiz generation.

### Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/ashutosh7034/QuizAI.git
    ```

2. **Navigate to the project directory**:

    ```bash
    cd QuizAI
    ```

3. **Install dependencies**:

    ```bash
    flutter pub get
    ```

4. **Configure Firebase**:
   - Add your Firebase configuration files (`google-services.json` for Android and `GoogleService-Info.plist` for iOS).
   - Ensure Firestore, Authentication, and Storage are enabled in your Firebase project.
   
5. **Run the app**:

    ```bash
    flutter run
    ```

### Firebase Setup

1. **Firestore**: Structure your Firestore database to store quizzes, users, and results.
2. **Authentication**: Enable Google Sign-In and Email/Password authentication in Firebase.
3. **Storage**: Use Firebase Storage to handle PDF uploads from which quizzes will be generated.

### Google Cloud Setup

1. Set up an AI model in Google Cloud to process uploaded PDFs and generate quiz questions.
2. Integrate the model with your Flutter app by calling Google Cloud functions.


GitHub: QuizAI Repository
Email: ashutosh3276s16@gmail.com
