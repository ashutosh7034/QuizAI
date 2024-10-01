import 'dart:math';
import 'package:flutter/material.dart';
import 'quiz_analysis.dart'; // Import the analysis screen

class JavaQuizScreen extends StatefulWidget {
  @override
  _JavaQuizScreenState createState() => _JavaQuizScreenState();
}

class _JavaQuizScreenState extends State<JavaQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the main function in Java?',
      'options': ['main()', 'start()', 'init()', 'run()'],
      'answer': 'main()',
    },
    {
      'question': 'Which keyword is used to create a class in Java?',
      'options': ['class', 'def', 'function', 'type'],
      'answer': 'class',
    },
    {
      'question': 'What is the size of int in Java?',
      'options': ['2 bytes', '4 bytes', '8 bytes', 'depends on the system'],
      'answer': '4 bytes',
    },
    {
      'question': 'What is the default value of a boolean variable in Java?',
      'options': ['true', 'false', '1', '0'],
      'answer': 'false',
    },
    {
      'question': 'What is the correct way to declare an array in Java?',
      'options': ['int arr[]', 'int[] arr', 'Both a and b', 'None'],
      'answer': 'Both a and b',
    },
    {
      'question':
          'Which of the following is not a valid access modifier in Java?',
      'options': ['public', 'private', 'protected', 'visible'],
      'answer': 'visible',
    },
    {
      'question': 'What is a constructor?',
      'options': [
        'A method to initialize an object',
        'A method to destroy an object',
        'None',
        'All of the above'
      ],
      'answer': 'A method to initialize an object',
    },
    {
      'question': 'How do you handle exceptions in Java?',
      'options': ['try and catch', 'throw', 'throws', 'None'],
      'answer': 'try and catch',
    },
    {
      'question': 'What is the difference between == and .equals()?',
      'options': [
        '== checks reference, .equals() checks value',
        'Both are the same',
        '.equals() checks reference, == checks value',
        'None'
      ],
      'answer': '== checks reference, .equals() checks value',
    },
    {
      'question': 'What is polymorphism?',
      'options': [
        'The ability to take on many forms',
        'The ability to inherit properties',
        'The ability to encapsulate data',
        'None'
      ],
      'answer': 'The ability to take on many forms',
    },
    {
      'question': 'What are interfaces in Java?',
      'options': [
        'Abstract classes',
        'Contracts for classes',
        'Concrete classes',
        'None'
      ],
      'answer': 'Contracts for classes',
    },
    {
      'question': 'What is the output of 5 + 2 + "3"?',
      'options': ['53', '73', 'Error', 'None'],
      'answer': '53',
    },
    {
      'question':
          'Which of the following is not a primitive data type in Java?',
      'options': ['int', 'char', 'String', 'float'],
      'answer': 'String',
    },
    {
      'question': 'What is the default value of a boolean variable in Java?',
      'options': ['true', 'false', '1', '0'],
      'answer': 'false',
    },
    {
      'question': 'What is the correct way to declare an array in Java?',
      'options': ['int arr[]', 'int[] arr', 'Both a and b', 'None'],
      'answer': 'Both a and b',
    },
    {
      'question':
          'Which of the following is not a valid access modifier in Java?',
      'options': ['public', 'private', 'protected', 'visible'],
      'answer': 'visible',
    },
    {
      'question': 'What is a constructor?',
      'options': [
        'A method to initialize an object',
        'A method to destroy an object',
        'None',
        'All of the above'
      ],
      'answer': 'A method to initialize an object',
    },
    {
      'question': 'How do you handle exceptions in Java?',
      'options': ['try and catch', 'throw', 'throws', 'None'],
      'answer': 'try and catch',
    },
    {
      'question': 'What is the difference between == and .equals()?',
      'options': [
        '== checks reference, .equals() checks value',
        'Both are the same',
        '.equals() checks reference, == checks value',
        'None'
      ],
      'answer': '== checks reference, .equals() checks value',
    },
    {
      'question': 'What is polymorphism?',
      'options': [
        'The ability to take on many forms',
        'The ability to inherit properties',
        'The ability to encapsulate data',
        'None'
      ],
      'answer': 'The ability to take on many forms',
    },
    {
      'question': 'What are interfaces in Java?',
      'options': [
        'Abstract classes',
        'Contracts for classes',
        'Concrete classes',
        'None'
      ],
      'answer': 'Contracts for classes',
    },
    {
      'question': 'What is the output of 5 + 2 + "3"?',
      'options': ['53', '73', 'Error', 'None'],
      'answer': '53',
    },
    {
      'question':
          'Which of the following is not a primitive data type in Java?',
      'options': ['int', 'char', 'String', 'float'],
      'answer': 'String',
    },
    {
      'question': 'What keyword is used to inherit a class in Java?',
      'options': ['inherits', 'extends', 'implements', 'base'],
      'answer': 'extends',
    },
    {
      'question': 'What is the main method signature in Java?',
      'options': [
        'public static void main()',
        'void main(String args[])',
        'public main(String args)',
        'static void main(String args)'
      ],
      'answer': 'public static void main(String args[])',
    },
    {
      'question': 'What is the purpose of the final keyword in Java?',
      'options': [
        'To declare constants',
        'To prevent method overriding',
        'To prevent inheritance',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'Which of the following is a collection framework class in Java?',
      'options': ['ArrayList', 'HashMap', 'LinkedList', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question': 'What is a package in Java?',
      'options': [
        'A collection of classes',
        'A class type',
        'A variable type',
        'None of the above'
      ],
      'answer': 'A collection of classes',
    },
    {
      'question': 'What is the use of the super keyword in Java?',
      'options': [
        'To call the parent class constructor',
        'To call a method in the parent class',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What is the size of an int in Java?',
      'options': ['16 bits', '32 bits', '64 bits', '8 bits'],
      'answer': '32 bits',
    },
    {
      'question': 'What is the purpose of the this keyword in Java?',
      'options': [
        'To refer to the current class instance',
        'To refer to the parent class',
        'To refer to static methods',
        'None of the above'
      ],
      'answer': 'To refer to the current class instance',
    },
    {
      'question': 'What is an abstract class in Java?',
      'options': [
        'A class that cannot be instantiated',
        'A class with abstract methods',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'Which of the following is true about Java?',
      'options': [
        'Java is platform-independent',
        'Java is a compiled language',
        'Java is an interpreted language',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the purpose of the static keyword?',
      'options': [
        'To declare a class variable',
        'To declare a method that belongs to the class',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What does JVM stand for?',
      'options': [
        'Java Visual Machine',
        'Java Variable Machine',
        'Java Virtual Machine',
        'Java Verified Machine'
      ],
      'answer': 'Java Virtual Machine',
    },
    {
      'question': 'What is the output of 10 % 3?',
      'options': ['3', '1', '10', '0'],
      'answer': '1',
    },
    {
      'question': 'What is a nested class?',
      'options': [
        'A class defined within another class',
        'A class with multiple subclasses',
        'A class that cannot be instantiated',
        'None of the above'
      ],
      'answer': 'A class defined within another class',
    },
    {
      'question': 'What does the break statement do?',
      'options': [
        'Exits the loop',
        'Exits the method',
        'Continues the loop',
        'None of the above'
      ],
      'answer': 'Exits the loop',
    },
    {
      'question': 'What is the default value of an integer variable in Java?',
      'options': ['0', '1', 'null', 'undefined'],
      'answer': '0',
    },
    {
      'question': 'What is the purpose of the instanceof operator?',
      'options': [
        'To check if an object is an instance of a class',
        'To create a new instance of a class',
        'To check if two objects are equal',
        'None of the above'
      ],
      'answer': 'To check if an object is an instance of a class',
    },
    {
      'question': 'Which of the following is an interface?',
      'options': ['ArrayList', 'List', 'HashMap', 'String'],
      'answer': 'List',
    },
    {
      'question': 'What is the difference between a Set and a List?',
      'options': [
        'Set allows duplicate values, List does not',
        'List allows duplicate values, Set does not',
        'Both allow duplicates',
        'None'
      ],
      'answer': 'List allows duplicate values, Set does not',
    },
    {
      'question': 'Which keyword is used to create a new thread in Java?',
      'options': ['new', 'create', 'start', 'run'],
      'answer': 'new',
    },
    {
      'question': 'What is a runtime exception?',
      'options': [
        'An exception that occurs during compilation',
        'An exception that occurs during execution',
        'An exception that cannot be handled',
        'None of the above'
      ],
      'answer': 'An exception that occurs during execution',
    },
    {
      'question': 'What is the purpose of the volatile keyword?',
      'options': [
        'To prevent compiler optimization',
        'To ensure visibility of shared variables',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What is the output of the expression (true && false)?',
      'options': ['true', 'false', '1', '0'],
      'answer': 'false',
    },
    {
      'question': 'What is the function of the wait() method?',
      'options': [
        'To pause the execution of a thread',
        'To release the lock on an object',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What does the term garbage collection mean in Java?',
      'options': [
        'Automatically deallocating memory',
        'Manually deallocating memory',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Automatically deallocating memory',
    },
    {
      'question': 'What is the default size of an ArrayList?',
      'options': ['10', '20', '5', '0'],
      'answer': '10',
    },
    {
      'question': 'Which of the following is not a loop structure in Java?',
      'options': ['for', 'while', 'do while', 'repeat'],
      'answer': 'repeat',
    },
    {
      'question': 'What is a lambda expression in Java?',
      'options': [
        'A way to create anonymous functions',
        'A way to create interfaces',
        'A way to create arrays',
        'None of the above'
      ],
      'answer': 'A way to create anonymous functions',
    },
    {
      'question':
          'What is the difference between method overloading and method overriding?',
      'options': [
        'Overloading has the same name but different parameters, overriding has the same name and parameters',
        'Both are the same',
        'Overloading is for static methods, overriding is for instance methods',
        'None'
      ],
      'answer':
          'Overloading has the same name but different parameters, overriding has the same name and parameters',
    },
    {
      'question': 'What is the purpose of the yield() method?',
      'options': [
        'To pause the current thread',
        'To terminate the current thread',
        'To allow other threads to execute',
        'None of the above'
      ],
      'answer': 'To allow other threads to execute',
    },
    {
      'question': 'Which method is used to start a thread?',
      'options': ['run()', 'start()', 'init()', 'execute()'],
      'answer': 'start()',
    },
    {
      'question': 'What is the significance of the hashCode() method?',
      'options': [
        'To uniquely identify an object',
        'To compare two objects',
        'To calculate the memory address',
        'None of the above'
      ],
      'answer': 'To uniquely identify an object',
    },
    {
      'question': 'What does the throw statement do?',
      'options': [
        'Throws an exception',
        'Creates a new exception',
        'Catches an exception',
        'None of the above'
      ],
      'answer': 'Throws an exception',
    },
    {
      'question': 'What is the output of 5 + 2 * 3?',
      'options': ['21', '11', '16', 'None'],
      'answer': '11',
    },
    {
      'question': 'What is an enum in Java?',
      'options': [
        'A way to define a set of constants',
        'A way to define a class',
        'A way to define an interface',
        'None of the above'
      ],
      'answer': 'A way to define a set of constants',
    },
    {
      'question':
          'Which of the following is used to handle checked exceptions?',
      'options': [
        'try-catch block',
        'throw keyword',
        'throws keyword',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the output of the expression 10 / 3?',
      'options': ['3', '3.0', '3.3333', 'None'],
      'answer': '3',
    },
    {
      'question': 'What is method overriding?',
      'options': [
        'Defining a method in a subclass with the same name and parameters as in the parent class',
        'Defining a method in the same class',
        'Both a and b',
        'None of the above'
      ],
      'answer':
          'Defining a method in a subclass with the same name and parameters as in the parent class',
    },
    {
      'question':
          'Which of the following is not a part of Java exception handling?',
      'options': ['throw', 'throws', 'catch', 'raise'],
      'answer': 'raise',
    },
    {
      'question': 'What does the finalize() method do?',
      'options': [
        'Called by the garbage collector before an object is deleted',
        'Called when a method is finished',
        'Called when a class is initialized',
        'None of the above'
      ],
      'answer': 'Called by the garbage collector before an object is deleted',
    },
    {
      'question': 'What is the purpose of the import statement?',
      'options': [
        'To include other classes and packages',
        'To define a new class',
        'To create an interface',
        'None of the above'
      ],
      'answer': 'To include other classes and packages',
    },
    {
      'question': 'Which of the following is a valid declaration of a string?',
      'options': [
        'String s = "Hello";',
        'String s = new String("Hello");',
        'Both a and b',
        'None'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What does the continue statement do?',
      'options': [
        'Skips the current iteration of a loop',
        'Exits the loop',
        'Ends the program',
        'None of the above'
      ],
      'answer': 'Skips the current iteration of a loop',
    },
    {
      'question': 'What is the use of the clone() method?',
      'options': [
        'To create a copy of an object',
        'To delete an object',
        'To compare two objects',
        'None of the above'
      ],
      'answer': 'To create a copy of an object',
    },
    {
      'question': 'Which of the following is not a keyword in Java?',
      'options': ['void', 'class', 'interface', 'method'],
      'answer': 'method',
    },
    {
      'question': 'What is a data structure?',
      'options': [
        'A way to store and organize data',
        'A method to process data',
        'A function to manipulate data',
        'None of the above'
      ],
      'answer': 'A way to store and organize data',
    },
    {
      'question': 'What is the output of the expression 3 == 3.0?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'true',
    },
    {
      'question': 'What is the purpose of the StringBuilder class?',
      'options': [
        'To create mutable strings',
        'To create immutable strings',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'To create mutable strings',
    },
    {
      'question': 'What is the role of the main thread in Java?',
      'options': [
        'To execute the main method',
        'To create new threads',
        'To manage memory',
        'None of the above'
      ],
      'answer': 'To execute the main method',
    },
    {
      'question': 'What is the use of the System.out.println() method?',
      'options': [
        'To print text to the console',
        'To create a new line',
        'To read input',
        'None of the above'
      ],
      'answer': 'To print text to the console',
    },
    {
      'question':
          'What is the difference between StringBuffer and StringBuilder?',
      'options': [
        'StringBuffer is synchronized, StringBuilder is not',
        'Both are the same',
        'StringBuilder is synchronized, StringBuffer is not',
        'None'
      ],
      'answer': 'StringBuffer is synchronized, StringBuilder is not',
    },
    {
      'question': 'What does the parseInt() method do?',
      'options': [
        'Converts a string to an integer',
        'Converts an integer to a string',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Converts a string to an integer',
    },
    {
      'question':
          'Which of the following can be used to iterate through a collection?',
      'options': ['for loop', 'while loop', 'Iterator', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the purpose of the toString() method?',
      'options': [
        'To return a string representation of an object',
        'To convert a string to an integer',
        'To compare two strings',
        'None of the above'
      ],
      'answer': 'To return a string representation of an object',
    },
    {
      'question': 'What is the purpose of the super() constructor?',
      'options': [
        'To call the parent class constructor',
        'To create a new object',
        'To initialize variables',
        'None of the above'
      ],
      'answer': 'To call the parent class constructor',
    },
    {
      'question': 'Which of the following is true about Java arrays?',
      'options': [
        'Arrays are fixed in size',
        'Arrays can hold different data types',
        'Both a and b',
        'None'
      ],
      'answer': 'Arrays are fixed in size',
    },
    {
      'question': 'What is the purpose of the main(String[] args) parameter?',
      'options': [
        'To accept command-line arguments',
        'To accept input from the user',
        'To return a value',
        'None of the above'
      ],
      'answer': 'To accept command-line arguments',
    },
    {
      'question':
          'Which of the following is an example of a checked exception?',
      'options': [
        'NullPointerException',
        'IOException',
        'ArithmeticException',
        'ArrayIndexOutOfBoundsException'
      ],
      'answer': 'IOException',
    },
    {
      'question': 'What does the type casting operator do?',
      'options': [
        'Converts a variable from one type to another',
        'Creates a new variable',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Converts a variable from one type to another',
    },
    {
      'question': 'What is a syntax error?',
      'options': [
        'An error in the code syntax',
        'An error during runtime',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'An error in the code syntax',
    },
    {
      'question':
          'What is the output of the following code: int a = 5; int b = 2; System.out.println(a / b);',
      'options': ['2', '2.5', '3', 'None'],
      'answer': '2',
    },
    {
      'question': 'Which of the following is a method of the Math class?',
      'options': ['abs()', 'max()', 'min()', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the purpose of the instanceof operator?',
      'options': [
        'To test if an object is an instance of a class',
        'To compare two objects',
        'To check for null',
        'None of the above'
      ],
      'answer': 'To test if an object is an instance of a class',
    },
    {
      'question':
          'What is the difference between the ArrayList and LinkedList classes?',
      'options': [
        'ArrayList is faster for random access, LinkedList is faster for sequential access',
        'Both are the same',
        'LinkedList is faster for random access, ArrayList is faster for sequential access',
        'None'
      ],
      'answer':
          'ArrayList is faster for random access, LinkedList is faster for sequential access',
    },
    {
      'question':
          'Which of the following is a valid way to create an object in Java?',
      'options': [
        'ClassName obj = new ClassName();',
        'ClassName obj;',
        'ClassName obj = new ClassName;',
        'None'
      ],
      'answer': 'ClassName obj = new ClassName();',
    },
    {
      'question': 'What does the join() method do in a thread?',
      'options': [
        'Waits for a thread to die',
        'Starts a thread',
        'Interrupts a thread',
        'None of the above'
      ],
      'answer': 'Waits for a thread to die',
    },
    {
      'question':
          'Which of the following is not a valid way to compare two strings?',
      'options': [
        '== operator',
        '.equals() method',
        'compareTo() method',
        'None'
      ],
      'answer': '== operator',
    },
    {
      'question': 'What does the split() method do?',
      'options': [
        'Splits a string into an array',
        'Joins two strings',
        'Compares two strings',
        'None of the above'
      ],
      'answer': 'Splits a string into an array',
    },
    {
      'question': 'What is the purpose of the finally block?',
      'options': [
        'To execute code regardless of whether an exception occurred',
        'To catch exceptions',
        'To define a method',
        'None of the above'
      ],
      'answer': 'To execute code regardless of whether an exception occurred',
    },
    {
      'question': 'What is a thread pool?',
      'options': [
        'A group of worker threads',
        'A single thread',
        'A method to execute multiple threads',
        'None of the above'
      ],
      'answer': 'A group of worker threads',
    },
    {
      'question': 'Which of the following is a Java keyword?',
      'options': ['import', 'include', 'require', 'load'],
      'answer': 'import',
    },
    {
      'question':
          'What is the output of the following code: System.out.println(10 % 3);',
      'options': ['3', '1', '10', 'None'],
      'answer': '1',
    },
    {
      'question': 'What is the role of the garbage collector?',
      'options': [
        'To free up memory by deleting unused objects',
        'To manage threads',
        'To optimize performance',
        'None of the above'
      ],
      'answer': 'To free up memory by deleting unused objects',
    },
    {
      'question': 'What does the keyword static indicate?',
      'options': [
        'A variable or method belongs to the class rather than instances of the class',
        'A variable or method is constant',
        'A variable or method is private',
        'None of the above'
      ],
      'answer':
          'A variable or method belongs to the class rather than instances of the class',
    },
    {
      'question': 'What is the output of the expression "Hello".length()?',
      'options': ['5', '4', '6', 'None'],
      'answer': '5',
    },
    {
      'question':
          'Which of the following is an example of a runtime exception?',
      'options': [
        'ArrayIndexOutOfBoundsException',
        'IOException',
        'ClassNotFoundException',
        'None'
      ],
      'answer': 'ArrayIndexOutOfBoundsException',
    },
    {
      'question': 'What does the keyword final indicate?',
      'options': [
        'A variable, method, or class cannot be changed',
        'A variable is static',
        'A method is abstract',
        'None of the above'
      ],
      'answer': 'A variable, method, or class cannot be changed',
    },
    {
      'question': 'Which of the following is used to create a new thread?',
      'options': ['Runnable interface', 'Thread class', 'Both a and b', 'None'],
      'answer': 'Both a and b',
    },
    {
      'question': 'What is the use of the assert statement?',
      'options': [
        'To create test cases',
        'To check assumptions during runtime',
        'To handle exceptions',
        'None of the above'
      ],
      'answer': 'To check assumptions during runtime',
    },
    {
      'question': 'What is the purpose of the void keyword?',
      'options': [
        'Indicates a method does not return a value',
        'Indicates a method returns an integer',
        'Indicates a method is private',
        'None of the above'
      ],
      'answer': 'Indicates a method does not return a value',
    },
    {
      'question': 'What is the output of the expression "5" + 2?',
      'options': ['7', '52', 'Error', 'None'],
      'answer': '52',
    },
    {
      'question': 'What is the use of the synchronize keyword?',
      'options': [
        'To prevent thread interference',
        'To optimize performance',
        'To create synchronized methods',
        'None of the above'
      ],
      'answer': 'To prevent thread interference',
    },
    {
      'question': 'Which of the following is a valid comment in Java?',
      'options': [
        '// This is a comment',
        '/* This is a comment */',
        '# This is a comment',
        'Both a and b'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What does the keyword volatile indicate?',
      'options': [
        'A variable can be modified by multiple threads',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'A variable can be modified by multiple threads',
    },
    {
      'question': 'What is the purpose of the break statement?',
      'options': [
        'To exit a loop or switch statement',
        'To skip an iteration',
        'To end a program',
        'None of the above'
      ],
      'answer': 'To exit a loop or switch statement',
    },
    {
      'question': 'What is the output of the expression "true && false"?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'false',
    },
    {
      'question':
          'Which of the following is used to handle exceptions in Java?',
      'options': ['try', 'catch', 'finally', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question': 'What does the keyword transient indicate?',
      'options': [
        'A variable should not be serialized',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'A variable should not be serialized',
    },
    {
      'question': 'What is the purpose of the Comparable interface?',
      'options': [
        'To define a natural ordering for objects',
        'To compare two objects',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What is the output of the expression "false || true"?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'true',
    },
    {
      'question': 'What is the use of the StringTokenizer class?',
      'options': [
        'To split strings into tokens',
        'To join strings',
        'To compare strings',
        'None of the above'
      ],
      'answer': 'To split strings into tokens',
    },
    {
      'question': 'What does the keyword synchronized indicate?',
      'options': [
        'A method can be accessed by only one thread at a time',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'A method can be accessed by only one thread at a time',
    },
    {
      'question': 'What is the output of the expression "5 == 5.0"?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'true',
    },
    {
      'question': 'What does the keyword native indicate?',
      'options': [
        'A method is implemented in native code',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'A method is implemented in native code',
    },
    {
      'question':
          'Which of the following is used to create an immutable object?',
      'options': [
        'String class',
        'StringBuilder class',
        'StringBuffer class',
        'None of the above'
      ],
      'answer': 'String class',
    },
    {
      'question': 'What is the purpose of the HashMap class?',
      'options': [
        'To store key-value pairs',
        'To store a list of elements',
        'To create a set of elements',
        'None of the above'
      ],
      'answer': 'To store key-value pairs',
    },
    {
      'question': 'What does the keyword abstract indicate?',
      'options': [
        'A class cannot be instantiated',
        'A method has no body',
        'Both a and b',
        'None of the above'
      ],
      'answer': 'Both a and b',
    },
    {
      'question': 'What is the output of the expression "10 / 2 * 3"?',
      'options': ['15', '5', '6', 'None'],
      'answer': '15',
    },
    {
      'question': 'What is the use of the ListIterator interface?',
      'options': [
        'To iterate over a list in both directions',
        'To iterate over a collection',
        'To create a list',
        'None of the above'
      ],
      'answer': 'To iterate over a list in both directions',
    },
    {
      'question': 'What is the output of the expression "2 + 2 + 2 + "2""?',
      'options': ['6', '22', 'Error', 'None'],
      'answer': '222',
    },
    {
      'question': 'What is the purpose of the this keyword?',
      'options': [
        'To refer to the current object',
        'To create a new object',
        'To call a method',
        'None of the above'
      ],
      'answer': 'To refer to the current object',
    },
    {
      'question': 'What does the keyword strictfp indicate?',
      'options': [
        'Floating-point calculations follow strict rules',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'Floating-point calculations follow strict rules',
    },
    {
      'question': 'What is the use of the java.util.Date class?',
      'options': [
        'To represent date and time',
        'To format dates',
        'To manipulate strings',
        'None of the above'
      ],
      'answer': 'To represent date and time',
    },
    {
      'question': 'What does the keyword instanceof do?',
      'options': [
        'Checks if an object is an instance of a class',
        'Creates a new instance of a class',
        'Destroys an object',
        'None of the above'
      ],
      'answer': 'Checks if an object is an instance of a class',
    },
    {
      'question': 'What is the output of the expression "true && true"?',
      'options': ['true', 'false', 'Error', 'None'],
      'answer': 'true',
    },
    {
      'question': 'What does the keyword synchronized indicate?',
      'options': [
        'A method can be accessed by only one thread at a time',
        'A variable is constant',
        'A variable is private',
        'None of the above'
      ],
      'answer': 'A method can be accessed by only one thread at a time',
    }
  ];

  List<Map<String, dynamic>> selectedQuestions = [];
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];
  int totalQuestions = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Java Quiz', style: TextStyle(color: Colors.white)),
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
                totalQuestions = count > questions.length
                    ? questions.length
                    : count; // Limit to available questions
                selectedQuestions = _getRandomQuestions(totalQuestions);
                selectedAnswers = List.filled(totalQuestions, '');
                currentQuestionIndex = 0;
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: selectedQuestions[currentQuestionIndex]['options']
                  .map<Widget>((option) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10), // Add margin for spacing
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purpleAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                    ),
                    onPressed: () => selectAnswer(option),
                    child: Text(option, style: const TextStyle(fontSize: 18)),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getRandomQuestions(int count) {
    // Shuffle the list of questions and select the number specified by the user
    final random = Random();
    List<Map<String, dynamic>> shuffledQuestions = List.from(questions)
      ..shuffle(random);
    return shuffledQuestions.take(count).toList();
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;
      if (currentQuestionIndex < selectedQuestions.length - 1) {
        currentQuestionIndex++;
      } else {
        _showResultDialog();
      }
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
        title: const Text('Quiz Completed!',
            style: TextStyle(color: Colors.deepPurple)),
        content: Text('Your score is $score out of $totalQuestions',
            style: const TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            child: const Text('OK', style: TextStyle(color: Colors.deepPurple)),
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              // Navigate to analysis screen
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
