import 'dart:async'; // Import Timer class
import 'dart:math';
import 'package:flutter/material.dart';
import '../quizzes/quiz_analysis.dart'; // Import the analysis screen

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
      "question": "What does the keyword dynamic indicate in Dart?",
      "options": [
        "A variable that can hold any type",
        "A constant variable",
        "None",
        "All of the above"
      ],
      "answer": "A variable that can hold any type"
    },
    {
      'question': 'What is the output of `print("Hello, " + "World!");`?',
      'options': ['Hello, World!', 'Error', 'Hello, + World!', 'None'],
      'answer': 'Hello, World!',
    },
    {
      'question': 'What is the data type of `var name = "John";`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'String',
    },
    {
      'question': 'What is the output of `print(5 + 5);`?',
      'options': [10, 25, 'Error', 'None'],
      'answer': 10,
    },
    {
      'question': 'What is the purpose of the `main()` function in Dart?',
      'options': [
        'To define a class',
        'To declare a variable',
        'To start the program execution',
        'To import a library'
      ],
      'answer': 'To start the program execution',
    },
    {
      'question': 'What is the output of `print(true && true);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the output of `print(10 / 2);`?',
      'options': [5, 10, 'Error', 'None'],
      'answer': 5,
    },
    {
      'question': 'What is the data type of `var age = 25;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'int',
    },
    {
      'question': 'What is the output of `print("Dart" + " is awesome!");`?',
      'options': ['Dart is awesome!', 'Error', 'Dart + is awesome!', 'None'],
      'answer': 'Dart is awesome!',
    },
    {
      'question': 'What is the purpose of the `void` keyword in Dart?',
      'options': [
        'To define a function that returns no value',
        'To declare a variable',
        'To start the program execution',
        'To import a library'
      ],
      'answer': 'To define a function that returns no value',
    },
    {
      'question': 'What is the output of `print(5 > 3);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the data type of `var isAdult = true;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'bool',
    },
    {
      'question': 'What is the output of `print("Hello, " * 3);`?',
      'options': [
        'Hello, Hello, Hello, ',
        'Error',
        'Hello, + Hello, + Hello, ',
        'None'
      ],
      'answer': 'Hello, Hello, Hello, ',
    },
    {
      'question': 'What is the purpose of the `import` keyword in Dart?',
      'options': [
        'To define a class',
        'To declare a variable',
        'To start the program execution',
        'To import a library'
      ],
      'answer': 'To import a library',
    },
    {
      'question': 'What is the output of `print(10 % 3);`?',
      'options': [1, 3, 'Error', 'None'],
      'answer': 1,
    },
    {
      'question': 'What is the data type of `var height = 175.5;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'double',
    },
    {
      'question': 'What is the output of `print("Dart" == "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the purpose of the `class` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a class'
      ],
      'answer': 'To define a class',
    },
    {
      'question': 'What is the output of `print(5 < 3);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the data type of `var name = "John Doe";`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'String',
    },
    {
      'question': 'What is the output of `print("Hello, " + "World!" * 2);`?',
      'options': [
        'Hello, World!World!',
        'Error',
        'Hello, + World! + World!',
        'None'
      ],
      'answer': 'Hello, World!World!',
    },
    {
      'question': 'What is the purpose of the `extends` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To inherit from a class'
      ],
      'answer': 'To inherit from a class',
    },
    {
      'question': 'What is the output of `print(10 / 0);`?',
      'options': ['Infinity', 'NaN', 'Error', 'None'],
      'answer': 'Error',
    },
    {
      'question': 'What is the data type of `var score = 90.5;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'double',
    },
    {
      'question': 'What is the output of `print("Dart" != "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the purpose of the `implements` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To implement an interface'
      ],
      'answer': 'To implement an interface',
    },
    {
      'question': 'What is the output of `print(5 >= 3);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the data type of `var isAdmin = false;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'bool',
    },
    {
      'question': 'What is the output of `print("Hello, " * 0);`?',
      'options': ['Hello, ', 'Error', 'Hello, + Hello, + Hello, ', 'None'],
      'answer': 'None',
    },
    {
      'question': 'What is the purpose of the `with` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To use a mixin'
      ],
      'answer': 'To use a mixin',
    },
    {
      'question': 'What is the output of `print(10 % 0);`?',
      'options': ['Infinity', 'NaN', 'Error', 'None'],
      'answer': 'Error',
    },
    {
      'question': 'What is the data type of `var weight = 70.2;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'double',
    },
    {
      'question': 'What is the output of `print("Dart" === "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the purpose of the `abstract` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define an abstract class'
      ],
      'answer': 'To define an abstract class',
    },
    {
      'question': 'What is the output of `print(5 <= 3);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the data type of `var name = "Jane Doe";`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'String',
    },
    {
      'question': 'What is the output of `print("Hello, " + "World!" * 0);`?',
      'options': ['Hello, World!', 'Error', 'Hello, + World! + World!', 'None'],
      'answer': 'Hello, ',
    },
    {
      'question': 'What is the purpose of the `factory` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a factory constructor'
      ],
      'answer': 'To define a factory constructor',
    },
    {
      'question': 'What is the output of `print(10 ~/ 3);`?',
      'options': [3, 10, 'Error', 'None'],
      'answer': 3,
    },
    {
      'question': 'What is the data type of `var score = 85;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'int',
    },
    {
      'question': 'What is the output of `print("Dart" !== "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the purpose of the `static` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a static member'
      ],
      'answer': 'To define a static member',
    },
    {
      'question': 'What is the output of `print(5 == 3);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the data type of `var isAdmin = true;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'bool',
    },
    {
      'question': 'What is the output of `print("Hello, " * 1);`?',
      'options': ['Hello, ', 'Error', 'Hello, + Hello, + Hello, ', 'None'],
      'answer': 'Hello, ',
    },
    {
      'question': 'What is the purpose of the `const` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a compile-time constant'
      ],
      'answer': 'To define a compile-time constant',
    },
    {
      'question': 'What is the output of `print(10 ~/ 0);`?',
      'options': ['Infinity', 'NaN', 'Error', 'None'],
      'answer': 'Error',
    },
    {
      'question': 'What is the data type of `var weight = 65.1;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'double',
    },
    {
      'question': 'What is the output of `print("Dart" > "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the purpose of the `final` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a final variable'
      ],
      'answer': 'To define a final variable',
    },
    {
      'question': 'What is the output of `print(5 < 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the data type of `var name = "Bob Smith";`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'String',
    },
    {
      'question': 'What is the output of `print("Hello, " + "World!" * 1);`?',
      'options': ['Hello, World!', 'Error', 'Hello, + World! + World!', 'None'],
      'answer': 'Hello, World!',
    },
    {
      'question': 'What is the purpose of the `async` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define an asynchronous function'
      ],
      'answer': 'To define an asynchronous function',
    },
    {
      'question': 'What is the output of `print(10 ~/ 2);`?',
      'options': [5, 10, 'Error', 'None'],
      'answer': 5,
    },
    {
      'question': 'What is the data type of `var score = 90;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'int',
    },
    {
      'question': 'What is the output of `print("Dart" <= "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the purpose of the `await` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To wait for the completion of an asynchronous operation'
      ],
      'answer': 'To wait for the completion of an asynchronous operation',
    },
    {
      'question': 'What is the output of `print(5 > 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the data type of `var isAdmin = false;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'bool',
    },
    {
      'question': 'What is the output of `print("Hello, " * 2);`?',
      'options': [
        'Hello, Hello, ',
        'Error',
        'Hello, + Hello, + Hello, ',
        'None'
      ],
      'answer': 'Hello, Hello, ',
    },
    {
      'question': 'What is the purpose of the `yield` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To produce a value in a stream'
      ],
      'answer': 'To produce a value in a stream',
    },
    {
      'question': 'What is the output of `print(10 ~/ 5);`?',
      'options': [2, 10, 'Error', 'None'],
      'answer': 2,
    },
    {
      'question': 'What is the data type of `var weight = 70.5;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'double',
    },
    {
      'question': 'What is the output of `print("Dart" >= "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the purpose of the `library` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a library'
      ],
      'answer': 'To define a library',
    },
    {
      'question': 'What is the output of `print(5 == 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the data type of `var name = "Alice Johnson";`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'String',
    },
    {
      'question': 'What is the output of `print("Hello, " + "World!" * 2);`?',
      'options': [
        'Hello, World!World!',
        'Error',
        'Hello, + World! + World!',
        'None'
      ],
      'answer': 'Hello, World!World!',
    },
    {
      'question': 'What is the purpose of the `part` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To specify a part of a library'
      ],
      'answer': 'To specify a part of a library',
    },
    {
      'question': 'What is the output of `print(10 ~/ 10);`?',
      'options': [1, 10, 'Error', 'None'],
      'answer': 1,
    },
    {
      'question': 'What is the data type of `var score = 95;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'int',
    },
    {
      'question': 'What is the output of `print("Dart" < "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the purpose of the `export` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To export a library'
      ],
      'answer': 'To export a library',
    },
    {
      'question': 'What is the output of `print(5 != 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the data type of `var isAdmin = true;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'bool',
    },
    {
      'question': 'What is the output of `print("Hello, " * 3);`?',
      'options': [
        'Hello, Hello, Hello, ',
        'Error',
        'Hello, + Hello, + Hello, ',
        'None'
      ],
      'answer': 'Hello, Hello, Hello, ',
    },
    {
      'question': 'What is the purpose of the `typedef` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a type alias'
      ],
      ' answer': 'To define a type alias',
    },
    {
      'question': 'What is the output of `print(10 ~/ 1);`?',
      'options': [10, 1, 'Error', 'None'],
      'answer': 10,
    },
    {
      'question': 'What is the data type of `var weight = 60.2;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'double',
    },
    {
      'question': 'What is the output of `print("Dart" == "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the purpose of the `external` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To specify an external function'
      ],
      'answer': 'To specify an external function',
    },
    {
      'question': 'What is the output of `print(5 >= 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the data type of `var name = "Charlie Brown";`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'String',
    },
    {
      'question': 'What is the output of `print("Hello, " + "World!" * 3);`?',
      'options': [
        'Hello, World!World!World!',
        'Error',
        'Hello, + World! + World! + World!',
        'None'
      ],
      'answer': 'Hello, World!World!World!',
    },
    {
      'question': 'What is the purpose of the `mixin` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a mixin'
      ],
      'answer': 'To define a mixin',
    },
    {
      'question': 'What is the output of `print(10 ~/ 0);`?',
      'options': ['Infinity', 'NaN', 'Error', 'None'],
      'answer': 'Error',
    },
    {
      'question': 'What is the data type of `var score = 80;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'int',
    },
    {
      'question': 'What is the output of `print("Dart" != "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the purpose of the `operator` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define an operator'
      ],
      'answer': 'To define an operator',
    },
    {
      'question': 'What is the output of `print(5 <= 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the data type of `var isAdmin = false;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'bool',
    },
    {
      'question': 'What is the output of `print("Hello, " * 4);`?',
      'options': [
        'Hello, Hello, Hello, Hello, ',
        'Error',
        'Hello, + Hello, + Hello, + Hello, ',
        'None'
      ],
      'answer': 'Hello, Hello, Hello, Hello, ',
    },
    {
      'question': 'What is the purpose of the `get` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a getter'
      ],
      'answer': 'To define a getter',
    },
    {
      'question': 'What is the output of `print(10 ~/ 4);`?',
      'options': [2, 10, 'Error', 'None'],
      'answer': 2,
    },
    {
      'question': 'What is the data type of `var weight = 65.5;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'double',
    },
    {
      'question': 'What is the output of `print("Dart" > "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the purpose of the `set` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a setter'
      ],
      'answer': 'To define a setter',
    },
    {
      'question': 'What is the output of `print(5 > 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the data type of `var name = "David Lee";`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'String',
    },
    {
      'question': 'What is the output of `print("Hello, " + "World!" * 4);`?',
      'options': [
        'Hello, World!World!World!World!',
        'Error',
        'Hello, + World! + World! + World! + World!',
        'None'
      ],
      'answer': 'Hello, World!World!World!World!',
    },
    {
      'question': 'What is the purpose of the `covariant` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To specify covariant parameters'
      ],
      'answer': 'To specify covariant parameters',
    },
    {
      'question': 'What is the output of `print(10 ~/ 5);`?',
      'options': [2, 10, 'Error', 'None'],
      'answer': 2,
    },
    {
      'question': 'What is the output of print("Dart" + " is awesome!")?',
      'options': ['Dart is awesome!', 'Error', 'Dart + is awesome!', 'None'],
      'answer': 'Dart is awesome!',
    },
    {
      'question':
          'Which of the following is a valid way to declare a variable in Dart?',
      'options': ['int num;', 'var num = 10;', 'let num;', 'dim num'],
      'answer': 'var num = 10;',
    },
    {
      'question': 'Which keyword is used to create a constant value in Dart?',
      'options': ['const', 'final', 'var', 'static'],
      'answer': 'const',
    },
    {
      'question':
          'What is the output of the following code? \n\nvoid main() { \nvar x = 5; \nprint(++x); \n}',
      'options': ['5', '6', 'Error', '4'],
      'answer': '6',
    },
    {
      'question':
          'Which function is used to convert a string to an integer in Dart?',
      'options': ['int.parse()', 'toInt()', 'parseInt()', 'Integer.parse()'],
      'answer': 'int.parse()',
    },
    {
      'question':
          'In Dart, which keyword is used to create an immutable object?',
      'options': ['final', 'const', 'immutable', 'static'],
      'answer': 'const',
    },
    {
      'question': 'What is the return type of the main function in Dart?',
      'options': ['int', 'void', 'bool', 'String'],
      'answer': 'void',
    },
    {
      'question':
          'What is the output of the following code? \n\nvoid main() { \nint x = 3 ~/ 2; \nprint(x); \n}',
      'options': ['1', '1.5', 'Error', '2'],
      'answer': '1',
    },
    {
      'question': 'Which of the following is true about Dart functions?',
      'options': [
        'Functions can return a value or be void',
        'Functions must return a value',
        'Functions cannot have default parameters',
        'Functions cannot be anonymous'
      ],
      'answer': 'Functions can return a value or be void',
    },
    {
      'question':
          'What is the correct syntax for a single-line comment in Dart?',
      'options': [
        '# This is a comment',
        '// This is a comment',
        '/* This is a comment */',
        '-- This is a comment'
      ],
      'answer': '// This is a comment',
    },

    // Batch 2: 11–20
    {
      'question':
          'What data type would the variable result have?\n\nvar result = 3.14;',
      'options': ['int', 'double', 'String', 'num'],
      'answer': 'double',
    },
    {
      'question': 'What is the correct way to handle exceptions in Dart?',
      'options': ['try-catch', 'try-except', 'catch-throw', 'if-else'],
      'answer': 'try-catch',
    },
    {
      'question': 'Which of the following is NOT a built-in data type in Dart?',
      'options': ['List', 'Map', 'Set', 'Vector'],
      'answer': 'Vector',
    },
    {
      'question':
          'What is the output of this code?\n\nvoid main() {\nint a = 4;\nint b = 3;\nprint(a ~/ b);\n}',
      'options': ['1', '1.33', '2', 'Error'],
      'answer': '1',
    },
    {
      'question': 'Which keyword is used to define a class in Dart?',
      'options': ['class', 'def', 'struct', 'object'],
      'answer': 'class',
    },
    {
      'question': 'How do you create a list in Dart?',
      'options': [
        'List<int> nums = [];',
        'Array nums = [];',
        'let nums = []',
        'arr nums = []'
      ],
      'answer': 'List<int> nums = [];',
    },
    {
      'question': 'What does the ?? operator do in Dart?',
      'options': [
        'Returns null',
        'Checks if null',
        'Null-aware assignment',
        'Throws an exception'
      ],
      'answer': 'Null-aware assignment',
    },
    {
      'question':
          'Which type of loop will run at least once even if the condition is false?',
      'options': ['for', 'while', 'do-while', 'foreach'],
      'answer': 'do-while',
    },
    {
      'question': 'What is the use of the "late" keyword in Dart?',
      'options': [
        'To declare a variable that is initialized later',
        'To declare a static variable',
        'To delay function execution',
        'To catch errors'
      ],
      'answer': 'To declare a variable that is initialized later',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nint x = 10;\nprint(x++);\n}',
      'options': ['10', '11', '9', 'Error'],
      'answer': '10',
    },

    // Batch 3: 21–30
    {
      'question':
          'Which of the following are valid ways to define a function in Dart?',
      'options': [
        'String greet() {}',
        'greet() {}',
        'void greet() {}',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nint a = 10;\nprint(a is int);\n}',
      'options': ['true', 'false', 'Error', 'null'],
      'answer': 'true',
    },
    {
      'question': 'In Dart, how do you represent a compile-time constant?',
      'options': ['var', 'const', 'static', 'dynamic'],
      'answer': 'const',
    },
    {
      'question': 'How do you declare a named parameter in Dart?',
      'options': [
        'By using curly braces {}',
        'By using square brackets []',
        'By using @param',
        'By using !param'
      ],
      'answer': 'By using curly braces {}',
    },
    {
      'question':
          'What is the default return type of a function if not specified in Dart?',
      'options': ['null', 'void', 'dynamic', 'None'],
      'answer': 'dynamic',
    },
    {
      'question':
          'Which of the following is NOT a valid control structure in Dart?',
      'options': ['if-else', 'for', 'while', 'until'],
      'answer': 'until',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nint a = 5;\na ??= 10;\nprint(a);\n}',
      'options': ['5', '10', 'null', 'Error'],
      'answer': '5',
    },
    {
      'question': 'How do you create an empty set in Dart?',
      'options': [
        'Set<int> nums = {};',
        'Set<int> nums = Set();',
        'var nums = [];',
        'new Set<int>()'
      ],
      'answer': 'Set<int> nums = Set();',
    },
    {
      'question': 'Which of the following is NOT a valid Dart keyword?',
      'options': ['new', 'await', 'throw', 'goto'],
      'answer': 'goto',
    },
    {
      'question': 'What is the use of the "super" keyword in Dart?',
      'options': [
        'To call a method in the parent class',
        'To declare a superclass',
        'To define an abstract class',
        'To create a static method'
      ],
      'answer': 'To call a method in the parent class',
    },

    // Batch 4: 31–40
    {
      'question':
          'Which of the following types is nullable by default in Dart?',
      'options': [
        'int',
        'double',
        'String',
        'All types are non-nullable by default'
      ],
      'answer': 'All types are non-nullable by default',
    },
    {
      'question': 'What is the use of the "async" keyword in Dart?',
      'options': [
        'To define a synchronous function',
        'To define an asynchronous function',
        'To define a generator',
        'None'
      ],
      'answer': 'To define an asynchronous function',
    },
    {
      'question': 'What does the "await" keyword do in Dart?',
      'options': [
        'Pauses execution until a Future completes',
        'Waits for user input',
        'Returns a Future',
        'Throws an exception'
      ],
      'answer': 'Pauses execution until a Future completes',
    },
    {
      'question':
          'Which of the following is a valid Future-based function declaration in Dart?',
      'options': [
        'Future<void> myFunction() async {}',
        'void myFunction() async {}',
        'Future myFunction() {}',
        'Future<void> myFunction() {}'
      ],
      'answer': 'Future<void> myFunction() async {}',
    },
    {
      'question': 'What is the purpose of the "Future" class in Dart?',
      'options': [
        'To represent asynchronous computation',
        'To handle exceptions',
        'To declare constants',
        'To manage threads'
      ],
      'answer': 'To represent asynchronous computation',
    },
