import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../quizzes/quiz_analysis.dart'; // Import the analysis screen

class JavaScriptQuizScreen extends StatefulWidget {
  @override
  _JavaScriptQuizScreenState createState() => _JavaScriptQuizScreenState();
}

class _JavaScriptQuizScreenState extends State<JavaScriptQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is JavaScript?',
      'options': [
        'A programming language',
        'A markup language',
        'A styling language',
        'A database language'
      ],
      'answer': 'A programming language',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(typeof NaN);',
      'options': ['number', 'undefined', 'NaN', 'Error'],
      'answer': 'number',
    },
    {
      'question': 'Which of the following correctly creates a promise in JavaScript?',
      'options': [
        'new Promise((resolve, reject) => {})',
        'Promise.new((resolve, reject) => {})',
        'new Promise(resolve, reject => {})',
        'Promise((resolve, reject) => {})'
      ],
      'answer': 'new Promise((resolve, reject) => {})',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(0.1 + 0.2 === 0.3);',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'What is the purpose of the "bind" method in JavaScript?',
      'options': [
        'To create a new function that, when called, has its "this" keyword set to the provided value.',
        'To create a copy of an object.',
        'To concatenate two functions.',
        'To check if a function is callable.'
      ],
      'answer': 'To create a new function that, when called, has its "this" keyword set to the provided value.',
    },
    {
      'question': 'What will be the output of the following code?\n\nvar a = 1;\nsetTimeout(() => { console.log(a); }, 0);\na = 2;',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '2',
    },
    {
      'question': 'Which of the following is not a JavaScript data type?',
      'options': [
        'Boolean',
        'Undefined',
        'Character',
        'Null'
      ],
      'answer': 'Character',
    },
    {
      'question': 'What is the output of the following code?\n\nconsole.log([1] == [1]);',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'What is the purpose of the "closure" in JavaScript?',
      'options': [
        'To create private variables.',
        'To define a new variable scope.',
        'To combine two functions.',
        'To execute a function immediately.'
      ],
      'answer': 'To create private variables.',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(1 + "2" - 1);',
      'options': ['1', '2', '3', 'Error'],
      'answer': '2',
    },
    {
      'question': 'Which method is used to combine two or more arrays in JavaScript?',
      'options': [
        'Array.concat()',
        'Array.join()',
        'Array.merge()',
        'Array.append()'
      ],
      'answer': 'Array.concat()',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("Hello" === "hello");',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'Which of the following correctly creates an object in JavaScript?',
      'options': [
        'const obj = {};',
        'const obj = new Object();',
        'const obj = Object.create();',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the output of the following code?\n\nconsole.log(2 + "2" === 22);',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'Which operator is used to create a new object in JavaScript?',
      'options': [
        'new',
        'create',
        'object',
        'class'
      ],
      'answer': 'new',
    },
    {
      'question': 'What will be the output of the following code?\n\nvar x = "5";\nconsole.log(x + 1);\n',
      'options': ['51', '6', 'undefined', 'Error'],
      'answer': '51',
    },
    {
      'question': 'What is the purpose of the "this" keyword in JavaScript?',
      'options': [
        'To refer to the current object.',
        'To create a new object.',
        'To refer to the global object.',
        'To access variables in an array.'
      ],
      'answer': 'To refer to the current object.',
    },
    {
      'question': 'What is the output of the following code?\n\nfunction foo() { return; }\nconsole.log(foo());',
      'options': ['undefined', 'null', 'Error', 'void'],
      'answer': 'undefined',
    },
    {
      'question': 'Which of the following can be used to handle exceptions in JavaScript?',
      'options': [
        'try-catch blocks',
        'if statements',
        'switch statements',
        'while loops'
      ],
      'answer': 'try-catch blocks',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(typeof null);',
      'options': ['object', 'null', 'undefined', 'Error'],
      'answer': 'object',
    },
    {
      'question': 'Which of the following is used to define a function in JavaScript?',
      'options': [
        'function myFunction() {}',
        'myFunction() {}',
        'def myFunction() {}',
        'func myFunction() {}'
      ],
      'answer': 'function myFunction() {}',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(5 === "5");',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'What is the output of the following code?\n\nconsole.log([1, 2] == [1, 2]);',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'Which of the following is not a valid variable name in JavaScript?',
      'options': [
        'var1',
        '1var',
        '_var',
        '\$var'
      ],
      'answer': '1var',
    },
    {
      'question': 'What will be the output of the following code?\n\nvar a = 1;\nsetTimeout(() => { console.log(a); }, 0);\na = 2;',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '2',
    },

    {
      'question': 'What will be the output of the following code?\n\nconsole.log(typeof NaN);',
      'options': ['number', 'undefined', 'NaN', 'Error'],
      'answer': 'number',
    },
    {
      'question': 'What is the purpose of the "bind" method in JavaScript?',
      'options': [
        'To create a new function that, when called, has its "this" keyword set to the provided value.',
        'To create a copy of an object.',
        'To concatenate two functions.',
        'To check if a function is callable.'
      ],
      'answer': 'To create a new function that, when called, has its "this" keyword set to the provided value.',
    },
    {
      'question': 'What will be the output of the following code?\n\nvar a = 1;\nsetTimeout(() => { console.log(a); }, 0);\na = 2;',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '2',
    },
    {
      'question': 'Which of the following is not a JavaScript data type?',
      'options': [
        'Boolean',
        'Undefined',
        'Character',
        'Null'
      ],
      'answer': 'Character',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log([1] == [1]);',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'What is the purpose of a closure in JavaScript?',
      'options': [
        'To create private variables.',
        'To define a new variable scope.',
        'To combine two functions.',
        'To execute a function immediately.'
      ],
      'answer': 'To create private variables.',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(1 + "2" - 1);',
      'options': ['1', '2', '3', 'Error'],
      'answer': '2',
    },
    {
      'question': 'Which method is used to combine two or more arrays in JavaScript?',
      'options': [
        'Array.concat()',
        'Array.join()',
        'Array.merge()',
        'Array.append()'
      ],
      'answer': 'Array.concat()',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("Hello" === "hello");',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'Which of the following correctly creates an object in JavaScript?',
      'options': [
        'const obj = {};',
        'const obj = new Object();',
        'const obj = Object.create();',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(2 + "2" === 22);',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'Which operator is used to create a new object in JavaScript?',
      'options': [
        'new',
        'create',
        'object',
        'class'
      ],
      'answer': 'new',
    },
    {
      'question': 'What will be the output of the following code?\n\nvar x = "5";\nconsole.log(x + 1);',
      'options': ['51', '6', 'undefined', 'Error'],
      'answer': '51',
    },
    {
      'question': 'What is the purpose of the "this" keyword in JavaScript?',
      'options': [
        'To refer to the current object.',
        'To create a new object.',
        'To refer to the global object.',
        'To access variables in an array.'
      ],
      'answer': 'To refer to the current object.',
    },
    {
      'question': 'What is the output of the following code?\n\nfunction foo() { return; }\nconsole.log(foo());',
      'options': ['undefined', 'null', 'Error', 'void'],
      'answer': 'undefined',
    },
    {
      'question': 'Which of the following can be used to handle exceptions in JavaScript?',
      'options': [
        'try-catch blocks',
        'if statements',
        'switch statements',
        'while loops'
      ],
      'answer': 'try-catch blocks',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(typeof null);',
      'options': ['object', 'null', 'undefined', 'Error'],
      'answer': 'object',
    },
    {
      'question': 'Which of the following is used to define a function in JavaScript?',
      'options': [
        'function myFunction() {}',
        'myFunction() {}',
        'def myFunction() {}',
        'func myFunction() {}'
      ],
      'answer': 'function myFunction() {}',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(5 === "5");',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'What is the output of the following code?\n\nconsole.log([1, 2] == [1, 2]);',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'Which of the following is not a valid variable name in JavaScript?',
      'options': [
        'var1',
        '1var',
        '_var',
        '\$var' // Escaping the dollar sign
      ],
      'answer': '1var',
    },
    {
      'question': 'What will be the output of the following code?\n\nvar a = 1;\nfunction foo() { var a = 2; }\nfoo();\nconsole.log(a);',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '1',
    },
    {
      'question': 'Which of the following is true about the "async" keyword in JavaScript?',
      'options': [
        'It makes a function return a promise.',
        'It is used to define a generator function.',
        'It is used to declare a constant.',
        'It makes a function synchronous.'
      ],
      'answer': 'It makes a function return a promise.',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log([1, 2] + [3, 4]);',
      'options': ['1,23,4', '1,2,3,4', 'undefined', 'Error'],
      'answer': '1,23,4',
    },
    {
      'question': 'Which of the following is used to terminate a loop in JavaScript?',
      'options': [
        'break',
        'continue',
        'exit',
        'return'
      ],
      'answer': 'break',
    },
    {
      'question': 'What is the output of the following code?\n\nlet x = 1;\nconst y = x++;\nconsole.log(y);',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '1',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("2" + 2 - 2);',
      'options': ['20', '2', 'Error', 'undefined'],
      'answer': '2',
    },
    {
      'question': 'Which of the following is used to create a new array in JavaScript?',
      'options': [
        'Array()',
        'new Array()',
        '[]',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the output of the following code?\n\nconsole.log(5 + "5" - 5);',
      'options': ['55', '5', '10', 'Error'],
      'answer': '5',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("Hello" + "World");',
      'options': ['HelloWorld', 'Hello World', 'undefined', 'Error'],
      'answer': 'HelloWorld',
    },
    {
      'question': 'Which of the following is a method for creating an array from a string in JavaScript?',
      'options': [
        'split()',
        'join()',
        'map()',
        'filter()'
      ],
      'answer': 'split()',
    },
    {
      'question': 'What is the output of the following code?\n\nlet a = "Hello";\nlet b = a;\nb += " World";\nconsole.log(a);',
      'options': ['Hello', 'Hello World', 'undefined', 'Error'],
      'answer': 'Hello',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(!!"Hello");',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'true',
    },
    {
      'question': 'Which of the following is true about "undefined" in JavaScript?',
      'options': [
        'It is a type.',
        'It is a value.',
        'It is both a type and a value.',
        'None of the above'
      ],
      'answer': 'It is both a type and a value.',
    },
    {
      'question': 'What will be the output of the following code?\n\nlet x = {a: 1};\nlet y = x;\ny.a = 2;\nconsole.log(x.a);',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '2',
    },
    {
      'question': 'What is the purpose of the "Array.from()" method in JavaScript?',
      'options': [
        'To create an array from an iterable object.',
        'To convert an array to an object.',
        'To combine two arrays.',
        'To remove duplicates from an array.'
      ],
      'answer': 'To create an array from an iterable object.',
    },

    {
      'question': 'What is the purpose of the "Promise.all()" method in JavaScript?',
      'options': [
        'To execute multiple promises in parallel.',
        'To execute promises in sequence.',
        'To combine results from multiple promises.',
        'To cancel promises.'
      ],
      'answer': 'To execute multiple promises in parallel.',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("1" == 1);',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'true',
    },
    {
      'question': 'Which of the following methods can be used to convert a string to a number in JavaScript?',
      'options': [
        'parseInt()',
        'parseFloat()',
        'Number()',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the output of the following code?\n\nconsole.log([2] == 2);',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'true',
    },
    {
      'question': 'What is a closure in JavaScript?',
      'options': [
        'A function that captures the lexical scope in which it was created.',
        'A way to create private variables.',
        'A method for error handling.',
        'A type of object.'
      ],
      'answer': 'A function that captures the lexical scope in which it was created.',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(typeof function() {});',
      'options': ['function', 'undefined', 'object', 'Error'],
      'answer': 'function',
    },
    {
      'question': 'Which of the following is true about the "let" keyword in JavaScript?',
      'options': [
        'It creates a block-scoped variable.',
        'It creates a globally-scoped variable.',
        'It creates a constant variable.',
        'It cannot be reassigned.'
      ],
      'answer': 'It creates a block-scoped variable.',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("a" > "b");',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'Which of the following is the correct way to add a comment in JavaScript?',
      'options': [
        '// This is a comment',
        '/* This is a comment */',
        '// This is a comment\n/* This is a comment */',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the output of the following code?\n\nconsole.log([1, 2, 3].map(x => x * 2));',
      'options': ['[2, 4, 6]', '[1, 2, 3]', 'undefined', 'Error'],
      'answer': '[2, 4, 6]',
    },
    {
      'question': 'Which of the following is used to handle asynchronous operations in JavaScript?',
      'options': [
        'Promise',
        'Callback',
        'Async/Await',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What will be the output of the following code?\n\nvar a = 1;\nfunction foo() { var a = 2; }\nfoo();\nconsole.log(a);',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '1',
    },
    {
      'question': 'Which of the following is true about the "async" keyword in JavaScript?',
      'options': [
        'It makes a function return a promise.',
        'It is used to define a generator function.',
        'It is used to declare a constant.',
        'It makes a function synchronous.'
      ],
      'answer': 'It makes a function return a promise.',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log([1, 2] + [3, 4]);',
      'options': ['1,23,4', '1,2,3,4', 'undefined', 'Error'],
      'answer': '1,23,4',
    },
    {
      'question': 'Which of the following is used to terminate a loop in JavaScript?',
      'options': [
        'break',
        'continue',
        'exit',
        'return'
      ],
      'answer': 'break',
    },
    {
      'question': 'What is the output of the following code?\n\nlet x = 1;\nconst y = x++;\nconsole.log(y);',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '1',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("2" + 2 - 2);',
      'options': ['20', '2', 'Error', 'undefined'],
      'answer': '2',
    },
    {
      'question': 'Which of the following is used to create a new array in JavaScript?',
      'options': [
        'Array()',
        'new Array()',
        '[]',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the output of the following code?\n\nconsole.log(5 + "5" - 5);',
      'options': ['55', '5', '10', 'Error'],
      'answer': '5',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("Hello" + "World");',
      'options': ['HelloWorld', 'Hello World', 'undefined', 'Error'],
      'answer': 'HelloWorld',
    },
    {
      'question': 'Which of the following is a method for creating an array from a string in JavaScript?',
      'options': [
        'split()',
        'join()',
        'map()',
        'filter()'
      ],
      'answer': 'split()',
    },
    {
      'question': 'What is the output of the following code?\n\nlet a = "Hello";\nlet b = a;\nb += " World";\nconsole.log(a);',
      'options': ['Hello', 'Hello World', 'undefined', 'Error'],
      'answer': 'Hello',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(!!"Hello");',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'true',
    },
    {
      'question': 'Which of the following is true about "undefined" in JavaScript?',
      'options': [
        'It is a type.',
        'It is a value.',
        'It is both a type and a value.',
        'None of the above'
      ],
      'answer': 'It is both a type and a value.',
    },
    {
      'question': 'What will be the output of the following code?\n\nlet x = {a: 1};\nlet y = x;\ny.a = 2;\nconsole.log(x.a);',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '2',
    },
    {
      'question': 'What is the purpose of the "Array.from()" method in JavaScript?',
      'options': [
        'To create an array from an iterable object.',
        'To convert an array to an object.',
        'To combine two arrays.',
        'To remove duplicates from an array.'
      ],
      'answer': 'To create an array from an iterable object.',
    },

    {
      'question': 'What is the purpose of the "Promise.all()" method in JavaScript?',
      'options': [
        'To execute multiple promises in parallel.',
        'To execute promises in sequence.',
        'To combine results from multiple promises.',
        'To cancel promises.'
      ],
      'answer': 'To execute multiple promises in parallel.',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("1" == 1);',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'true',
    },
    {
      'question': 'Which of the following methods can be used to convert a string to a number in JavaScript?',
      'options': [
        'parseInt()',
        'parseFloat()',
        'Number()',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the output of the following code?\n\nconsole.log([2] == 2);',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'true',
    },
    {
      'question': 'What is a closure in JavaScript?',
      'options': [
        'A function that captures the lexical scope in which it was created.',
        'A way to create private variables.',
        'A method for error handling.',
        'A type of object.'
      ],
      'answer': 'A function that captures the lexical scope in which it was created.',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(typeof function() {});',
      'options': ['function', 'undefined', 'object', 'Error'],
      'answer': 'function',
    },
    {
      'question': 'Which of the following is true about the "let" keyword in JavaScript?',
      'options': [
        'It creates a block-scoped variable.',
        'It creates a globally-scoped variable.',
        'It creates a constant variable.',
        'It cannot be reassigned.'
      ],
      'answer': 'It creates a block-scoped variable.',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("a" > "b");',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'false',
    },
    {
      'question': 'Which of the following is the correct way to add a comment in JavaScript?',
      'options': [
        '// This is a comment',
        '/* This is a comment */',
        '// This is a comment\n/* This is a comment */',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the output of the following code?\n\nconsole.log([1, 2, 3].map(x => x * 2));',
      'options': ['[2, 4, 6]', '[1, 2, 3]', 'undefined', 'Error'],
      'answer': '[2, 4, 6]',
    },
    {
      'question': 'Which of the following is used to handle asynchronous operations in JavaScript?',
      'options': [
        'Promise',
        'Callback',
        'Async/Await',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What will be the output of the following code?\n\nvar a = 1;\nfunction foo() { var a = 2; }\nfoo();\nconsole.log(a);',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '1',
    },
    {
      'question': 'Which of the following is true about the "async" keyword in JavaScript?',
      'options': [
        'It makes a function return a promise.',
        'It is used to define a generator function.',
        'It is used to declare a constant.',
        'It makes a function synchronous.'
      ],
      'answer': 'It makes a function return a promise.',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log([1, 2] + [3, 4]);',
      'options': ['1,23,4', '1,2,3,4', 'undefined', 'Error'],
      'answer': '1,23,4',
    },
    {
      'question': 'Which of the following is used to terminate a loop in JavaScript?',
      'options': [
        'break',
        'continue',
        'exit',
        'return'
      ],
      'answer': 'break',
    },
    {
      'question': 'What is the output of the following code?\n\nlet x = 1;\nconst y = x++;\nconsole.log(y);',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '1',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("2" + 2 - 2);',
      'options': ['20', '2', 'Error', 'undefined'],
      'answer': '2',
    },
    {
      'question': 'Which of the following is used to create a new array in JavaScript?',
      'options': [
        'Array()',
        'new Array()',
        '[]',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question': 'What is the output of the following code?\n\nconsole.log(5 + "5" - 5);',
      'options': ['55', '5', '10', 'Error'],
      'answer': '5',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log("Hello" + "World");',
      'options': ['HelloWorld', 'Hello World', 'undefined', 'Error'],
      'answer': 'HelloWorld',
    },
    {
      'question': 'Which of the following is a method for creating an array from a string in JavaScript?',
      'options': [
        'split()',
        'join()',
        'map()',
        'filter()'
      ],
      'answer': 'split()',
    },
    {
      'question': 'What is the output of the following code?\n\nlet a = "Hello";\nlet b = a;\nb += " World";\nconsole.log(a);',
      'options': ['Hello', 'Hello World', 'undefined', 'Error'],
      'answer': 'Hello',
    },
    {
      'question': 'What will be the output of the following code?\n\nconsole.log(!!"Hello");',
      'options': ['true', 'false', 'undefined', 'Error'],
      'answer': 'true',
    },
    {
      'question': 'Which of the following is true about "undefined" in JavaScript?',
      'options': [
        'It is a type.',
        'It is a value.',
        'It is both a type and a value.',
        'None of the above'
      ],
      'answer': 'It is both a type and a value.',
    },
    {
      'question': 'What will be the output of the following code?\n\nlet x = {a: 1};\nlet y = x;\ny.a = 2;\nconsole.log(x.a);',
      'options': ['1', '2', 'undefined', 'Error'],
      'answer': '2',
    },
    {
      'question': 'What is the purpose of the "Array.from()" method in JavaScript?',
      'options': [
        'To create an array from an iterable object.',
        'To convert an array to an object.',
        'To combine two arrays.',
        'To remove duplicates from an array.'
      ],
      'answer': 'To create an array from an iterable object.',
    },

    {
      'question': 'Which symbol is used for comments in JavaScript?',
      'options': ['//', '/*', '#', '<!--'],
      'answer': '//',
    },
    {
      'question': 'What does JSON stand for?',
      'options': [
        'JavaScript Object Notation',
        'Java Source Open Notation',
        'Java Standard Object Notation',
        'JavaScript Open Notation'
      ],
      'answer': 'JavaScript Object Notation',
    },
    {
      'question': 'What is JavaScript?',
      'options': [
        'A programming language',
        'A markup language',
        'A styling language',
        'A database language'
      ],
      'answer': 'A programming language',
    },
    {
      'question': 'What is the syntax for declaring a variable in JavaScript?',
      'options': [
        'var x = 10;',
        'let x = 10;',
        'const x = 10;',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
      'What is the difference between null and undefined in JavaScript?',
      'options': [
        'Null is a primitive value, undefined is a type',
        'Null is a type, undefined is a primitive value',
        'Both are the same',
        'None'
      ],
      'answer': 'Null is a primitive value, undefined is a type',
    },
    {
      'question': 'What is the purpose of the this keyword in JavaScript?',
      'options': [
        'To refer to the current object',
        'To refer to the global object',
        'To refer to the parent object',
        'None'
      ],
      'answer': 'To refer to the current object',
    },
    {
      'question': 'What is the syntax for creating an array in JavaScript?',
      'options': [
        'var arr = [1, 2, 3];',
        'var arr = new Array(1, 2, 3);',
        'Both',
        'None'
      ],
      'answer': 'Both',
    },
    {
      'question': 'What is the purpose of the push method in JavaScript?',
      'options': [
        'To add an element to the end of an array',
        'To remove an element from the end of an array',
        'To add an element to the beginning of an array',
        'None'
      ],
      'answer': 'To add an element to the end of an array',
    },
    {
      'question': 'What is the purpose of the pop method in JavaScript?',
      'options': [
        'To add an element to the end of an array',
        'To remove an element from the end of an array',
        'To add an element to the beginning of an array',
        'None'
      ],
      'answer': 'To remove an element from the end of an array',
    },
    {
      'question': 'What is the purpose of the shift method in JavaScript?',
      'options': [
        'To add an element to the beginning of an array',
        'To remove an element from the beginning of an array',
        'To add an element to the end of an array',
        'None'
      ],
      'answer': 'To remove an element from the beginning of an array',
    },
    {
      'question': 'What is the purpose of the unshift method in JavaScript?',
      'options': [
        'To add an element to the beginning of an array',
        'To remove an element from the beginning of an array',
        'To add an element to the end of an array',
        'None'
      ],
      'answer': 'To add an element to the beginning of an array',
    },
    {
      'question': 'What is the purpose of the splice method in JavaScript?',
      'options': [
        'To add or remove elements from an array',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To add or remove elements from an array',
    },
    {
      'question': 'What is the purpose of the slice method in JavaScript?',
      'options': [
        'To extract a portion of an array',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To extract a portion of an array',
    },
    {
      'question': 'What is the purpose of the concat method in JavaScript?',
      'options': [
        'To concatenate two or more arrays',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To concatenate two or more arrays',
    },
    {
      'question': 'What is the purpose of the join method in JavaScript?',
      'options': [
        'To join two or more arrays into a string',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To join two or more arrays into a string',
    },
    {
      'question': 'What is the purpose of the split method in JavaScript?',
      'options': [
        'To split a string into an array',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To split a string into an array',
    },
    {
      ' question': 'What is the purpose of the indexOf method in JavaScript?',
      'options': [
        'To find the index of an element in an array',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To find the index of an element in an array',
    },
    {
      'question':
      'What is the purpose of the lastIndexOf method in JavaScript?',
      'options': [
        'To find the last index of an element in an array',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To find the last index of an element in an array',
    },
    {
      'question': 'What is the purpose of the every method in JavaScript?',
      'options': [
        'To test if all elements in an array pass a test',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To test if all elements in an array pass a test',
    },
    {
      'question': 'What is the purpose of the some method in JavaScript?',
      'options': [
        'To test if at least one element in an array passes a test',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To test if at least one element in an array passes a test',
    },
    {
      'question': 'What is the purpose of the forEach method in JavaScript?',
      'options': [
        'To execute a function for each element in an array',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To execute a function for each element in an array',
    },
    {
      'question': 'What is the purpose of the map method in JavaScript?',
      'options': [
        'To create a new array with the results of applying a function to each element in an array',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer':
      'To create a new array with the results of applying a function to each element in an array',
    },
    {
      'question': 'What is the purpose of the filter method in JavaScript?',
      'options': [
        'To create a new array with all elements that pass a test',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To create a new array with all elements that pass a test',
    },
    {
      'question': 'What is the purpose of the reduce method in JavaScript?',
      'options': [
        'To apply a function to each element in an array and reduce it to a single value',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer':
      'To apply a function to each element in an array and reduce it to a single value',
    },
    {
      'question':
      'What is the purpose of the reduceRight method in JavaScript?',
      'options': [
        'To apply a function to each element in an array and reduce it to a single value, from right to left',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer':
      'To apply a function to each element in an array and reduce it to a single value, from right to left',
    },
    {
      'question': 'What is the purpose of the sort method in JavaScript?',
      'options': [
        'To sort an array in ascending order',
        'To sort an array in descending order',
        'To reverse an array',
        'None'
      ],
      'answer': 'To sort an array in ascending order',
    },
    {
      'question': 'What is the purpose of the reverse method in JavaScript?',
      'options': [
        'To reverse the order of an array',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To reverse the order of an array',
    },
    {
      'question': 'What is the purpose of the toString method in JavaScript?',
      'options': [
        'To convert an array to a string',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert an array to a string',
    },
    {
      'question':
      'What is the purpose of the toLocaleString method in JavaScript?',
      'options': [
        'To convert an array to a string, using the locale-specific formatting',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer':
      'To convert an array to a string, using the locale-specific formatting',
    },
    {
      'question': 'What is the purpose of the valueOf method in JavaScript?',
      'options': [
        'To return the primitive value of an array',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To return the primitive value of an array',
    },
    {
      'question':
      'What is the purpose of the hasOwnProperty method in JavaScript?',
      'options': [
        'To check if an object has a property',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To check if an object has a property',
    },
    {
      'question':
      'What is the purpose of the isPrototypeOf method in JavaScript?',
      'options': [
        'To check if an object is a prototype of another object',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To check if an object is a prototype of another object',
    },
    {
      'question':
      'What is the purpose of the propertyIsEnumerable method in JavaScript?',
      'options': [
        'To check if a property is enumerable',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To check if a property is enumerable',
    },
    {
      'question': 'What is the purpose of the toSource method in JavaScript?',
      'options': [
        'To return a string representing the source code of an object',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To return a string representing the source code of an object',
    },
    {
      'question': 'What is the purpose of the watch method in JavaScript?',
      'options': [
        'To add a watchpoint to an object',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To add a watchpoint to an object',
    },
    {
      'question': 'What is the purpose of the unwatch method in JavaScript?',
      'options': [
        'To remove a watchpoint from an object',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To remove a watchpoint from an object',
    },
    {
      'question': 'What is the purpose of the eval method in JavaScript?',
      'options': [
        'To evaluate a string as JavaScript code',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To evaluate a string as JavaScript code',
    },
    {
      'question': 'What is the purpose of the uneval method in JavaScript?',
      'options': [
        'To return a string representing the source code of an object',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To return a string representing the source code of an object',
    },
    {
      'question': 'What is the purpose of the isFinite method in JavaScript?',
      'options': [
        'To check if a number is finite',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To check if a number is finite',
    },
    {
      'question': 'What is the purpose of the isNaN method in JavaScript?',
      'options': [
        'To check if a number is NaN',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To check if a number is NaN',
    },
    {
      'question': 'What is the purpose of the parseFloat method in JavaScript?',
      'options': [
        'To parse a string as a floating-point number',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To parse a string as a floating-point number',
    },
    {
      'question': 'What is the purpose of the parseInt method in JavaScript?',
      'options': [
        'To parse a string as an integer',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To parse a string as an integer',
    },
    {
      'question': 'What is the purpose of the decodeURI method in JavaScript?',
      'options': [
        'To decode a URI',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To decode a URI',
    },
    {
      'question':
      'What is the purpose of the decodeURIComponent method in JavaScript?',
      'options': [
        'To decode a URI component',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To decode a URI component',
    },
    {
      'question': 'What is the purpose of the encodeURI method in JavaScript?',
      'options': [
        'To encode a URI',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To encode a URI',
    },
    {
      'question':
      'What is the purpose of the encodeURIComponent method in JavaScript?',
      'options': [
        'To encode a URI component',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To encode a URI component',
    },
    {
      'question': 'What is the purpose of the escape method in JavaScript?',
      'options': [
        'To escape a string',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To escape a string',
    },
    {
      'question': 'What is the purpose of the unescape method in JavaScript?',
      'options': [
        'To unescape a string',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To unescape a string',
    },
    {
      'question':
      'What is the purpose of the getFullYear method in JavaScript?',
      'options': [
        'To get the full year of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the full year of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCFullYear method in JavaScript?',
      'options': [
        'To get the full year of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the full year of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getMonth method in JavaScript?',
      'options': [
        'To get the month of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the month of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCMonth method in JavaScript?',
      'options': [
        'To get the month of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the month of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getDate method in JavaScript?',
      'options': [
        'To get the day of the month of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the month of a date',
    },
    {
      'question': 'What is the purpose of the getUTCDate method in JavaScript?',
      'options': [
        'To get the day of the month of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the month of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getDay method in JavaScript?',
      'options': [
        'To get the day of the week of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the week of a date',
    },
    {
      'question': 'What is the purpose of the getUTCDay method in JavaScript?',
      'options': [
        'To get the day of the week of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the week of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getHours method in JavaScript?',
      'options': [
        'To get the hour of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the hour of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCHours method in JavaScript?',
      'options': [
        'To get the hour of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the hour of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getMinutes method in JavaScript?',
      'options': [
        'To get the minute of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the minute of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCMinutes method in JavaScript?',
      'options': [
        'To get the minute of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the minute of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getSeconds method in JavaScript?',
      'options': [
        'To get the second of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the second of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCSeconds method in JavaScript?',
      'options': [
        'To get the second of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the second of a date in UTC',
    },
    {
      'question':
      'What is the purpose of the getMilliseconds method in JavaScript?',
      'options': [
        'To get the millisecond of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the millisecond of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCMilliseconds method in JavaScript?',
      'options': [
        'To get the millisecond of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the millisecond of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getTime method in JavaScript?',
      'options': [
        'To get the time of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the time of a date',
    },
    {
      'question':
      'What is the purpose of the getTimezoneOffset method in JavaScript?',
      'options': [
        'To get the time zone offset of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the time zone offset of a date',
    },
    {
      'question': 'What is the purpose of the setTime method in JavaScript?',
      'options': [
        'To set the time of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the time of a date',
    },
    {
      'question':
      'What is the purpose of the setMilliseconds method in JavaScript?',
      'options': [
        'To set the millisecond of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the millisecond of a date',
    },
    {
      'question':
      'What is the purpose of the setUTCMilliseconds method in JavaScript?',
      'options': [
        'To set the millisecond of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the millisecond of a date in UTC',
    },
    {
      'question': 'What is the purpose of the setSeconds method in JavaScript?',
      'options': [
        'To set the second of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the second of a date',
    },
    {
      'question':
      'What is the purpose of the setUTCSeconds method in JavaScript?',
      'options': [
        'To set the second of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the second of a date in UTC',
    },
    {
      'question': 'What is the purpose of the setMinutes method in JavaScript?',
      'options': [
        'To set the minute of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the minute of a date',
    },
    {
      'question':
      'What is the purpose of the setUTCMinutes method in JavaScript?',
      'options': [
        'To set the minute of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the minute of a date in UTC',
    },
    {
      'question': 'What is the purpose of the setHours method in JavaScript?',
      'options': [
        'To set the hour of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the hour of a date',
    },
    {
      'question':
      'What is the purpose of the setUTCHours method in JavaScript?',
      'options': [
        'To set the hour of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the hour of a date in UTC',
    },
    {
      'question': 'What is the purpose of the setDate method in JavaScript?',
      'options': [
        'To set the day of the month of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the day of the month of a date',
    },
    {
      'question': 'What is the purpose of the setUTCDate method in JavaScript?',
      'options': [
        'To set the day of the month of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the day of the month of a date in UTC',
    },
    {
      'question': 'What is the purpose of the setMonth method in JavaScript?',
      'options': [
        'To set the month of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the month of a date',
    },
    {
      'question':
      'What is the purpose of the setUTCMonth method in JavaScript?',
      'options': [
        'To set the month of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the month of a date in UTC',
    },
    {
      'question':
      'What is the purpose of the setFullYear method in JavaScript?',
      'options': [
        'To set the full year of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the full year of a date',
    },
    {
      'question':
      'What is the purpose of the setUTCFullYear method in JavaScript?',
      'options': [
        'To set the full year of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the full year of a date in UTC',
    },
    {
      'question':
      'What is the purpose of the toDateString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format "day month date year"',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer':
      'To convert a date to a string in the format "day month date year"',
    },
    {
      'question':
      'What is the purpose of the toTimeString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format "hour:minute:second GMT offset"',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer':
      'To convert a date to a string in the format "hour:minute:second GMT offset"',
    },
    {
      'question':
      'What is the purpose of the toLocaleDateString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format of the locale',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the format of the locale',
    },
    {
      'question':
      'What is the purpose of the toLocaleTimeString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format of the locale',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the format of the locale',
    },
    {
      'question':
      'What is the purpose of the toISOString method in JavaScript?',
      'options': [
        'To convert a date to a string in the ISO format',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the ISO format',
    },
    {
      'question': 'What is the purpose of the toJSON method in JavaScript?',
      'options': [
        'To convert a date to a JSON string',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a JSON string',
    },
    {
      'question': 'What is the purpose of the getYear method in JavaScript?',
      'options': [
        'To get the year of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the year of a date',
    },
    {
      'question': 'What is the purpose of the setYear method in JavaScript?',
      'options': [
        'To set the year of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the year of a date',
    },
    {
      'question':
      'What is the purpose of the toGMTString method in JavaScript?',
      'options': [
        'To convert a date to a string in the GMT format',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the GMT format',
    },
    {
      'question':
      'What is the purpose of the toUTCString method in JavaScript?',
      'options': [
        'To convert a date to a string in the UTC format',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the UTC format',
    },
    {
      'question':
      'What is the purpose of the toLocaleFormat method in JavaScript?',
      'options': [
        'To convert a date to a string in the format of the locale',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the format of the locale',
    },
    {
      'question': 'What is the purpose of the valueOf method in JavaScript?',
      'options': [
        'To return the primitive value of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To return the primitive value of a date',
    },
    {
      'question':
      'What is the purpose of the getTimezoneOffset method in JavaScript?',
      'options': [
        'To get the time zone offset of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the time zone offset of a date',
    },
    {
      'question':
      'What is the purpose of the getFullYear method in JavaScript?',
      'options': [
        'To get the full year of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the full year of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCFullYear method in JavaScript?',
      'options': [
        'To get the full year of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the full year of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getMonth method in JavaScript?',
      'options': [
        'To get the month of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the month of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCMonth method in JavaScript?',
      'options': [
        'To get the month of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the month of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getDate method in JavaScript?',
      'options': [
        'To get the day of the month of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the month of a date',
    },
    {
      'question': 'What is the purpose of the getUTCDate method in JavaScript?',
      'options': [
        'To get the day of the month of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the month of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getDay method in JavaScript?',
      'options': [
        'To get the day of the week of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the week of a date',
    },
    {
      'question': 'What is the purpose of the getUTCDay method in JavaScript?',
      'options': [
        'To get the day of the week of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the week of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getHours method in JavaScript?',
      'options': [
        'To get the hour of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the hour of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCHours method in JavaScript?',
      'options': [
        'To get the hour of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the hour of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getMinutes method in JavaScript?',
      'options': [
        'To get the minute of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the minute of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCMinutes method in JavaScript?',
      'options': [
        'To get the minute of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the minute of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getSeconds method in JavaScript?',
      'options': [
        'To get the second of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the second of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCSeconds method in JavaScript?',
      'options': [
        'To get the second of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the second of a date in UTC',
    },
    {
      'question ':
      'What is the purpose of the getMilliseconds method in JavaScript?',
      'options': [
        'To get the millisecond of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the millisecond of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCMilliseconds method in JavaScript?',
      'options': [
        'To get the millisecond of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the millisecond of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getTime method in JavaScript?',
      'options': [
        'To get the time of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the time of a date',
    },
    {
      'question': 'What is the purpose of the setTime method in JavaScript?',
      'options': [
        'To set the time of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the time of a date',
    },
    {
      'question':
      'What is the purpose of the toDateString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format "day month date year"',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer':
      'To convert a date to a string in the format "day month date year"',
    },
    {
      'question':
      'What is the purpose of the toTimeString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format "hour:minute:second GMT offset"',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer':
      'To convert a date to a string in the format "hour:minute:second GMT offset"',
    },
    {
      'question':
      'What is the purpose of the toLocaleDateString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format of the locale',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the format of the locale',
    },
    {
      'question':
      'What is the purpose of the toLocaleTimeString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format of the locale',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the format of the locale',
    },
    {
      'question':
      'What is the purpose of the toISOString method in JavaScript?',
      'options': [
        'To convert a date to a string in the ISO format',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the ISO format',
    },
    {
      'question': 'What is the purpose of the toJSON method in JavaScript?',
      'options': [
        'To convert a date to a JSON string',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a JSON string',
    },
    {
      'question': 'What is the purpose of the getYear method in JavaScript?',
      'options': [
        'To get the year of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the year of a date',
    },
    {
      'question': 'What is the purpose of the setYear method in JavaScript?',
      'options': [
        'To set the year of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the year of a date',
    },
    {
      'question':
      'What is the purpose of the toGMTString method in JavaScript?',
      'options': [
        'To convert a date to a string in the GMT format',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the GMT format',
    },
    {
      'question':
      'What is the purpose of the toUTCString method in JavaScript?',
      'options': [
        'To convert a date to a string in the UTC format',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the UTC format',
    },
    {
      'question':
      'What is the purpose of the toLocaleFormat method in JavaScript?',
      'options': [
        'To convert a date to a string in the format of the locale',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the format of the locale',
    },
    {
      'question': 'What is the purpose of the valueOf method in JavaScript?',
      'options': [
        'To return the primitive value of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To return the primitive value of a date',
    },
    {
      'question':
      'What is the purpose of the getTimezoneOffset method in JavaScript?',
      'options': [
        'To get the time zone offset of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the time zone offset of a date',
    },
    {
      'question':
      'What is the purpose of the getFullYear method in JavaScript?',
      'options': [
        'To get the full year of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the full year of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCFullYear method in JavaScript?',
      'options': [
        'To get the full year of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the full year of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getMonth method in JavaScript?',
      'options': [
        'To get the month of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the month of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCMonth method in JavaScript?',
      'options': [
        'To get the month of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the month of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getDate method in JavaScript?',
      'options': [
        'To get the day of the month of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the month of a date',
    },
    {
      'question': 'What is the purpose of the getUTCDate method in JavaScript?',
      'options': [
        'To get the day of the month of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the month of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getDay method in JavaScript?',
      'options': [
        'To get the day of the week of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the week of a date',
    },
    {
      'question': 'What is the purpose of the getUTCDay method in JavaScript?',
      'options': [
        'To get the day of the week of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the week of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getHours method in JavaScript?',
      'options': [
        'To get the hour of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the hour of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCHours method in JavaScript?',
      'options': [
        'To get the hour of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the hour of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getMinutes method in JavaScript?',
      'options': [
        'To get the minute of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the minute of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCMinutes method in JavaScript?',
      'options': [
        'To get the minute of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the minute of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getSeconds method in JavaScript?',
      'options': [
        'To get the second of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the second of a date',
    },
    {
      'question': 'Which of the following is not a JavaScript data type?',
      'options': ['String', 'Boolean', 'Undefined', 'Character'],
      'answer': 'Character',
    },
    {
      'question': 'How do you create a function in JavaScript?',
      'options': [
        'function myFunction() {}',
        'create function myFunction() {}',
        'function: myFunction() {}',
        'None'
      ],
      'answer': 'function myFunction() {}',
    },
    {
      'question': 'What is the output of console.log(typeof NaN)?',
      'options': ['number', 'undefined', 'object', 'None'],
      'answer': 'number',
    },
    {
      'question':
      'Which method is used to convert a JSON string into a JavaScript object?',
      'options': ['JSON.parse()', 'JSON.stringify()', 'JSON.convert()', 'None'],
      'answer': 'JSON.parse()',
    },
    {
      'question':
      'What is the correct way to declare a variable in JavaScript?',
      'options': ['var x', 'x = var', 'var x =;', 'None'],
      'answer': 'var x',
    },
    {
      'question': 'Which symbol is used for comments in JavaScript?',
      'options': ['#', '//', '/* */', 'None'],
      'answer': '//',
    },
    {
      'question': 'What is the result of 2 + "2"?',
      'options': ['22', '4', 'Error', 'None'],
      'answer': '22',
    },
    {
      'question': 'What is the purpose of the `this` keyword?',
      'options': [
        'Refer to the current object',
        'Refer to the global object',
        'None',
        'All of the above'
      ],
      'answer': 'Refer to the current object',
    },
    {
      'question':
      'Which of the following methods is used to add an element to the end of an array?',
      'options': ['push()', 'append()', 'add()', 'None'],
      'answer': 'push()',
    },
    {
      'question': 'What does JSON stand for?',
      'options': [
        'JavaScript Object Notation',
        'Java Standard Object Notation',
        'JavaScript Object Number',
        'None'
      ],
      'answer': 'JavaScript Object Notation',
    },
    {
      'question':
      'What is the purpose of the getUTCSeconds method in JavaScript?',
      'options': [
        'To get the second of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the second of a date in UTC',
    },
    {
      'question':
      'What is the purpose of the getMilliseconds method in JavaScript?',
      'options': [
        'To get the millisecond of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the millisecond of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCMilliseconds method in JavaScript?',
      'options': [
        'To get the millisecond of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the millisecond of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getTime method in JavaScript?',
      'options': [
        'To get the time of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the time of a date',
    },
    {
      'question': 'What is the purpose of the setTime method in JavaScript?',
      'options': [
        'To set the time of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the time of a date',
    },
    {
      'question':
      'What is the purpose of the toDateString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format "day month date year"',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer':
      'To convert a date to a string in the format "day month date year"',
    },
    {
      'question':
      'What is the purpose of the toTimeString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format "hour:minute:second GMT offset"',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer':
      'To convert a date to a string in the format "hour:minute:second GMT offset"',
    },
    {
      'question':
      'What is the purpose of the toLocaleDateString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format of the locale',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the format of the locale',
    },
    {
      'question':
      'What is the purpose of the toLocaleTimeString method in JavaScript?',
      'options': [
        'To convert a date to a string in the format of the locale',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the format of the locale',
    },
    {
      'question':
      'What is the purpose of the toISOString method in JavaScript?',
      'options': [
        'To convert a date to a string in the ISO format',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the ISO format',
    },
    {
      'question': 'What is the purpose of the toJSON method in JavaScript?',
      'options': [
        'To convert a date to a JSON string',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a JSON string',
    },
    {
      'question': 'What is the purpose of the getYear method in JavaScript?',
      'options': [
        'To get the year of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the year of a date',
    },
    {
      'question': 'What is the purpose of the setYear method in JavaScript?',
      'options': [
        'To set the year of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To set the year of a date',
    },
    {
      'question':
      'What is the purpose of the toGMTString method in JavaScript?',
      'options': [
        'To convert a date to a string in the GMT format',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the GMT format',
    },
    {
      'question':
      'What is the purpose of the toUTCString method in JavaScript?',
      'options': [
        'To convert a date to a string in the UTC format',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the UTC format',
    },
    {
      'question':
      'What is the purpose of the toLocaleFormat method in JavaScript?',
      'options': [
        'To convert a date to a string in the format of the locale',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To convert a date to a string in the format of the locale',
    },
    {
      'question': 'What is the purpose of the valueOf method in JavaScript?',
      'options': [
        'To return the primitive value of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To return the primitive value of a date',
    },
    {
      'question':
      'What is the purpose of the getTimezoneOffset method in JavaScript?',
      'options': [
        'To get the time zone offset of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the time zone offset of a date',
    },
    {
      'question':
      'What is the purpose of the getFullYear method in JavaScript?',
      'options': [
        'To get the full year of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the full year of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCFullYear method in JavaScript?',
      'options': [
        'To get the full year of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the full year of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getMonth method in JavaScript?',
      'options': [
        'To get the month of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the month of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCMonth method in JavaScript?',
      'options': [
        'To get the month of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the month of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getDate method in JavaScript?',
      'options': [
        'To get the day of the month of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the month of a date',
    },
    {
      'question': 'What is the purpose of the getUTCDate method in JavaScript?',
      'options': [
        'To get the day of the month of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the month of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getDay method in JavaScript?',
      'options': [
        'To get the day of the week of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the week of a date',
    },
    {
      'question': 'What is the purpose of the getUTCDay method in JavaScript?',
      'options': [
        'To get the day of the week of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the day of the week of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getHours method in JavaScript?',
      'options': [
        'To get the hour of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the hour of a date',
    },
    {
      'question':
      'What is the purpose of the getUTCHours method in JavaScript?',
      'options': [
        'To get the hour of a date in UTC',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the hour of a date in UTC',
    },
    {
      'question': 'What is the purpose of the getMinutes method in JavaScript?',
      'options': [
        'To get the minute of a date',
        'To sort an array',
        'To reverse an array',
        'None'
      ],
      'answer': 'To get the minute of a date',
    }
  ];

  List<Map<String, dynamic>> selectedQuestions = [];
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];
  int totalQuestions = 0;
  Timer? _timer;
  int _timeLeft = 10; // Time limit for each question (changed to 10 seconds)
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
        title: const Text('Javascript Quiz', style: TextStyle(color: Colors.white)),
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
    _timeLeft = 10; // Time set to 10 seconds
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
    // Automatically move to the next question after selecting an answer
    Future.delayed(const Duration(seconds: 1), moveToNextQuestion);
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
