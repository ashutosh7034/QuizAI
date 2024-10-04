import 'dart:async'; // Import Timer class
import 'dart:math';
import 'package:flutter/material.dart';
import 'quiz_analysis.dart'; // Import the analysis screen

class DartQuizScreen extends StatefulWidget {
  @override
  _DartQuizScreenState createState() => _DartQuizScreenState();
}

class _DartQuizScreenState extends State<DartQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the output of print("Dart" + " is awesome!")?',
      'options': ['Dart is awesome!', 'Error', 'Dart + is awesome!', 'None'],
      'answer': 'Dart is awesome!',
    },
    {
      "question": "What is the output of print(\"Dart is great\".split(\" \"))?",
      "options": ["[Dart, is, great]", "[Dart is, great]", "Error", "None"],
      "answer": "[Dart, is, great]"
    },
    {
      'question': 'What type of programming language is Dart?',
      'options': ['Dynamically typed', 'Statically typed', 'Both', 'None'],
      'answer': 'Both',
    },
    {
      'question':
      'Which of the following is used to declare a variable in Dart?',
      'options': ['var', 'let', 'const', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the correct way to define a function in Dart?',
      'options': [
        'void myFunction() {}',
        'def myFunction() {}',
        'function myFunction() {}',
        'None'
      ],
      'answer': 'void myFunction() {}',
    },
    {
      'question': 'How do you create a constant variable in Dart?',
      'options': ['const x = 10;', 'final x = 10;', 'var x = 10;', 'None'],
      'answer': 'const x = 10;',
    },
    {
      'question': 'What does the async keyword do in Dart?',
      'options': [
        'Makes a function synchronous',
        'Makes a function asynchronous',
        'None',
        'All of the above'
      ],
      'answer': 'Makes a function asynchronous',
    },
    {
      'question': 'What is the output of print(10.isEven)?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'true',
    },
    {
      'question': 'What is the purpose of the main() function in Dart?',
      'options': [
        'To declare a class',
        'To start execution of the program',
        'To create a variable',
        'None'
      ],
      'answer': 'To start execution of the program',
    },
    {
      'question': 'What is the use of the List class in Dart?',
      'options': [
        'To create an array',
        'To create a map',
        'To create a set',
        'None'
      ],
      'answer': 'To create an array',
    },
    {
      'question': 'What is a mixin in Dart?',
      'options': [
        'A way to reuse a class\'s code',
        'A type of inheritance',
        'None',
        'All of the above'
      ],
      'answer': 'A way to reuse a class\'s code',
    },
    {
      "question": "What is the output of print(\"Dart\" + \" is awesome!\")?",
      "options": ["Dart is awesome!", "Error", "Dart + is awesome!", "None"],
      "answer": "Dart is awesome!"
    },
    {
      "question": "What type of programming language is Dart?",
      "options": ["Dynamically typed", "Statically typed", "Both", "None"],
      "answer": "Both"
    },
    {
      "question":
      "Which of the following is used to declare a variable in Dart?",
      "options": ["var", "let", "const", "All of the above"],
      "answer": "All of the above"
    },
    {
      "question": "What is the correct way to define a function in Dart?",
      "options": [
        "void myFunction() {}",
        "def myFunction() {}",
        "function myFunction() {}",
        "None"
      ],
      "answer": "void myFunction() {}"
    },
    {
      "question": "How do you create a constant variable in Dart?",
      "options": ["const x = 10;", "final x = 10;", "var x = 10;", "None"],
      "answer": "const x = 10;"
    },
    {
      "question": "What does the async keyword do in Dart?",
      "options": [
        "Makes a function synchronous",
        "Makes a function asynchronous",
        "None",
        "All of the above"
      ],
      "answer": "Makes a function asynchronous"
    },
    {
      "question": "What is the output of print(10.isEven)?",
      "options": ["true", "false", "Error", "None"],
      "answer": "true"
    },
    {
      "question": "What is the purpose of the main() function in Dart?",
      "options": [
        "To declare a class",
        "To start execution of the program",
        "To create a variable",
        "None"
      ],
      "answer": "To start execution of the program"
    },
    {
      "question": "What is the use of the List class in Dart?",
      "options": [
        "To create an array",
        "To create a map",
        "To create a set",
        "None"
      ],
      "answer": "To create an array"
    },
    {
      "question": "What is a mixin in Dart?",
      "options": [
        "A way to reuse a class's code",
        "A type of inheritance",
        "None",
        "All of the above"
      ],
      "answer": "A way to reuse a class's code"
    },
    {
      "question": "What is the output of print([1, 2, 3].length)?",
      "options": ["3", "2", "Error", "None"],
      "answer": "3"
    },
    {
      "question": "Which keyword is used to define a class in Dart?",
      "options": ["class", "def", "function", "object"],
      "answer": "class"
    },
    {
      "question": "What is the output of print(5 + 3 * 2)?",
      "options": ["16", "11", "10", "None"],
      "answer": "11"
    },
    {
      "question": "What is a Future in Dart?",
      "options": [
        "An object that represents a potential value or error",
        "A synchronous operation",
        "A type of variable",
        "None"
      ],
      "answer": "An object that represents a potential value or error"
    },
    {
      "question": "How do you define a nullable variable in Dart?",
      "options": ["int? x;", "int! x;", "int x;", "None"],
      "answer": "int? x;"
    },
    {
      "question":
      "What is the output of print(\"Hello, World!\".substring(0, 5))?",
      "options": ["Hello", "Hello,", "Error", "None"],
      "answer": "Hello"
    },
    {
      "question": "What does the await keyword do in Dart?",
      "options": [
        "Makes a function synchronous",
        "Pauses execution until a Future completes",
        "None",
        "All of the above"
      ],
      "answer": "Pauses execution until a Future completes"
    },
    {
      "question": "What is the purpose of the final keyword?",
      "options": [
        "To declare a constant variable",
        "To declare a variable that can only be assigned once",
        "Both a and b",
        "None"
      ],
      "answer": "Both a and b"
    },
    {
      "question": "Which of the following is used to create a set in Dart?",
      "options": ["Set<int>()", "Set<int>[]", "new Set<int>()", "None"],
      "answer": "Set<int>()"
    },
    {
      "question": "What is the output of print(null ?? 'default')?",
      "options": ["null", "default", "Error", "None"],
      "answer": "default"
    },
    {
      "question": "What does the keyword required indicate in Dart?",
      "options": [
        "A parameter must be provided",
        "A variable is optional",
        "A function is private",
        "None"
      ],
      "answer": "A parameter must be provided"
    },
    {
      "question": "How do you define a named parameter in Dart?",
      "options": [
        "void myFunction({int x}) {}",
        "void myFunction(int x) {}",
        "void myFunction([int x]) {}",
        "None"
      ],
      "answer": "void myFunction({int x}) {}"
    },
    {
      "question": "What is the output of print(3 ~/ 2)?",
      "options": ["1", "1.5", "Error", "None"],
      "answer": "1"
    },
    {
      "question": "What is the purpose of the super keyword?",
      "options": [
        "To call a method from a superclass",
        "To create a new class",
        "None",
        "All of the above"
      ],
      "answer": "To call a method from a superclass"
    },
    {
      "question": "What is the use of the @override annotation?",
      "options": [
        "To indicate a method overrides a superclass method",
        "To create an interface",
        "None",
        "All of the above"
      ],
      "answer": "To indicate a method overrides a superclass method"
    },
    {
      "question": "What does the keyword static indicate?",
      "options": [
        "A method or variable belongs to the class itself",
        "A variable is constant",
        "None",
        "All of the above"
      ],
      "answer": "A method or variable belongs to the class itself"
    },
    {
      "question": "Which of the following is not a collection in Dart?",
      "options": ["List", "Map", "Set", "Array"],
      "answer": "Array"
    },
    {
      "question": "What is the output of print(\"5\".runtimeType)?",
      "options": ["String", "int", "Error", "None"],
      "answer": "String"
    },
    {
      "question": "What is a factory constructor in Dart?",
      "options": [
        "A constructor that can return an instance of a subclass",
        "A constructor that creates a new instance",
        "None",
        "All of the above"
      ],
      "answer": "A constructor that can return an instance of a subclass"
    },
    {
      "question": "How do you create a list in Dart?",
      "options": [
        "var list = [1, 2, 3];",
        "var list = new List();",
        "Both a and b",
        "None"
      ],
      "answer": "Both a and b"
    },
    {
      "question": "What does the keyword async* indicate?",
      "options": [
        "A function that returns a Stream",
        "A synchronous function",
        "None",
        "All of the above"
      ],
      "answer": "A function that returns a Stream"
    },
    {
      "question": "What is the purpose of the Iterable class in Dart?",
      "options": [
        "To create a collection of items",
        "To create a list",
        "To create a map",
        "None"
      ],
      "answer": "To create a collection of items"
    },
    {
      "question": "What is the output of print(\"Hello\".toUpperCase())?",
      "options": ["HELLO", "Hello", "Error", "None"],
      "answer": "HELLO"
    },
    {
      "question": "What does the keyword async mean in Dart?",
      "options": [
        "To execute code asynchronously",
        "To execute code synchronously",
        "None",
        "All of the above"
      ],
      "answer": "To execute code asynchronously"
    },
    {
      "question": "What is a Stream in Dart?",
      "options": [
        "A sequence of asynchronous events",
        "A synchronous operation",
        "None",
        "All of the above"
      ],
      "answer": "A sequence of asynchronous events"
    },
    {
      "question": "What is the output of print(3 * 3 - 4)?",
      "options": ["5", "6", "Error", "None"],
      "answer": "5"
    },
    {
      "question": "How do you create a dynamic variable in Dart?",
      "options": ["dynamic x;", "var x;", "Both a and b", "None"],
      "answer": "Both a and b"
    },
    {
      "question": "What is the output of print(2 == 2)?",
      "options": ["true", "false", "Error", "None"],
      "answer": "true"
    },
    {
      "question": "What is the purpose of the Map class in Dart?",
      "options": [
        "To create key-value pairs",
        "To create an array",
        "To create a set",
        "None"
      ],
      "answer": "To create key-value pairs"
    },
    {
      "question": "What is the output of print('Dart' == 'dart')?",
      "options": ["true", "false", "Error", "None"],
      "answer": "false"
    },
    {
      "question": "What is the output of print(10 % 3)?",
      "options": ["1", "3", "2", "None"],
      "answer": "1"
    },
    {
      "question": "What is the purpose of the StringBuffer class in Dart?",
      "options": [
        "To create a mutable string",
        "To create a map",
        "To create a list",
        "None"
      ],
      "answer": "To create a mutable string"
    },
    {
      "question": "What does the keyword covariant indicate?",
      "options": [
        "A parameter can be a subtype",
        "A parameter must be a specific type",
        "None",
        "All of the above"
      ],
      "answer": "A parameter can be a subtype"
    },
    {
      "question": "What is the output of print(5 > 3 && 2 < 4)?",
      "options": ["true", "false", "Error", "None"],
      "answer": "true"
    },
    {
      "question": "What is a Dart package?",
      "options": [
        "A reusable library of code",
        "A function",
        "None",
        "All of the above"
      ],
      "answer": "A reusable library of code"
    },
    {
      "question": "How do you define an extension in Dart?",
      "options": [
        "extension MyExtension on String {}",
        "MyExtension extends String {}",
        "None",
        "All of the above"
      ],
      "answer": "extension MyExtension on String {}"
    },
    {
      "question": "What is the output of print(\"1\".parseInt())?",
      "options": ["1", "Error", "None", "All of the above"],
      "answer": "Error"
    },
    {
      "question": "What does the keyword var indicate in Dart?",
      "options": [
        "A variable of dynamic type",
        "A constant variable",
        "None",
        "All of the above"
      ],
      "answer": "A variable of dynamic type"
    },
    {
      "question": "What is the output of print(\"Dart\".length)?",
      "options": ["4", "5", "Error", "None"],
      "answer": "4"
    },
    {
      "question": "What is the purpose of the Dart SDK?",
      "options": [
        "To provide tools for developing Dart applications",
        "To create a map",
        "None",
        "All of the above"
      ],
      "answer": "To provide tools for developing Dart applications"
    },
    {
      "question": "What is the output of print(5 == 5.0)?",
      "options": ["true", "false", "Error", "None"],
      "answer": "true"
    },
    {
      "question": "How do you handle exceptions in Dart?",
      "options": ["try-catch blocks", "throw", "catch", "None"],
      "answer": "try-catch blocks"
    },
    {
      "question": "What does the keyword throw indicate?",
      "options": [
        "To throw an exception",
        "To return a value",
        "None",
        "All of the above"
      ],
      "answer": "To throw an exception"
    },
    {
      "question": "What is the output of print(3.14.floor())?",
      "options": ["3", "4", "Error", "None"],
      "answer": "3"
    },
    {
      "question": "What is the purpose of the setState() method in Flutter?",
      "options": [
        "To update the UI",
        "To create a variable",
        "None",
        "All of the above"
      ],
      "answer": "To update the UI"
    },
    {
      "question": "What does the keyword get indicate in Dart?",
      "options": [
        "A property that can be read",
        "A property that can be written",
        "None",
        "All of the above"
      ],
      "answer": "A property that can be read"
    },
    {
      "question": "What is the output of print([1, 2, 3].reversed.toList())?",
      "options": ["[3, 2, 1]", "[1, 2, 3]", "Error", "None"],
      "answer": "[3, 2, 1]"
    },
    {
      "question": "What is the purpose of the toString() method?",
      "options": [
        "To convert an object to a string",
        "To create a variable",
        "None",
        "All of the above"
      ],
      "answer": "To convert an object to a string"
    },
    {
      "question": "What is the output of print(\"Hello\".contains(\"e\"))?",
      "options": ["true", "false", "Error", "None"],
      "answer": "true"
    },
    {
      "question": "What does the keyword set indicate in Dart?",
      "options": [
        "A property that can be written",
        "A property that can be read",
        "None",
        "All of the above"
      ],
      "answer": "A property that can be written"
    },
    {
      "question": "What is the output of print([1, 2, 3].first)?",
      "options": ["1", "3", "Error", "None"],
      "answer": "1"
    },
    {
      "question": "What is the purpose of the mainAxisAlignment property?",
      "options": [
        "To align children in a Row or Column",
        "To create a variable",
        "None",
        "All of the above"
      ],
      "answer": "To align children in a Row or Column"
    },
    {
      "question": "What is the output of print(\"2\".codeUnitAt(0))?",
      "options": ["50", "2", "Error", "None"],
      "answer": "50"
    },
    {
      "question": "What does the keyword late indicate in Dart?",
      "options": [
        "A variable will be initialized later",
        "A constant variable",
        "None",
        "All of the above"
      ],
      "answer": "A variable will be initialized later"
    },
    {
      "question": "What is the output of print(\"Hello\".split(\"l\"))?",
      "options": ["[He, lo]", "[Hell, o]", "Error", "None"],
      "answer": "[He, lo]"
    },
    {
      "question":
      "What is the purpose of the GestureDetector widget in Flutter?",
      "options": [
        "To detect gestures",
        "To create a variable",
        "None",
        "All of the above"
      ],
      "answer": "To detect gestures"
    },
    {
      "question": "What is the output of print((5 > 3) ? 'Yes' : 'No')?",
      "options": ["Yes", "No", "Error", "None"],
      "answer": "Yes"
    },
    {
      "question": "How do you define an abstract class in Dart?",
      "options": [
        "abstract class MyClass {}",
        "class MyClass {}",
        "None",
        "All of the above"
      ],
      "answer": "abstract class MyClass {}"
    },
    {
      "question": "What is the output of print(\"Dart\".endsWith(\"t\"))?",
      "options": ["true", "false", "Error", "None"],
      "answer": "false"
    },
    {
      "question":
      "What is the purpose of the StatelessWidget class in Flutter?",
      "options": [
        "To create a widget that does not change",
        "To create a variable",
        "None",
        "All of the above"
      ],
      "answer": "To create a widget that does not change"
    },
    {
      "question": "What is the output of print(5.isOdd)?",
      "options": ["true", "false", "Error", "None"],
      "answer": "true"
    },
    {
      "question": "How do you declare a variable in Dart?",
      "options": ["var x;", "int x;", "Both a and b", "None"],
      "answer": "Both a and b"
    },
    {
      "question": "What does the keyword dynamic indicate in Dart?",
      "options": [
        "A variable that can hold any type",
        "A constant variable",
        "None",
        "All of the above"
      ],
      "answer": "A variable that can hold any type"
    },
  ];

  List<Map<String, dynamic>> selectedQuestions = [];
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];
  int totalQuestions = 0;
  Timer? _timer;
  int _timeLeft = 5; // Time limit for each question
  bool _answered = false; // Track if the current question is answered

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Quiz', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: totalQuestions == 0 ? _buildQuestionInput() : _buildQuiz(),
        ),
      ),
    );
  }

  Widget _buildQuestionInput() {
    final TextEditingController questionCountController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Enter the number of questions you want to practice:',
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: questionCountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.3),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Number of Questions',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            int? count = int.tryParse(questionCountController.text);
            if (count != null && count > 0) {
              setState(() {
                totalQuestions = count > questions.length ? questions.length : count;
                selectedQuestions = _getRandomQuestions(totalQuestions);
                selectedAnswers = List.filled(totalQuestions, '');
                currentQuestionIndex = 0;
                _answered = false;
                _startTimer();
              });
            }
          },
          child: const Text('Start Quiz', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  Widget _buildQuiz() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: MediaQuery.of(context).size.height, // Ensures full height
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.withOpacity(0.7), Colors.purpleAccent.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView( // Scrollable content
          child: Column(
            key: ValueKey<int>(currentQuestionIndex),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Question ${currentQuestionIndex + 1} of $totalQuestions',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                selectedQuestions[currentQuestionIndex]['question'],
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Time Left: $_timeLeft seconds',
                style: TextStyle(fontSize: 18, color: Colors.redAccent),
              ),
              const SizedBox(height: 20),
              Column( // Options in a Column for better scrolling
                mainAxisAlignment: MainAxisAlignment.center,
                children: selectedQuestions[currentQuestionIndex]['options']
                    .map<Widget>((option) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.purpleAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      ),
                      onPressed: _answered ? null : () => selectAnswer(option),
                      child: Text(option, style: const TextStyle(fontSize: 18)),
                    ),
                  );
                }).toList(),
              ),
              if (_answered)
                ElevatedButton(
                  onPressed: moveToNextQuestion,
                  child: const Text('Next', style: TextStyle(fontSize: 18)),
                ),
            ],
          ),
        ),
      ),
    );
  }


  void _startTimer() {
    _timeLeft = 5;
    _answered = false;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer?.cancel();
          moveToNextQuestion();
        }
      });
    });
  }

  void moveToNextQuestion() {
    if (currentQuestionIndex < selectedQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        _answered = false;
      });
      _startTimer();
    } else {
      _showResultDialog();
    }
  }

  List<Map<String, dynamic>> _getRandomQuestions(int count) {
    final random = Random();
    List<Map<String, dynamic>> shuffledQuestions = List.from(questions)..shuffle(random);
    return shuffledQuestions.take(count).toList();
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;
      _answered = true;
      _timer?.cancel();
    });
  }

  void _showResultDialog() {
    int score = 0;
    for (int i = 0; i < selectedQuestions.length; i++) {
      if (selectedAnswers[i] == selectedQuestions[i]['answer']) {
        score++;
      }
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuizAnalysisScreen(
          score: score,
          totalQuestions: totalQuestions,
          selectedQuestions: selectedQuestions,
          selectedAnswers: selectedAnswers,
        ),
      ),
    );
  }
}