// Batch 9: 101–110
    {
      'question': 'What is the difference between "const" and "final" in Dart?',
      'options': [
        '"const" variables are compile-time constants, while "final" variables can be set only once.',
        '"final" variables are compile-time constants, while "const" variables can be set only once.',
        'Both can be set only once, but "const" allows reassignment.',
        'There is no difference.'
      ],
      'answer':
          '"const" variables are compile-time constants, while "final" variables can be set only once.',
    },
    {
      'question': 'What is the purpose of the "rethrow" keyword in Dart?',
      'options': [
        'To re-throw a caught exception',
        'To stop the execution of a function',
        'To handle a thrown exception',
        'To propagate an exception asynchronously'
      ],
      'answer': 'To re-throw a caught exception',
    },
    {
      'question': 'How do you define a constant generic type in Dart?',
      'options': [
        'const List<int> myList = [];',
        'List<int> myList = const [];',
        'final List<int> myList = const [];',
        'const List myList = [];'
      ],
      'answer': 'const List<int> myList = [];',
    },
    {
      'question': 'Which of the following best describes a "Future" in Dart?',
      'options': [
        'An object that represents a potential value or error that will be available later.',
        'A synchronous object that handles large datasets.',
        'A way to perform recursive functions.',
        'A way to handle collections of data.'
      ],
      'answer':
          'An object that represents a potential value or error that will be available later.',
    },
    // Hard Dart Questions: 1–50
    {
      'question': 'What is the output of the following code?\n\nvoid main() {\nvar list = [1, 2, 3];\nvar result = list.map((e) => e * 2).toList();\nprint(result);\n}',
      'options': ['[2, 4, 6]', '[1, 2, 3]', '[1, 2, 3, 4, 5, 6]', 'Error'],
      'answer': '[2, 4, 6]',
    },
    {
      'question': 'Which of the following statements is true about futures in Dart?',
      'options': [
        'Futures can only be used with synchronous functions.',
        'A future can complete with a value or an error.',
        'Futures are only for UI-related operations.',
        'Futures can only return integers.'
      ],
      'answer': 'A future can complete with a value or an error.',
    },
    {
      'question': 'What is the output of the following code?\n\nvoid main() {\nvar a = [1, 2, 3];\na[0] = 10;\nprint(a);\n}',
      'options': ['[10, 2, 3]', '[1, 2, 3]', 'Error', '[10]'],
      'answer': '[10, 2, 3]',
    },
    {
      'question': 'Which of the following is a correct way to declare an extension in Dart?',
      'options': [
        'extension StringExtensions on String {}',
        'extension on String {}',
        'String extension() {}',
        'String.extensions() {}'
      ],
      'answer': 'extension StringExtensions on String {}',
    },
    {
      'question': 'What is the purpose of the "async" keyword in Dart?',
      'options': [
        'To define an asynchronous function.',
        'To declare a constant variable.',
        'To create a list.',
        'To handle exceptions.'
      ],
      'answer': 'To define an asynchronous function.',
    },
    {
      'question': 'What will be the result of the expression "5 ~/ 2" in Dart?',
      'options': ['2', '2.5', '3', 'Error'],
      'answer': '2',
    },
    {
      'question': 'How do you declare a named constructor in Dart?',
      'options': [
        'ClassName.named() {}',
        'named ClassName() {}',
        'ClassName() named {}',
        'ClassName::named() {}'
      ],
      'answer': 'ClassName.named() {}',
    },
    {
      'question': 'What will be the output of the following code?\n\nvoid main() {\nvar x = [1, 2, 3];\nprint(x.reversed.toList());\n}',
      'options': ['[3, 2, 1]', '[1, 2, 3]', '[1, 3, 2]', 'Error'],
      'answer': '[3, 2, 1]',
    },
    {
      'question': 'Which operator is used to assert that a value is not null in Dart?',
      'options': ['!', '??', 'assert', '?.'],
      'answer': '!',
    },
    {
      'question': 'What is the output of the following code?\n\nvoid main() {\nvar a = 10;\nvar b = a++;\nprint(b);\n}',
      'options': ['10', '11', 'Error', '9'],
      'answer': '10',
    },
    {
      'question': 'Which of the following is true about Dart streams?',
      'options': [
        'Streams can be either single-subscription or broadcast.',
        'Streams can only emit integers.',
        'Streams can only be used in UI applications.',
        'Streams are synchronous by default.'
      ],
      'answer': 'Streams can be either single-subscription or broadcast.',
    },
    {
      'question': 'What is the purpose of the "await" keyword in Dart?',
      'options': [
        'To wait for a future to complete.',
        'To declare a variable.',
        'To create an asynchronous function.',
        'To throw an exception.'
      ],
      'answer': 'To wait for a future to complete.',
    },
    {
      'question': 'What will be the output of the following code?\n\nvoid main() {\nvar map = {"a": 1, "b": 2};\nmap["a"] = 3;\nprint(map);\n}',
      'options': ['{a: 3, b: 2}', '{a: 1, b: 2}', '{a: 2, b: 1}', 'Error'],
      'answer': '{a: 3, b: 2}',
    },
    {
      'question': 'What is the purpose of the "super" keyword in Dart?',
      'options': [
        'To call the superclass constructor or method.',
        'To define a static variable.',
        'To throw an exception.',
        'To declare an interface.'
      ],
      'answer': 'To call the superclass constructor or method.',
    },
    {
      'question': 'Which method is used to convert a future into a stream in Dart?',
      'options': [
        'asStream()',
        'toStream()',
        'stream()',
        'futureToStream()'
      ],
      'answer': 'asStream()',
    },
    {
      'question': 'What is the output of the following code?\n\nvoid main() {\nList<int> numbers = [1, 2, 3, 4];\nprint(numbers.fold(0, (prev, element) => prev + element));\n}',
      'options': ['6', '3', 'Error', '0'],
      'answer': '6',
    },
    {
      'question': 'Which of the following can be used to handle exceptions in Dart?',
      'options': [
        'try-catch blocks',
        'if statements',
        'assert statements',
        'switch statements'
      ],
      'answer': 'try-catch blocks',
    },
    {
      'question': 'What is the output of the following code?\n\nvoid main() {\nprint("Hello, World!".split(",")[0]);\n}',
      'options': ['Hello', 'Hello, World!', 'World!', 'Error'],
      'answer': 'Hello',
    },
    {
      'question': 'What will be the result of "10 == 10.0" in Dart?',
      'options': ['true', 'false', 'Error', 'null'],
      'answer': 'true',
    },
    {
      'question': 'Which of the following correctly defines an abstract class in Dart?',
      'options': [
        'abstract class MyClass {}',
        'class MyClass abstract {}',
        'abstract MyClass {}',
        'MyClass abstract class {}'
      ],
      'answer': 'abstract class MyClass {}',
    },
    {
      'question': 'What is the output of the following code?\n\nvoid main() {\nvar a = "Dart";\nprint(a.toUpperCase());\n}',
      'options': ['DART', 'dart', 'Error', 'Dart'],
      'answer': 'DART',
    },
    {
      'question': 'How do you create a factory constructor in Dart?',
      'options': [
        'factory ClassName() {}',
        'ClassName.factory() {}',
        'ClassName() factory {}',
        'ClassName factory() {}'
      ],
      'answer': 'factory ClassName() {}',
    },
    {
      'question': 'What is the output of the following code?\n\nvoid main() {\nvar x = 3;\nif (x > 5) {\nprint("Greater than 5");\n} else {\nprint("Less than or equal to 5");\n}\n}',
      'options': ['Greater than 5', 'Less than or equal to 5', 'Error', '3'],
      'answer': 'Less than or equal to 5',
    },
    {
      'question': 'What will be the output of the following code?\n\nvoid main() {\nvar a = [1, 2, 3];\nvar b = a.toSet();\nprint(b);\n}',
      'options': ['{1, 2, 3}', '[1, 2, 3]', 'Error', '{1, 2, 3, 3}'],
      'answer': '{1, 2, 3}',
    },
    {
      'question': 'Which of the following is NOT a collection type in Dart?',
      'options': [
        'Set',
        'Map',
        'List',
        'Tuple'
      ],
      'answer': 'Tuple',
    },
    {
      'question': 'What is the purpose of the "const" keyword in Dart?',
      'options': [
        'To create compile-time constants.',
        'To declare a variable.',
        'To define a class.',
        'To handle asynchronous operations.'
      ],
      'answer': 'To create compile-time constants.',
    },
    {
      'question': 'What is the output of the following code?\n\nvoid main() {\nprint([1, 2, 3].first);\n}',
      'options': ['1', '3', 'Error', '2'],
      'answer': '1',
    },
    {
      'question': 'How do you create a mixin in Dart?',
      'options': [
        'mixin MyMixin {}',
        'class MyMixin {}',
        'MyMixin() {}',
        'MyMixin: {}'
      ],
      'answer': 'mixin MyMixin {}',
    },
    {
      'question': 'What is the output of the following code?\n\nvoid main() {\nvar x = {"a": 1, "b": 2};\nprint(x["a"]);\n}',
      'options': ['1', '2', 'Error', 'a'],
      'answer': '1',
    },
    {
      'question': 'Which operator is used to combine multiple futures in Dart?',
      'options': [
        'Future.wait()',
        'Future.combine()',
        'Future.merge()',
        'Future.all()'
      ],
      'answer': 'Future.wait()',
    },
    {
      'question': 'What is the output of the following code?\n\nvoid main() {\nvar x = [1, 2, 3];\nx.add(4);\nprint(x.length);\n}',
      'options': ['4', '3', 'Error', '5'],
      'answer': '4',
    },

    {
      'question':
          'What is the role of "await" in an asynchronous function in Dart?',
      'options': [
        'It suspends the function execution until the future completes.',
        'It throws an error if the future fails.',
        'It runs the function synchronously.',
        'It returns a stream instead of a future.'
      ],
      'answer':
          'It suspends the function execution until the future completes.',
    },
    {
      'question':
          'What is the primary difference between an "Isolate" and a "Future" in Dart?',
      'options': [
        'An "Isolate" runs concurrently on a separate memory space, while a "Future" runs on the same thread.',
        'Both run asynchronously, but "Isolate" returns a stream.',
        'A "Future" always runs synchronously, while "Isolate" is asynchronous.',
        'There is no difference between them.'
      ],
      'answer':
          'An "Isolate" runs concurrently on a separate memory space, while a "Future" runs on the same thread.',
    },
    {
      'question': 'Which of the following is true about "Streams" in Dart?',
      'options': [
        'Streams represent a sequence of asynchronous events.',
        'Streams are used to manipulate strings.',
        'Streams are always finite in Dart.',
        'Streams can be used to generate constant values.'
      ],
      'answer': 'Streams represent a sequence of asynchronous events.',
    },
    {
      'question': 'What does the "async*" keyword do in Dart?',
      'options': [
        'It defines a function that returns a stream instead of a future.',
        'It throws exceptions asynchronously.',
        'It declares a function that returns a future.',
        'It allows the use of await in the function.'
      ],
      'answer':
          'It defines a function that returns a stream instead of a future.',
    },
    {
      'question': 'What is the purpose of the "yield" keyword in Dart?',
      'options': [
        'It pauses the generator function and returns a value.',
        'It throws an exception in async code.',
        'It allows breaking out of loops asynchronously.',
        'It suspends the current execution context permanently.'
      ],
      'answer': 'It pauses the generator function and returns a value.',
    },
    {
      'question':
          'How can you handle multiple asynchronous tasks in Dart and ensure they all complete?',
      'options': [
        'Use Future.wait() to wait for all futures to complete.',
        'Use a loop to check for future completion.',
        'Use an async stream to handle futures.',
        'Use Isolates to handle tasks asynchronously.'
      ],
      'answer': 'Use Future.wait() to wait for all futures to complete.',
    },

