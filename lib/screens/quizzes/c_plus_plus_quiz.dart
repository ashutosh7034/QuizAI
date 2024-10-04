import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'quiz_analysis.dart'; // Import the analysis screen

class CPlusPlusQuizScreen extends StatefulWidget {
  @override
  _CPlusPlusQuizScreenState createState() => _CPlusPlusQuizScreenState();
}

class _CPlusPlusQuizScreenState extends State<CPlusPlusQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the output of cout << "Hello World";?',
      'options': ['Hello World', 'cout Hello World', 'Error', 'None'],
      'answer': 'Hello World',
    },
    {
      'question': 'What is the correct way to define a class in C++?',
      'options': [
        'class MyClass {}',
        'MyClass class {}',
        'class MyClass()',
        'None'
      ],
      'answer': 'class MyClass {}',
    },
    {
      'question': 'What is the purpose of the #include directive?',
      'options': [
        'To include libraries',
        'To define classes',
        'To create functions',
        'None'
      ],
      'answer': 'To include libraries',
    },
    {
      'question': 'What is the correct syntax to declare a pointer in C++?',
      'options': ['int* p', 'int p*', '*int p', 'None'],
      'answer': 'int* p',
    },
    {
      'question': 'What is the output of 5 % 2?',
      'options': ['2', '1', '0', '5'],
      'answer': '1',
    },
    {
      'question': 'What is a constructor?',
      'options': [
        'A method called when an object is created',
        'A method to destroy an object',
        'None',
        'All of the above'
      ],
      'answer': 'A method called when an object is created',
    },
    {
      'question': 'What is the purpose of the virtual keyword?',
      'options': [
        'To declare a virtual function',
        'To create a pointer',
        'To create a reference',
        'None'
      ],
      'answer': 'To declare a virtual function',
    },
    {
      'question': 'What is encapsulation?',
      'options': [
        'Hiding data',
        'Inheriting properties',
        'Creating interfaces',
        'None'
      ],
      'answer': 'Hiding data',
    },
    {
      'question': 'What is inheritance?',
      'options': [
        'Deriving new classes from existing ones',
        'Creating new classes',
        'None',
        'All of the above'
      ],
      'answer': 'Deriving new classes from existing ones',
    },
    {
      'question': 'What is a destructor?',
      'options': [
        'A method called when an object is destroyed',
        'A method to create an object',
        'None',
        'All of the above'
      ],
      'answer': 'A method called when an object is destroyed',
    },
    {
      "question": "What does C++ stand for?",
      "options": ["C with Classes", "C Plus Plus", "C++ Programming", "C Plus"],
      "answer": "C Plus Plus"
    },
    {
      "question":
      "Which of the following is the correct syntax to declare a variable in C++?",
      "options": ["int x;", "int x = 10;", "Both a and b", "None"],
      "answer": "Both a and b"
    },
    {
      "question": "Which of the following is not a basic data type in C++?",
      "options": ["int", "float", "double", "string"],
      "answer": "string"
    },
    {
      "question":
      "What is the output of the following code: cout << 5 + 2 * 3 ?",
      "options": ["11", "16", "21", "None"],
      "answer": "11"
    },
    {
      "question": "Which keyword is used to define a function in C++?",
      "options": ["function", "def", "void", "method"],
      "answer": "void"
    },
    {
      "question": "What is the size of an int variable in C++?",
      "options": ["2 bytes", "4 bytes", "8 bytes", "Depends on the system"],
      "answer": "Depends on the system"
    },
    {
      "question": "What is a pointer in C++?",
      "options": [
        "A variable that holds a memory address",
        "A data type",
        "None",
        "All of the above"
      ],
      "answer": "A variable that holds a memory address"
    },
    {
      "question": "Which operator is used for incrementing a variable in C++?",
      "options": ["++", "--", "+", "="],
      "answer": "++"
    },
    {
      "question": "What is the correct syntax for a for loop in C++?",
      "options": [
        "for(int i = 0; i < 10; i++) {}",
        "for(i = 0; i < 10; i++) {}",
        "for(int i = 0; i < 10) {}",
        "None"
      ],
      "answer": "for(int i = 0; i < 10; i++) {}"
    },
    {
      "question":
      "Which of the following is used to include standard libraries in C++?",
      "options": [
        "#include <iostream>",
        "#include <library>",
        "#include <stdio>",
        "None"
      ],
      "answer": "#include <iostream>"
    },
    {
      "question": "What is the purpose of the 'new' keyword in C++?",
      "options": [
        "To create an object dynamically",
        "To delete an object",
        "To define a variable",
        "None"
      ],
      "answer": "To create an object dynamically"
    },
    {
      "question":
      "What is the output of the following code: cout << (10 > 5) ? 'True' : 'False';?",
      "options": ["True", "False", "Error", "None"],
      "answer": "True"
    },
    {
      "question":
      "What is the default access modifier for members of a class in C++?",
      "options": ["public", "private", "protected", "None"],
      "answer": "private"
    },
    {
      "question": "Which of the following is a standard input stream in C++?",
      "options": ["cin", "cout", "cerr", "All of the above"],
      "answer": "All of the above"
    },
    {
      "question": "What is the use of the 'delete' keyword in C++?",
      "options": [
        "To delete a variable",
        "To free up memory",
        "None",
        "All of the above"
      ],
      "answer": "To free up memory"
    },
    {
      "question": "What is a constructor in C++?",
      "options": [
        "A special function to initialize objects",
        "A function to delete objects",
        "None",
        "All of the above"
      ],
      "answer": "A special function to initialize objects"
    },
    {
      "question":
      "Which of the following is an example of a unary operator in C++?",
      "options": ["++", "+", "*", "None"],
      "answer": "++"
    },
    {
      "question": "What does 'void' signify in a function declaration?",
      "options": [
        "No return type",
        "Integer return type",
        "String return type",
        "None"
      ],
      "answer": "No return type"
    },
    {
      "question": "What is the main function in C++?",
      "options": [
        "The entry point of a program",
        "A user-defined function",
        "None",
        "All of the above"
      ],
      "answer": "The entry point of a program"
    },
    {
      "question": "What is the purpose of the 'return' statement in C++?",
      "options": [
        "To exit a function",
        "To return a value",
        "None",
        "All of the above"
      ],
      "answer": "All of the above"
    },
    {
      "question": "Which of the following is a valid comment in C++?",
      "options": [
        "// Comment",
        "/* Comment */",
        "// Comment /*",
        "Both a and b"
      ],
      "answer": "Both a and b"
    },
    {
      "question": "What is the output of the following code: cout << 10 / 3;?",
      "options": ["3", "3.33", "Error", "None"],
      "answer": "3"
    },
    {
      "question": "Which of the following is not an OOP concept?",
      "options": [
        "Inheritance",
        "Encapsulation",
        "Polymorphism",
        "Compilation"
      ],
      "answer": "Compilation"
    },
    {
      "question": "What is an abstract class in C++?",
      "options": [
        "A class that cannot be instantiated",
        "A class with only pure virtual functions",
        "None",
        "All of the above"
      ],
      "answer": "All of the above"
    },
    {
      "question": "What does the 'this' pointer refer to in C++?",
      "options": [
        "The current object",
        "The previous object",
        "None",
        "All of the above"
      ],
      "answer": "The current object"
    },
    {
      "question": "What is the purpose of a destructor in C++?",
      "options": [
        "To clean up resources",
        "To create an object",
        "None",
        "All of the above"
      ],
      "answer": "To clean up resources"
    },
    {
      "question":
      "Which of the following is the correct way to define a constant in C++?",
      "options": [
        "const int x = 10;",
        "define x 10",
        "constant int x = 10;",
        "None"
      ],
      "answer": "const int x = 10;"
    },
    {
      "question": "What does 'static' keyword signify in C++?",
      "options": [
        "Variable retains its value between function calls",
        "Variable is limited to the file scope",
        "Both a and b",
        "None"
      ],
      "answer": "Both a and b"
    },
    {
      "question":
      "What is the output of the following code: cout << 5 * 2 + 10 / 2;?",
      "options": ["20", "15", "25", "None"],
      "answer": "20"
    },
    {
      "question":
      "Which operator is used for accessing members of a structure in C++?",
      "options": ["->", ".", "*", "None"],
      "answer": "."
    },
    {
      "question": "What is the purpose of 'friend' class in C++?",
      "options": [
        "To access private members of another class",
        "To declare a subclass",
        "None",
        "All of the above"
      ],
      "answer": "To access private members of another class"
    },
    {
      "question": "Which of the following is not a feature of C++?",
      "options": [
        "Object-oriented programming",
        "Rich library support",
        "Multi-threading",
        "None"
      ],
      "answer": "None"
    },
    {
      "question":
      "What is the output of the following code: cout << (1 == 1) && (2 == 2);?",
      "options": ["true", "false", "Error", "None"],
      "answer": "true"
    },
    {
      "question": "What does 'virtual' keyword indicate in C++?",
      "options": [
        "A function can be overridden",
        "A function cannot be overridden",
        "None",
        "All of the above"
      ],
      "answer": "A function can be overridden"
    },
    {
      "question": "What is a template in C++?",
      "options": [
        "A blueprint for creating classes or functions",
        "A predefined function",
        "None",
        "All of the above"
      ],
      "answer": "A blueprint for creating classes or functions"
    },
    {
      "question": "What is the output of the following code: cout << 5 << 10;?",
      "options": ["510", "15", "Error", "None"],
      "answer": "510"
    },
    {
      "question":
      "Which of the following is a valid way to initialize a pointer?",
      "options": [
        "int *ptr = &x;",
        "int *ptr = x;",
        "None",
        "All of the above"
      ],
      "answer": "int *ptr = &x;"
    },
    {
      "question": "What does 'sizeof' operator do in C++?",
      "options": [
        "Returns the size of a data type",
        "Returns the size of an object",
        "Both a and b",
        "None"
      ],
      "answer": "Both a and b"
    },
    {
      "question": "Which of the following statements is true about C++?",
      "options": [
        "C++ is a low-level language",
        "C++ supports multiple inheritance",
        "C++ does not support OOP",
        "None"
      ],
      "answer": "C++ supports multiple inheritance"
    },
    {
      "question": "What is a namespace in C++?",
      "options": [
        "A container for identifiers",
        "A way to avoid name collisions",
        "Both a and b",
        "None"
      ],
      "answer": "Both a and b"
    },
    {
      "question": "Which of the following is not a valid identifier in C++?",
      "options": ["_myVar", "myVar2", "2myVar", "myVar"],
      "answer": "2myVar"
    },
    {
      "question": "What is the purpose of 'static_cast' in C++?",
      "options": [
        "To cast types safely",
        "To convert data types",
        "None",
        "All of the above"
      ],
      "answer": "To cast types safely"
    },
    {
      "question": "What does the 'protected' access specifier do?",
      "options": [
        "Allows access to derived classes",
        "Allows access to all classes",
        "None",
        "All of the above"
      ],
      "answer": "Allows access to derived classes"
    },
    {
      "question": "What is the function of 'getline' in C++?",
      "options": [
        "To read a string",
        "To read a character",
        "To read a line",
        "None"
      ],
      "answer": "To read a line"
    },
    {
      "question": "What is an example of a data structure in C++?",
      "options": ["Array", "Linked List", "Stack", "All of the above"],
      "answer": "All of the above"
    },
    {
      "question":
      "What is the output of the following code: cout << 2 + 3 * 4;?",
      "options": ["14", "20", "12", "None"],
      "answer": "14"
    },
    {
      "question": "What does 'const' keyword signify in C++?",
      "options": [
        "Constant value",
        "Variable value",
        "None",
        "All of the above"
      ],
      "answer": "Constant value"
    },
    {
      "question": "What is a virtual destructor in C++?",
      "options": [
        "Destructor that can be overridden",
        "Destructor that cannot be overridden",
        "None",
        "All of the above"
      ],
      "answer": "Destructor that can be overridden"
    },
    {
      "question": "Which of the following is used to handle exceptions in C++?",
      "options": [
        "try-catch block",
        "if-else block",
        "switch-case block",
        "None"
      ],
      "answer": "try-catch block"
    },
    {
      "question": "What does 'std' refer to in C++?",
      "options": [
        "Standard namespace",
        "Standard data type",
        "None",
        "All of the above"
      ],
      "answer": "Standard namespace"
    },
    {
      "question": "Which of the following is a built-in function in C++?",
      "options": ["strlen()", "scanf()", "printf()", "All of the above"],
      "answer": "All of the above"
    },
    {
      "question": "What is the purpose of a copy constructor in C++?",
      "options": [
        "To create a copy of an object",
        "To initialize an object",
        "None",
        "All of the above"
      ],
      "answer": "To create a copy of an object"
    },
    {
      "question": "What is a lambda expression in C++?",
      "options": [
        "An anonymous function",
        "A type of variable",
        "None",
        "All of the above"
      ],
      "answer": "An anonymous function"
    },
    {
      "question": "Which of the following is a C++ standard library?",
      "options": ["<iostream>", "<string>", "<vector>", "All of the above"],
      "answer": "All of the above"
    },
    {
      "question": "What is the purpose of 'assert' in C++?",
      "options": [
        "To check for errors",
        "To validate input",
        "None",
        "All of the above"
      ],
      "answer": "To check for errors"
    },
    {
      "question": "What is the output of the following code: cout << 10 % 3;?",
      "options": ["3", "1", "Error", "None"],
      "answer": "1"
    },
    {
      "question": "Which of the following is true about C++?",
      "options": [
        "C++ is platform-independent",
        "C++ is a compiled language",
        "C++ does not support OOP",
        "None"
      ],
      "answer": "C++ is a compiled language"
    },
    {
      "question": "What is the role of 'main()' function?",
      "options": [
        "Entry point of a program",
        "To define a class",
        "None",
        "All of the above"
      ],
      "answer": "Entry point of a program"
    },
    {
      "question": "What is the use of 'std::endl' in C++?",
      "options": [
        "To insert a newline",
        "To flush the output buffer",
        "Both a and b",
        "None"
      ],
      "answer": "Both a and b"
    },
    {
      "question": "Which of the following is a looping structure in C++?",
      "options": ["for", "while", "do-while", "All of the above"],
      "answer": "All of the above"
    },
    {
      "question": "What is the output of the following code: cout << 'A' + 1;?",
      "options": ["66", "65", "A1", "None"],
      "answer": "66"
    },
    {
      "question": "What does the 'friend' function do in C++?",
      "options": [
        "Accesses private members of a class",
        "Cannot access private members",
        "None",
        "All of the above"
      ],
      "answer": "Accesses private members of a class"
    },
    {
      "question":
      "Which operator is used for dynamic memory allocation in C++?",
      "options": ["new", "malloc", "calloc", "All of the above"],
      "answer": "new"
    },
    {
      "question":
      "What is the output of the following code: cout << true + 2;?",
      "options": ["3", "2", "1", "None"],
      "answer": "3"
    },
    {
      "question": "Which of the following is a reference type in C++?",
      "options": ["int&", "int*", "int", "None"],
      "answer": "int&"
    },
    {
      "question":
      "What is the output of the following code: cout << 'A' + 'B';?",
      "options": ["131", "AB", "C", "None"],
      "answer": "131"
    },
    {
      "question": "What is the purpose of a pure virtual function in C++?",
      "options": [
        "To make a class abstract",
        "To define an interface",
        "Both a and b",
        "None"
      ],
      "answer": "Both a and b"
    },
    {
      "question": "What is a circular dependency in C++?",
      "options": [
        "Classes depend on each other",
        "Functions depend on each other",
        "None",
        "All of the above"
      ],
      "answer": "Classes depend on each other"
    },
    {
      "question":
      "Which of the following can be used to create a dynamic array in C++?",
      "options": ["new", "malloc", "Both a and b", "None"],
      "answer": "Both a and b"
    },
    {
      "question": "What does 'volatile' keyword indicate in C++?",
      "options": [
        "Variable can be changed unexpectedly",
        "Variable cannot be optimized",
        "None",
        "All of the above"
      ],
      "answer": "All of the above"
    },
    {
      "question": "Which of the following statements is false?",
      "options": [
        "A class can have multiple constructors",
        "A class can have multiple destructors",
        "All members can be private",
        "None"
      ],
      "answer": "A class can have multiple destructors"
    },
    {
      "question": "What does 'nullptr' represent in C++?",
      "options": ["Null pointer", "Void pointer", "Both a and b", "None"],
      "answer": "Null pointer"
    },
    {
      "question": "What is the purpose of 'enum' in C++?",
      "options": [
        "To define a set of named integer constants",
        "To define a class",
        "None",
        "All of the above"
      ],
      "answer": "To define a set of named integer constants"
    },
    {
      "question":
      "What is the output of the following code: cout << (5 > 2) ? 'Yes' : 'No';?",
      "options": ["Yes", "No", "Error", "None"],
      "answer": "Yes"
    },
    {
      "question": "What is an STL in C++?",
      "options": [
        "Standard Template Library",
        "Standard Type Library",
        "None",
        "All of the above"
      ],
      "answer": "Standard Template Library"
    },
    {
      "question": "What is the output of the following code: cout << 10 / 3;?",
      "options": ["3", "3.333", "4", "None"],
      "answer": "3"
    },
    {
      "question": "What does 'static' keyword do in C++?",
      "options": [
        "Preserves variable value between function calls",
        "Creates a local variable",
        "None",
        "All of the above"
      ],
      "answer": "Preserves variable value between function calls"
    },
    {
      "question": "What is the purpose of 'this' pointer in C++?",
      "options": [
        "To refer to the current object",
        "To access base class members",
        "None",
        "All of the above"
      ],
      "answer": "To refer to the current object"
    },
    {
      "question": "Which of the following is not a constructor in C++?",
      "options": [
        "Default constructor",
        "Copy constructor",
        "Destructor",
        "All of the above"
      ],
      "answer": "Destructor"
    },
    {
      "question": "What does 'delete' keyword do in C++?",
      "options": [
        "Deallocates memory",
        "Allocates memory",
        "None",
        "All of the above"
      ],
      "answer": "Deallocates memory"
    },
    {
      "question":
      "What is the output of the following code: cout << (true && false);?",
      "options": ["1", "0", "True", "None"],
      "answer": "0"
    },
    {
      "question": "What does 'reinterpret_cast' do in C++?",
      "options": [
        "Casts any pointer type to any other pointer type",
        "Safely casts types",
        "None",
        "All of the above"
      ],
      "answer": "Casts any pointer type to any other pointer type"
    },
    {
      "question":
      "Which of the following is a C++ standard input/output library?",
      "options": ["<iostream>", "<cstdio>", "<cstdlib>", "All of the above"],
      "answer": "All of the above"
    },
    {
      "question": "What is the purpose of the 'new' operator in C++?",
      "options": [
        "To allocate memory",
        "To deallocate memory",
        "None",
        "All of the above"
      ],
      "answer": "To allocate memory"
    },
    {
      "question":
      "What is the output of the following code: cout << (2 << 2);?",
      "options": ["8", "4", "2", "None"],
      "answer": "8"
    },
    {
      "question": "Which of the following is used to define a class in C++?",
      "options": ["class", "struct", "Both a and b", "None"],
      "answer": "Both a and b"
    },
    {
      "question": "What is a 'static member' in C++?",
      "options": [
        "A member that belongs to the class rather than any object",
        "A member that can be changed",
        "None",
        "All of the above"
      ],
      "answer": "A member that belongs to the class rather than any object"
    },
    {
      "question":
      "What is the output of the following code: cout << (10 == 10);?",
      "options": ["1", "0", "True", "None"],
      "answer": "1"
    },
    {
      "question": "What is the purpose of 'typedef' in C++?",
      "options": [
        "To create an alias for a data type",
        "To define a function",
        "None",
        "All of the above"
      ],
      "answer": "To create an alias for a data type"
    },
    {
      "question":
      "Which of the following is not a member function of a class in C++?",
      "options": [
        "Constructor",
        "Destructor",
        "Friend function",
        "All of the above"
      ],
      "answer": "Friend function"
    },
    {
      "question": "What does 'auto' keyword do in C++?",
      "options": [
        "Automatically deduces type",
        "Specifies type",
        "None",
        "All of the above"
      ],
      "answer": "Automatically deduces type"
    },
    {
      "question": "What is a 'type cast' in C++?",
      "options": [
        "Converting one data type to another",
        "Changing variable name",
        "None",
        "All of the above"
      ],
      "answer": "Converting one data type to another"
    },
    {
      "question":
      "What is the output of the following code: cout << (5 == 5) && (6 == 7);?",
      "options": ["1", "0", "True", "None"],
      "answer": "0"
    },
    {
      "question": "What does the 'volatile' keyword do in C++?",
      "options": [
        "Indicates a variable may change unexpectedly",
        "Prevents optimization",
        "Both a and b",
        "None"
      ],
      "answer": "Both a and b"
    },
    {
      "question": "What is the purpose of 'override' in C++?",
      "options": [
        "To specify a virtual function",
        "To override a base class function",
        "None",
        "All of the above"
      ],
      "answer": "To override a base class function"
    },
    {
      "question":
      "What is the output of the following code: cout << (4 > 2 && 2 < 3);?",
      "options": ["1", "0", "True", "None"],
      "answer": "1"
    },
    {
      "question":
      "Which of the following is a valid way to define an array in C++?",
      "options": [
        "int arr[5];",
        "int arr[] = {1, 2, 3};",
        "Both a and b",
        "None"
      ],
      "answer": "Both a and b"
    },
    {
      "question": "What is a 'function pointer' in C++?",
      "options": [
        "A pointer to a function",
        "A function that returns a pointer",
        "None",
        "All of the above"
      ],
      "answer": "A pointer to a function"
    },
    {
      "question": "What does 'break' statement do in C++?",
      "options": [
        "Exits a loop",
        "Exits a function",
        "None",
        "All of the above"
      ],
      "answer": "Exits a loop"
    },
    {
      "question": "What is the purpose of 'friend' function in C++?",
      "options": [
        "To allow access to private members",
        "To restrict access",
        "None",
        "All of the above"
      ],
      "answer": "To allow access to private members"
    },
    {
      "question": "What is a 'union' in C++?",
      "options": [
        "A data structure that can store different data types",
        "A data structure that can only store one data type at a time",
        "Both a and b",
        "None"
      ],
      "answer": "Both a and b"
    },
    {
      "question":
      "What is the output of the following code: cout << sizeof(char);?",
      "options": ["1", "2", "4", "None"],
      "answer": "1"
    },
    {
      "question": "What does 'dynamic_cast' do in C++?",
      "options": [
        "Safely casts types",
        "Casts any pointer type",
        "None",
        "All of the above"
      ],
      "answer": "Safely casts types"
    },
    {
      "question": "What is a 'stack' in C++?",
      "options": [
        "A data structure that follows LIFO principle",
        "A data structure that follows FIFO principle",
        "None",
        "All of the above"
      ],
      "answer": "A data structure that follows LIFO principle"
    },
    {
      "question": "What does 'delete[]' do in C++?",
      "options": [
        "Deallocates memory for arrays",
        "Deallocates memory for objects",
        "None",
        "All of the above"
      ],
      "answer": "Deallocates memory for arrays"
    },
    {
      "question":
      "What is the output of the following code: cout << (true || false);?",
      "options": ["1", "0", "True", "None"],
      "answer": "1"
    },
    {
      "question": "What is the purpose of 'class' keyword in C++?",
      "options": [
        "To define a class",
        "To create an object",
        "None",
        "All of the above"
      ],
      "answer": "To define a class"
    },
    {
      "question":
      "What is the output of the following code: cout << (0.1 + 0.2 == 0.3);?",
      "options": ["True", "False", "Error", "None"],
      "answer": "False"
    },
    {
      "question": "What is the purpose of 'std::vector' in C++?",
      "options": ["Dynamic array", "Static array", "None", "All of the above"],
      "answer": "Dynamic array"
    },
    {
      "question": "What is a 'constructor initializer list' in C++?",
      "options": [
        "A list used to initialize members of a constructor",
        "A list used to define a function",
        "None",
        "All of the above"
      ],
      "answer": "A list used to initialize members of a constructor"
    },
    {
      "question": "What is the output of the following code: cout << (5 / 2);?",
      "options": ["2", "2.5", "3", "None"],
      "answer": "2"
    },
    {
      "question": "What does 'sizeof' operator do in C++?",
      "options": [
        "Returns the size of a data type",
        "Returns the size of a variable",
        "None",
        "All of the above"
      ],
      "answer": "All of the above"
    },
    {
      "question": "What is a 'pointer to a pointer' in C++?",
      "options": [
        "A pointer that points to another pointer",
        "A pointer that points to a variable",
        "None",
        "All of the above"
      ],
      "answer": "A pointer that points to another pointer"
    },
    {
      "question":
      "What is the output of the following code: cout << (1 << 3);?",
      "options": ["8", "3", "1", "None"],
      "answer": "8"
    },
    {
      "question": "What does 'volatile' keyword do in C++?",
      "options": [
        "Indicates a variable may change unexpectedly",
        "Prevents optimization",
        "Both a and b",
        "None"
      ],
      "answer": "Both a and b"
    },
    {
      "question": "What is a 'reference' in C++?",
      "options": [
        "An alias for another variable",
        "A type of pointer",
        "None",
        "All of the above"
      ],
      "answer": "An alias for another variable"
    },
    {
      "question":
      "What is the output of the following code: cout << (6 / 2 * 3);?",
      "options": ["9", "3", "12", "None"],
      "answer": "9"
    },
    {
      "question": "What is the purpose of 'virtual' keyword in C++?",
      "options": [
        "To create a virtual function",
        "To restrict access",
        "None",
        "All of the above"
      ],
      "answer": "To create a virtual function"
    },
    {
      "question": "What is a 'namespace' in C++?",
      "options": [
        "A declarative region that provides a scope to identifiers",
        "A function",
        "None",
        "All of the above"
      ],
      "answer": "A declarative region that provides a scope to identifiers"
    },
    {
      "question": "What is the output of the following code: cout << (5 < 3);?",
      "options": ["1", "0", "True", "None"],
      "answer": "0"
    },
    {
      "question": "What does 'nullptr' represent in C++?",
      "options": [
        "Null pointer constant",
        "Zero value",
        "None",
        "All of the above"
      ],
      "answer": "Null pointer constant"
    },
    {
      "question": "What is a 'tuple' in C++?",
      "options": [
        "A fixed-size collection of elements",
        "A dynamic collection of elements",
        "None",
        "All of the above"
      ],
      "answer": "A fixed-size collection of elements"
    },
    {
      "question": "What is the output of the following code: cout << (2 + 2);?",
      "options": ["4", "2", "None", "All of the above"],
      "answer": "4"
    },
    {
      "question": "What does 'static_cast' do in C++?",
      "options": [
        "Safely casts types",
        "Casts any pointer type",
        "None",
        "All of the above"
      ],
      "answer": "Safely casts types"
    },
    {
      "question": "What is the purpose of 'template' in C++?",
      "options": [
        "To create generic classes and functions",
        "To define a function",
        "None",
        "All of the above"
      ],
      "answer": "To create generic classes and functions"
    },
    {
      "question":
      "What is the output of the following code: cout << (5.0 / 2);?",
      "options": ["2", "2.5", "3", "None"],
      "answer": "2.5"
    },
    {
      "question": "What does 'using' keyword do in C++?",
      "options": [
        "Brings names from a namespace into scope",
        "Defines a variable",
        "None",
        "All of the above"
      ],
      "answer": "Brings names from a namespace into scope"
    },
    {
      "question": "What is the purpose of 'explicit' keyword in C++?",
      "options": [
        "Prevents implicit conversions",
        "Allows implicit conversions",
        "None",
        "All of the above"
      ],
      "answer": "Prevents implicit conversions"
    },
    {
      "question": "What is a 'const' in C++?",
      "options": [
        "A constant variable",
        "A variable that cannot be modified",
        "None",
        "All of the above"
      ],
      "answer": "A variable that cannot be modified"
    },
    {
      "question":
      "What is the output of the following code: cout << (2 + 3 * 4);?",
      "options": ["14", "20", "26", "None"],
      "answer": "14"
    },
    {
      "question": "What does 'std::unique_ptr' do in C++?",
      "options": [
        "A smart pointer that manages a dynamically allocated object",
        "A regular pointer",
        "None",
        "All of the above"
      ],
      "answer": "A smart pointer that manages a dynamically allocated object"
    },
    {
      "question": "What is a 'dynamic array' in C++?",
      "options": [
        "An array that can change size during runtime",
        "An array that has a fixed size",
        "None",
        "All of the above"
      ],
      "answer": "An array that can change size during runtime"
    },
    {
      "question":
      "What is the output of the following code: cout << (10 % 3);?",
      "options": ["1", "2", "3", "None"],
      "answer": "1"
    },
    {
      "question": "What does 'const_cast' do in C++?",
      "options": [
        "Casts away constness",
        "Safely casts types",
        "None",
        "All of the above"
      ],
      "answer": "Casts away constness"
    },
    {
      "question": "What is the purpose of 'mutable' in C++?",
      "options": [
        "Allows modification of a class member in a const function",
        "Restricts modification of a class member",
        "None",
        "All of the above"
      ],
      "answer": "Allows modification of a class member in a const function"
    },
    {
      "question":
      "What is the output of the following code: cout << (10 / 2 + 3);?",
      "options": ["8", "3", "7", "None"],
      "answer": "8"
    },
    {
      "question": "What does 'static' keyword do in C++?",
      "options": [
        "Preserves variable value between function calls",
        "Creates a local variable",
        "None",
        "All of the above"
      ],
      "answer": "Preserves variable value between function calls"
    },
    {
      "question": "What is the purpose of 'class' keyword in C++?",
      "options": [
        "To define a class",
        "To create an object",
        "None",
        "All of the above"
      ],
      "answer": "To define a class"
    },
    {
      "question": "What is the output of the following code: cout << (1 + 2);?",
      "options": ["1", "2", "3", "None"],
      "answer": "3"
    },
    {
      "question": "What does 'dynamic_cast' do in C++?",
      "options": [
        "Safely casts types",
        "Casts any pointer type",
        "None",
        "All of the above"
      ],
      "answer": "Safely casts types"
    },
    {
      "question": "What is the purpose of 'inline' in C++?",
      "options": [
        "Suggests to the compiler to inline a function",
        "Defines a variable",
        "None",
        "All of the above"
      ],
      "answer": "Suggests to the compiler to inline a function"
    },
    {
      "question":
      "What is the output of the following code: cout << (10 - 5);?",
      "options": ["5", "10", "None", "All of the above"],
      "answer": "5"
    },
    {
      "question": "What is a 'virtual function' in C++?",
      "options": [
        "A member function that can be overridden",
        "A function that cannot be overridden",
        "None",
        "All of the above"
      ],
      "answer": "A member function that can be overridden"
    },
    {
      "question": "What does 'final' keyword do in C++?",
      "options": [
        "Prevents further inheritance",
        "Allows inheritance",
        "None",
        "All of the above"
      ],
      "answer": "Prevents further inheritance"
    },
    {
      "question": "What is the purpose of 'override' in C++?",
      "options": [
        "To specify a virtual function",
        "To override a base class function",
        "None",
        "All of the above"
      ],
      "answer": "To override a base class function"
    },
    {
      "question":
      "What is the output of the following code: cout << (true && true);?",
      "options": ["1", "0", "True", "None"],
      "answer": "1"
    },
    {
      "question": "What does 'constexpr' do in C++?",
      "options": [
        "Specifies that the value is constant and evaluated at compile time",
        "Defines a variable",
        "None",
        "All of the above"
      ],
      "answer":
      "Specifies that the value is constant and evaluated at compile time"
    },
    {
      "question": "What is the purpose of 'friend' keyword in C++?",
      "options": [
        "Grants access to private members of a class",
        "Defines a variable",
        "None",
        "All of the above"
      ],
      "answer": "Grants access to private members of a class"
    },
    {
      "question":
      "What is the output of the following code: cout << (4 != 4);?",
      "options": ["1", "0", "True", "None"],
      "answer": "0"
    },
    {
      "question": "What does 'this' pointer represent in C++?",
      "options": [
        "A pointer to the current object",
        "A regular pointer",
        "None",
        "All of the above"
      ],
      "answer": "A pointer to the current object"
    },
    {
      "question": "What is a 'stack' in C++?",
      "options": [
        "A data structure that follows LIFO",
        "A data structure that follows FIFO",
        "None",
        "All of the above"
      ],
      "answer": "A data structure that follows LIFO"
    },
    {
      "question":
      "What is the output of the following code: cout << (7 == 7);?",
      "options": ["1", "0", "True", "None"],
      "answer": "1"
    },
    {
      "question": "What does 'sizeof(int)' return in C++?",
      "options": ["4", "8", "2", "None"],
      "answer": "4"
    },
    {
      "question": "What is a 'queue' in C++?",
      "options": [
        "A data structure that follows FIFO",
        "A data structure that follows LIFO",
        "None",
        "All of the above"
      ],
      "answer": "A data structure that follows FIFO"
    },
    {
      "question":
      "What is the output of the following code: cout << (true || false);?",
      "options": ["1", "0", "True", "None"],
      "answer": "1"
    },
    {
      "question": "What does 'std::shared_ptr' do in C++?",
      "options": [
        "A smart pointer that shares ownership of a dynamically allocated object",
        "A regular pointer",
        "None",
        "All of the above"
      ],
      "answer":
      "A smart pointer that shares ownership of a dynamically allocated object"
    },
    {
      "question":
      "What is the output of the following code: cout << (1 << 2);?",
      "options": ["2", "3", "4", "None"],
      "answer": "4"
    },
    {
      "question": "What does 'bitset' do in C++?",
      "options": [
        "Represents a sequence of bits",
        "Defines a variable",
        "None",
        "All of the above"
      ],
      "answer": "Represents a sequence of bits"
    },
    {
      "question":
      "What is the output of the following code: cout << (0b1010);?",
      "options": ["10", "2", "None", "All of the above"],
      "answer": "10"
    },
    {
      "question": "What does 'decltype' do in C++?",
      "options": [
        "Deduce the type of an expression",
        "Define a variable",
        "None",
        "All of the above"
      ],
      "answer": "Deduce the type of an expression"
    },

    {
      "question": "What is the purpose of 'volatile' in C++?",
      "options": [
        "Indicates a variable may change unexpectedly",
        "Prevents optimization",
        "None",
        "Both a and b"
      ],
      "answer": "Both a and b"
    }
  ];

  List<Map<String, dynamic>> selectedQuestions = [];
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];
  int totalQuestions = 0;
  Timer? _timer;
  int _timeLeft = 10; // Time limit for each question
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
        title: const Text('C++ Quiz', style: TextStyle(color: Colors.white)),
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
      child: Container( // New Container with a gradient background
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
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
              Column( // Nested Column for options
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed!', style: TextStyle(color: Colors.deepPurple)),
        content: Text('Your score is $score out of $totalQuestions',
            style: const TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            child: const Text('OK', style: TextStyle(color: Colors.deepPurple)),
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
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
            },
          ),
        ],
      ),
    );
  }
}