// Batch 10: 111–120
    {
      'question':
          'What is the difference between "StreamController.broadcast()" and a single subscription stream?',
      'options': [
        '"StreamController.broadcast()" allows multiple listeners, while a single subscription stream allows only one.',
        '"StreamController.broadcast()" is faster.',
        'A single subscription stream does not allow any listeners.',
        '"StreamController.broadcast()" can throw exceptions asynchronously.'
      ],
      'answer':
          '"StreamController.broadcast()" allows multiple listeners, while a single subscription stream allows only one.',
    },
    {
      'question': 'Which statement is true about "typedef" in Dart?',
      'options': [
        'It is used to define a type alias for a function.',
        'It creates an abstract class.',
        'It defines a constant.',
        'It creates a type-safe enum.'
      ],
      'answer': 'It is used to define a type alias for a function.',
    },
    {
      'question': 'How can you capture all exceptions in Dart?',
      'options': [
        'Using runZonedGuarded',
        'Using try-catch-finally',
        'Using Stream.error',
        'Using Future.wait()'
      ],
      'answer': 'Using runZonedGuarded',
    },
    {
      'question':
          'Which of the following is a characteristic of a "Zone" in Dart?',
      'options': [
        'A Zone provides an environment where the behavior of code execution can be altered.',
        'A Zone runs a synchronous function only.',
        'A Zone is used to define a stateful widget.',
        'A Zone captures null safety errors.'
      ],
      'answer':
          'A Zone provides an environment where the behavior of code execution can be altered.',
    },
    {
      'question': 'What is the main purpose of "dart:convert" library?',
      'options': [
        'To encode and decode JSON, UTF-8, and other data formats.',
        'To manipulate strings.',
        'To handle null safety.',
        'To handle asynchronous operations.'
      ],
      'answer': 'To encode and decode JSON, UTF-8, and other data formats.',
    },
    {
      'question': 'How do you use "Generics" in Dart?',
      'options': [
        'Generics allow classes and methods to operate on types that are specified as parameters.',
        'Generics allow mixing classes with multiple constructors.',
        'Generics allow null-safe operations.',
        'Generics restrict type inference.'
      ],
      'answer':
          'Generics allow classes and methods to operate on types that are specified as parameters.',
    },
    {
      'question': 'What is the role of "covariant" in Dart?',
      'options': [
        'It allows method parameters to be more specific in subclasses.',
        'It allows for multiple return types.',
        'It enables type-safe streams.',
        'It handles future completion for async functions.'
      ],
      'answer':
          'It allows method parameters to be more specific in subclasses.',
    },
    {
      'question':
          'Which of the following Dart language features supports asynchronous error handling?',
      'options': ['try-catch', 'await-catch', 'Stream.catchError()', 'Error()'],
      'answer': 'Stream.catchError()',
    },
    {
      'question':
          'What does the term "Hot Reload" refer to in Flutter/Dart development?',
      'options': [
        'It allows you to reload the code without losing the state of the app.',
        'It restarts the app from scratch.',
        'It reloads the entire Dart framework.',
        'It catches null safety errors automatically.'
      ],
      'answer':
          'It allows you to reload the code without losing the state of the app.',
    },
    {
      'question':
          'Which statement is true regarding "factory constructors" in Dart?',
      'options': [
        'Factory constructors can return a pre-existing instance.',
        'Factory constructors can have multiple return types.',
        'Factory constructors cannot initialize fields.',
        'Factory constructors are mandatory for every class.'
      ],
      'answer': 'Factory constructors can return a pre-existing instance.',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar map = {\'one\': 1, \'two\': 2};\nprint(map[\'three\']);\n}',
      'options': ['null', '0', 'Error', '2'],
      'answer': 'null',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar list = [1, 2, 3];\nvar result = list.map((e) => e * 2).toList();\nprint(result);\n}',
      'options': ['[2, 4, 6]', '[1, 2, 3]', '[1, 2, 3, 4, 5, 6]', 'Error'],
      'answer': '[2, 4, 6]',
    },
    {
      'question':
          'Which of the following statements is true about futures in Dart?',
      'options': [
        'Futures can only be used with synchronous functions.',
        'A future can complete with a value or an error.',
        'Futures are only for UI-related operations.',
        'Futures can only return integers.'
      ],
      'answer': 'A future can complete with a value or an error.',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar a = [1, 2, 3];\na[0] = 10;\nprint(a);\n}',
      'options': ['[10, 2, 3]', '[1, 2, 3]', 'Error', '[10]'],
      'answer': '[10, 2, 3]',
    },
    {
      'question':
          'Which of the following is a correct way to declare an extension in Dart?',
      'options': [
        'extension StringExtensions on String {}',
        'extension on String {}',
        'String extension() {}',
        'String.extensions() {}'
      ],
      'answer': 'extension StringExtensions on String {}',
    },
    {
      'question': 'What is the purpose of the "async" keyword in Dart?',
      'options': [
        'To define an asynchronous function.',
        'To declare a constant variable.',
        'To create a list.',
        'To handle exceptions.'
      ],
      'answer': 'To define an asynchronous function.',
    },
    {
      'question': 'What will be the result of the expression "5 ~/ 2" in Dart?',
      'options': ['2', '2.5', '3', 'Error'],
      'answer': '2',
    },
    {
      'question': 'How do you declare a named constructor in Dart?',
      'options': [
        'ClassName.named() {}',
        'named ClassName() {}',
        'ClassName() named {}',
        'ClassName::named() {}'
      ],
      'answer': 'ClassName.named() {}',
    },
    {
      'question':
          'What will be the output of the following code?\n\nvoid main() {\nvar x = [1, 2, 3];\nprint(x.reversed.toList());\n}',
      'options': ['[3, 2, 1]', '[1, 2, 3]', '[1, 3, 2]', 'Error'],
      'answer': '[3, 2, 1]',
    },
    {
      'question':
          'Which operator is used to assert that a value is not null in Dart?',
      'options': ['!', '??', 'assert', '?.'],
      'answer': '!',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar a = 10;\nvar b = a++;\nprint(b);\n}',
      'options': ['10', '11', 'Error', '9'],
      'answer': '10',
    },
    {
      'question': 'Which of the following is true about Dart streams?',
      'options': [
        'Streams can be either single-subscription or broadcast.',
        'Streams can only emit integers.',
        'Streams can only be used in UI applications.',
        'Streams are synchronous by default.'
      ],
      'answer': 'Streams can be either single-subscription or broadcast.',
    },
    {
      'question': 'What is the purpose of the "await" keyword in Dart?',
      'options': [
        'To wait for a future to complete.',
        'To declare a variable.',
        'To create an asynchronous function.',
        'To throw an exception.'
      ],
      'answer': 'To wait for a future to complete.',
    },
    {
      'question':
          'What will be the output of the following code?\n\nvoid main() {\nvar map = {"a": 1, "b": 2};\nmap["a"] = 3;\nprint(map);\n}',
      'options': ['{a: 3, b: 2}', '{a: 1, b: 2}', '{a: 2, b: 1}', 'Error'],
      'answer': '{a: 3, b: 2}',
    },
    {
      'question': 'What is the purpose of the "super" keyword in Dart?',
      'options': [
        'To call the superclass constructor or method.',
        'To define a static variable.',
        'To throw an exception.',
        'To declare an interface.'
      ],
      'answer': 'To call the superclass constructor or method.',
    },
    {
      'question':
          'Which method is used to convert a future into a stream in Dart?',
      'options': ['asStream()', 'toStream()', 'stream()', 'futureToStream()'],
      'answer': 'asStream()',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar a = [1, 2, 3];\nprint(a.fold(0, (prev, element) => prev + element));\n}',
      'options': ['6', '3', 'Error', '0'],
      'answer': '6',
    },
    {
      'question':
          'Which of the following can be used to handle exceptions in Dart?',
      'options': [
        'try-catch blocks',
        'if statements',
        'assert statements',
        'switch statements'
      ],
      'answer': 'try-catch blocks',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nList<int> numbers = [1, 2, 3, 4];\nprint(numbers.map((n) => n * n).toList());\n}',
      'options': ['[1, 4, 9, 16]', '[1, 2, 3, 4]', '[1, 8, 27, 64]', 'Error'],
      'answer': '[1, 4, 9, 16]',
    },
    {
      'question':
          'Which of the following is a correct way to declare a constant in Dart?',
      'options': [
        'const myConst = 10;',
        'final myConst = 10;',
        'constant myConst = 10;',
        'let myConst = 10;'
      ],
      'answer': 'const myConst = 10;',
    },
    {
      'question': 'What does the "await" keyword require in a function?',
      'options': [
        'The function must be marked as async.',
        'The function must return a Future.',
        'The function must be static.',
        'The function must have a void return type.'
      ],
      'answer': 'The function must be marked as async.',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nprint("Hello, World!".split(",")[0]);\n}',
      'options': ['Hello', 'Hello, World!', 'World!', 'Error'],
      'answer': 'Hello',
    },
    {
      'question': 'What will be the result of "10 == 10.0" in Dart?',
      'options': ['true', 'false', 'Error', 'null'],
      'answer': 'true',
    },
    {
      'question':
          'Which of the following correctly defines an abstract class in Dart?',
      'options': [
        'abstract class MyClass {}',
        'class MyClass abstract {}',
        'abstract MyClass {}',
        'MyClass abstract class {}'
      ],
      'answer': 'abstract class MyClass {}',
    },
    {
      'question': 'What is the purpose of the "typedef" keyword in Dart?',
      'options': [
        'To define a function type.',
        'To declare an interface.',
        'To create a class.',
        'To define a constant.'
      ],
      'answer': 'To define a function type.',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar a = "Dart";\nprint(a.toUpperCase());\n}',
      'options': ['DART', 'dart', 'Error', 'Dart'],
      'answer': 'DART',
    },
    {
      'question': 'How do you create a factory constructor in Dart?',
      'options': [
        'factory ClassName() {}',
        'ClassName.factory() {}',
        'ClassName() factory {}',
        'ClassName factory() {}'
      ],
      'answer': 'factory ClassName() {}',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar x = 3;\nif (x > 5) {\nprint("Greater than 5");\n} else {\nprint("Less than or equal to 5");\n}\n}',
      'options': ['Greater than 5', 'Less than or equal to 5', 'Error', '3'],
      'answer': 'Less than or equal to 5',
    },
    {
      'question':
          'What will be the output of the following code?\n\nvoid main() {\nvar a = [1, 2, 3];\nvar b = a.toSet();\nprint(b);\n}',
      'options': ['{1, 2, 3}', '[1, 2, 3]', 'Error', '{1, 2, 3, 3}'],
      'answer': '{1, 2, 3}',
    },
    {
      'question': 'Which of the following is NOT a collection type in Dart?',
      'options': ['Set', 'Map', 'List', 'Tuple'],
      'answer': 'Tuple',
    },
    {
      'question': 'What is the purpose of the "const" keyword in Dart?',
      'options': [
        'To create compile-time constants.',
        'To declare a variable.',
        'To define a class.',
        'To handle asynchronous operations.'
      ],
      'answer': 'To create compile-time constants.',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nprint([1, 2, 3].first);\n}',
      'options': ['1', '3', 'Error', '2'],
      'answer': '1',
    },
    {
      'question': 'How do you create a mixin in Dart?',
      'options': [
        'mixin MyMixin {}',
        'class MyMixin {}',
        'MyMixin() {}',
        'MyMixin: {}'
      ],
      'answer': 'mixin MyMixin {}',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar x = {"a": 1, "b": 2};\nprint(x["a"]);\n}',
      'options': ['1', '2', 'Error', 'a'],
      'answer': '1',
    },
    {
      'question': 'Which operator is used to combine multiple futures in Dart?',
      'options': [
        'Future.wait()',
        'Future.combine()',
        'Future.merge()',
        'Future.all()'
      ],
      'answer': 'Future.wait()',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar x = [1, 2, 3];\nx.add(4);\nprint(x.length);\n}',
      'options': ['4', '3', 'Error', '5'],
      'answer': '4',
    },

    {
      'question': 'How do you create a singleton class in Dart?',
      'options': [
        'Use a private constructor and a static instance variable.',
        'Use the "const" keyword.',
        'Declare all methods as static.',
        'Use factory constructors only.'
      ],
      'answer': 'Use a private constructor and a static instance variable.',
    },
    {
      'question': 'What does the "??" operator do in Dart?',
      'options': [
        'Returns the right-hand value if the left-hand value is null',
        'Throws an error if the value is null',
        'Combines two strings',
        'Checks if the value is null'
      ],
      'answer': 'Returns the right-hand value if the left-hand value is null',
    },
    {
      'question': 'Which of the following is a valid lambda function in Dart?',
      'options': [
        '(x) => x * 2;',
        'x => return x * 2;',
        '(x) { x * 2; }',
        'x -> x * 2;'
      ],
      'answer': '(x) => x * 2;',
    },
    {
      'question': 'What keyword is used to handle exceptions in Dart?',
      'options': ['try', 'catch', 'finally', 'throw'],
      'answer': 'try',
    },
    {
      'question':
          'How do you force a nullable type to a non-nullable type in Dart?',
      'options': [
        'Using the "!" operator',
        'Using the "?" operator',
        'Using "null-aware" operators',
        'Using the "nullable" keyword'
      ],
      'answer': 'Using the "!" operator',
    },
    {
      'question':
          'What is the default return type of a Dart function if none is specified?',
      'options': ['void', 'dynamic', 'int', 'null'],
      'answer': 'dynamic',
    },
    {
      'question':
          'Which of the following can be used to iterate over a list in Dart?',
      'options': ['forEach()', 'map()', 'where()', 'all of the above'],
      'answer': 'all of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar list = [1, 2, 3];\nprint(list[1]);\n}',
      'options': ['1', '2', '3', 'Error'],
      'answer': '2',
    },
    {
      'question': 'What is the purpose of the "mixin" keyword in Dart?',
      'options': [
        'To allow a class to inherit methods from multiple sources',
        'To declare a class',
        'To implement an interface',
        'To create abstract methods'
      ],
      'answer': 'To allow a class to inherit methods from multiple sources',
    },
    {
      'question':
          'What is the correct syntax to declare a named parameter in Dart?',
      'options': ['{int a}', '[int a]', '(int a)', '@param a'],
      'answer': '{int a}',
    },
    {
      'question': 'How do you declare an abstract class in Dart?',
      'options': [
        'abstract class MyClass {}',
        'class MyClass abstract {}',
        'def MyClass {}',
        'class MyClass () {}'
      ],
      'answer': 'abstract class MyClass {}',
    },

// Batch 7: 61–70
    {
      'question': 'Which of the following is not a valid data type in Dart?',
      'options': ['int', 'bool', 'num', 'text'],
      'answer': 'text',
    },
    {
      'question':
          'Which keyword is used to stop the execution of a loop in Dart?',
      'options': ['break', 'stop', 'exit', 'return'],
      'answer': 'break',
    },
    {
      'question': 'How do you define an anonymous function in Dart?',
      'options': ['() => {}', 'function() {}', 'lambda() {}', 'def () {}'],
      'answer': '() => {}',
    },
    {
      'question': 'What is the purpose of the "is" keyword in Dart?',
      'options': [
        'To check if an object is of a particular type',
        'To declare a variable',
        'To initialize a value',
        'To define a function'
      ],
      'answer': 'To check if an object is of a particular type',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar a = 5;\na++;\nprint(a);\n}',
      'options': ['5', '6', '4', 'Error'],
      'answer': '6',
    },
    {
      'question':
          'Which of the following data structures is immutable in Dart?',
      'options': ['Set', 'List', 'Map', 'const List'],
      'answer': 'const List',
    },
    {
      'question':
          'What is the correct syntax for using generics in a function in Dart?',
      'options': [
        'T functionName<T>(T param)',
        'functionName(T param)',
        'def functionName(T param)',
        'T functionName(T param)'
      ],
      'answer': 'T functionName<T>(T param)',
    },
    {
      'question': 'How do you declare a final variable in Dart?',
      'options': [
        'final int a = 5;',
        'const int a = 5;',
        'var int a = 5;',
        'static int a = 5;'
      ],
      'answer': 'final int a = 5;',
    },
    {
      'question':
          'Which of the following operators is used to access a static method in Dart?',
      'options': ['.', '::', '->', '=>'],
      'answer': '.',
    },
    {
      'question': 'What is the purpose of the "assert" function in Dart?',
      'options': [
        'To check if a condition is true during development',
        'To catch errors',
        'To log messages',
        'To return values'
      ],
      'answer': 'To check if a condition is true during development',
    },

// Batch 8: 71–80
    {
      'question':
          'Which function is used to stop an asynchronous stream in Dart?',
      'options': ['close()', 'dispose()', 'stop()', 'end()'],
      'answer': 'close()',
    },
    {
      'question': 'Which of the following is true about Dart Futures?',
      'options': [
        'They represent a value that may not be available yet',
        'They are always synchronous',
        'They are a type of loop',
        'They can only be used in for-loops'
      ],
      'answer': 'They represent a value that may not be available yet',
    },
    {
      'question': 'What does the "await" keyword do in Dart?',
      'options': [
        'Pauses the execution until the future completes',
        'Returns a value',
        'Throws an error',
        'None of the above'
      ],
      'answer': 'Pauses the execution until the future completes',
    },
    {
      'question': 'How do you convert a string to an integer in Dart?',
      'options': [
        'int.parse()',
        'string.toInt()',
        'toInteger()',
        'Integer.valueOf()'
      ],
      'answer': 'int.parse()',
    },
    {
      'question': 'What is the purpose of the "await" keyword in Dart?',
      'options': [
        'To pause the execution of the function until the asynchronous operation completes',
        'To create a future',
        'To declare a constant',
        'To check for errors'
      ],
      'answer':
          'To pause the execution of the function until the asynchronous operation completes',
    },
    {
      'question': 'What is a common use case for the "Stream" class in Dart?',
      'options': [
        'Handling asynchronous data',
        'Performing math operations',
        'Rendering UI',
        'String manipulation'
      ],
      'answer': 'Handling asynchronous data',
    },
    {
      'question': 'How do you create a constant constructor in Dart?',
      'options': [
        'const MyClass()',
        'new MyClass()',
        'final MyClass()',
        'static MyClass()'
      ],
      'answer': 'const MyClass()',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nvar x = 5;\nprint(x is int);\n}',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'true',
    },
    {
      'question': 'What does the "throw" keyword do in Dart?',
      'options': [
        'Throws an exception',
        'Returns a value',
        'Breaks a loop',
        'Declares a variable'
      ],
      'answer': 'Throws an exception',
    },
    {
      'question': 'Which of the following is a null-aware operator in Dart?',
      'options': ['??', '&&', '||', '!='],
      'answer': '??',
    },

    {
      'question': 'How do you handle multiple Futures in Dart?',
      'options': [
        'Future.wait()',
        'Future.addAll()',
        'Future.join()',
        'Future.many()'
      ],
      'answer': 'Future.wait()',
    },
    {
      'question': 'What is the difference between final and const in Dart?',
      'options': [
        'final variables can be set once, const is compile-time constant',
        'Both are immutable',
        'const can be reassigned, final cannot',
        'final is faster than const'
      ],
      'answer':
          'final variables can be set once, const is compile-time constant',
    },
    {
      'question': 'How do you define a getter in Dart?',
      'options': [
        'int get myVariable => value;',
        'int myVariable => value;',
        'void get myVariable { return value; }',
        'myVariable => get'
      ],
      'answer': 'int get myVariable => value;',
    },
    {
      'question': 'How do you define a constructor in Dart?',
      'options': [
        'ClassName() {}',
        'new ClassName() {}',
        'def ClassName() {}',
        'construct ClassName() {}'
      ],
      'answer': 'ClassName() {}',
    },
    {
      'question':
          'Which of the following can be used for method overloading in Dart?',
      'options': [
        'Method name',
        'Number of arguments',
        'Data type of arguments',
        'Dart does not support method overloading'
      ],
      'answer': 'Dart does not support method overloading',
    },

    // Batch 5: 41–50
    {
      'question': 'What is the use of the "factory" keyword in Dart?',
      'options': [
        'To create factory constructors',
        'To create private variables',
        'To declare a static method',
        'None of the above'
      ],
      'answer': 'To create factory constructors',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nint x = 0;\nwhile (x < 3) {\nprint(x);\n}\n}',
      'options': ['Infinite loop', '0 1 2', '0 1 2 3', 'Error'],
      'answer': 'Infinite loop',
    },
    {
      'question': 'How do you create a private variable in Dart?',
      'options': [
        'By starting the variable name with an underscore',
        'By using the "private" keyword',
        'By using the "final" keyword',
        'Dart does not support private variables'
      ],
      'answer': 'By starting the variable name with an underscore',
    },
    {
      'question':
          'What is the correct way to declare a named constructor in Dart?',
      'options': [
        'ClassName.namedConstructor() {}',
        'ClassName Constructor.named() {}',
        'ClassName namedConstructor() {}',
        'def ClassName.namedConstructor() {}'
      ],
      'answer': 'ClassName.namedConstructor() {}',
    },
    {
      'question':
          'Which of the following is a correct way to initialize a list with values?',
      'options': [
        'List<int> numbers = [1, 2, 3];',
        'int[] numbers = {1, 2, 3};',
        'List numbers = (1, 2, 3);',
        'Array numbers = [1, 2, 3];'
      ],
      'answer': 'List<int> numbers = [1, 2, 3];',
    },
    {
      'question':
          'What is the correct way to define an optional parameter in Dart?',
      'options': [
        'Using square brackets []',
        'Using curly braces {}',
        'Using parentheses ()',
        'Using @param'
      ],
      'answer': 'Using square brackets []',
    },
    {
      'question':
          'Which of the following operators is used for string interpolation in Dart?',
      'options': ['\${}', '\$', '#{}', '@{}'],
      'answer': '\${}',
    },

    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nint a = 10;\na -= 5;\nprint(a);\n}',
      'options': ['10', '5', '0', 'Error'],
      'answer': '5',
    },
    {
      'question':
          'What is the output of the following code?\n\nvoid main() {\nprint("Hello, " "World!");\n}',
      'options': ['Hello, World!', 'Error', 'Hello, World', 'Hello World'],
      'answer': 'Hello, World!',
    },
    {
      'question': 'What is the correct way to declare a generic class in Dart?',
      'options': [
        'class MyClass<T>',
        'class MyClass<T extends Object>',
        'class MyClass<Object>',
        'class MyClass<T extends Class>'
      ],
      'answer': 'class MyClass<T>',
    },

    {
      'question': 'What is the data type of `var score = 85;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'int',
    },
    {
      'question': 'What is the output of `print("Dart" <= "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the purpose of the `required` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To specify required parameters'
      ],
      'answer': 'To specify required parameters',
    },
    {
      'question': 'What is the output of `print(5 == 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the data type of `var isAdmin = true;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'bool',
    },
    {
      'question': 'What is the output of `print("Hello, " * 5);`?',
      'options': [
        'Hello, Hello, Hello, Hello, Hello, ',
        'Error',
        'Hello, + Hello, + Hello, + Hello, + Hello, ',
        'None'
      ],
      'answer': 'Hello, Hello, Hello, Hello, Hello, ',
    },
    {
      'question': 'What is the purpose of the `deferred` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To specify a deferred import'
      ],
      'answer': 'To specify a deferred import',
    },
    {
      'question': 'What is the output of `print(10 ~/ 2);`?',
      'options': [5, 10, 'Error', 'None'],
      'answer': 5,
    },
    {
      'question': 'What is the data type of `var weight = 70.2;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'double',
    },
    {
      'question': 'What is the output of `print("Dart" >= "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the purpose of the `show` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To specify a shown import'
      ],
      'answer': 'To specify a shown import',
    },
    {
      'question': 'What is the output of `print(5 != 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the data type of `var name = "Emily Chen";`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'String ',
    },
    {
      'question': 'What is the output of `print("Hello, " + "World!" * 5);`?',
      'options': [
        'Hello, World!World!World!World!World!',
        'Error',
        'Hello, + World! + World! + World! + World! + World!',
        'None'
      ],
      'answer': 'Hello, World!World!World!World!World!',
    },
    {
      'question': 'What is the purpose of the `hide` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To specify a hidden import'
      ],
      'answer': 'To specify a hidden import',
    },
    {
      'question': 'What is the output of `print(10 ~/ 1);`?',
      'options': [10, 1, 'Error', 'None'],
      'answer': 10,
    },
    {
      'question': 'What is the data type of `var score = 90;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'int',
    },
    {
      'question': 'What is the output of `print("Dart" < "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the purpose of the `lazy` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To specify a lazy import'
      ],
      'answer': 'To specify a lazy import',
    },
    {
      'question': 'What is the output of `print(5 >= 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the data type of `var isAdmin = false;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'bool',
    },
    {
      'question': 'What is the output of `print("Hello, " * 6);`?',
      'options': [
        'Hello, Hello, Hello, Hello, Hello, Hello, ',
        'Error',
        'Hello, + Hello, + Hello, + Hello, + Hello, + Hello, ',
        'None'
      ],
      'answer': 'Hello, Hello, Hello, Hello, Hello, Hello, ',
    },
    {
      'question': 'What is the purpose of the `sync` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To specify a synchronous import'
      ],
      'answer': 'To specify a synchronous import',
    },
    {
      'question': 'What is the output of `print(10 ~/ 10);`?',
      'options': [1, 10, 'Error', 'None'],
      'answer': 1,
    },
    {
      'question': 'What is the data type of `var weight = 60.5;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'double',
    },
    {
      'question': 'What is the output of `print("Dart" == "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the purpose of the `async` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define an asynchronous function'
      ],
      'answer': 'To define an asynchronous function',
    },
    {
      'question': 'What is the output of `print(5 <= 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the data type of `var name = "Frank Kim";`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'String',
    },
    {
      'question': 'What is the output of `print("Hello, " + "World!" * 6);`?',
      'options': [
        'Hello, World!World!World!World!World!World!',
        'Error',
        'Hello, + World! + World! + World! + World! + World! + World!',
        'None'
      ],
      'answer': 'Hello, World!World!World!World!World!World!',
    },
    {
      'question': 'What is the purpose of the `await` keyword in Dart?',
      'options': [
        'To define a function',
        ' To declare a variable',
        'To start the program execution',
        'To wait for the completion of an asynchronous operation'
      ],
      'answer': 'To wait for the completion of an asynchronous operation',
    },
    {
      'question': 'What is the output of `print(10 ~/ 5);`?',
      'options': [2, 10, 'Error', 'None'],
      'answer': 2,
    },
    {
      'question': 'What is the data type of `var score = 80;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'int',
    },
    {
      'question': 'What is the output of `print("Dart" != "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': true,
    },
    {
      'question': 'What is the purpose of the `yield` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To produce a value in a stream'
      ],
      'answer': 'To produce a value in a stream',
    },
    {
      'question': 'What is the output of `print(5 > 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the data type of `var isAdmin = true;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'bool',
    },
    {
      'question': 'What is the output of `print("Hello, " * 7);`?',
      'options': [
        'Hello, Hello, Hello, Hello, Hello, Hello, Hello, ',
        'Error',
        'Hello, + Hello, + Hello, + Hello, + Hello, + Hello, + Hello, ',
        'None'
      ],
      'answer': 'Hello, Hello, Hello, Hello, Hello, Hello, Hello, ',
    },
    {
      'question': 'What is the purpose of the `get` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a getter'
      ],
      'answer': 'To define a getter',
    },
    {
      'question': 'What is the output of `print(10 ~/ 2);`?',
      'options': [5, 10, 'Error', 'None'],
      'answer': 5,
    },
    {
      'question': 'What is the data type of `var weight = 65.2;`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'double',
    },
    {
      'question': 'What is the output of `print("Dart" > "dart");`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the purpose of the `set` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To define a setter'
      ],
      'answer': 'To define a setter',
    },
    {
      'question': 'What is the output of `print(5 < 5);`?',
      'options': [true, false, 'Error', 'None'],
      'answer': false,
    },
    {
      'question': 'What is the data type of `var name = "George Martin";`?',
      'options': ['int', 'double', 'String', 'bool'],
      'answer': 'String',
    },
    {
      'question': 'What is the output of `print("Hello, " + "World!" * 7);`?',
      'options': [
        'Hello, World!World!World!World!World!World!World!',
        'Error',
        'Hello, + World! + World! + World! + World! + World! + World! + World!',
        'None'
      ],
      'answer': 'Hello, World!World!World!World!World!World!World!',
    },
    {
      'question': 'What is the purpose of the `covariant` keyword in Dart?',
      'options': [
        'To define a function',
        'To declare a variable',
        'To start the program execution',
        'To specify covariant parameters'
      ],
      'answer': 'To specify covariant parameters',
    },
    {
      'question': 'What is the output of `print(10 ~/ 5);`?',
      'options': [2, 10, 'Error', 'None'],
      'answer': 2,
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
    final TextEditingController questionCountController =
        TextEditingController();

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
                totalQuestions =
                    count > questions.length ? questions.length : count;
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
            colors: [
              Colors.deepPurple.withOpacity(0.7),
              Colors.purpleAccent.withOpacity(0.7)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          // Scrollable content
          child: Column(
            key: ValueKey<int>(currentQuestionIndex),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
              Column(
                // Options in a Column for better scrolling
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
    List<Map<String, dynamic>> shuffledQuestions = List.from(questions)
      ..shuffle(random);
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
