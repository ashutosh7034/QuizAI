import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../quizzes/quiz_analysis.dart'; // Import the analysis screen

class PythonQuizScreen extends StatefulWidget {
  @override
  _PythonQuizScreenState createState() => _PythonQuizScreenState();
}

class _PythonQuizScreenState extends State<PythonQuizScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the output of print(2 + 2)?',
      'options': ['4', '22', '2', 'None'],
      'answer': '4',
    },
    {
      'question': 'What is the output of print("abc"[-2:])?',
      'options': ['bc', 'ab', 'Error', 'None'],
      'answer': 'bc'
    },
    {
      'question': 'Which keyword is used to exit a loop in Python?',
      'options': ['exit', 'break', 'stop', 'continue'],
      'answer': 'break'
    },
    {
      'question': 'What is a list in Python?',
      'options': [
        'A collection of items',
        'A single value',
        'A data type',
        'None of the above'
      ],
      'answer': 'A collection of items',
    },
    {
      'question': 'What keyword is used to define a function in Python?',
      'options': ['def', 'function', 'define', 'fun'],
      'answer': 'def',
    },
    {
      'question': 'What keyword is used to create a function in Python?',
      'options': ['func', 'define', 'def', 'function'],
      'answer': 'def',
      'difficulty': 'Easy',
    },
    {
      'question': 'Which of the following is a mutable data type?',
      'options': ['Tuple', 'Set', 'String', 'None'],
      'answer': 'Set',
      'difficulty': 'Easy',
    },
    {
      'question': 'What does PEP stand for?',
      'options': [
        'Python Enhancement Proposal',
        'Python Executive Program',
        'Python Encoding Project',
        'None'
      ],
      'answer': 'Python Enhancement Proposal',
      'difficulty': 'Easy',
    },
    {
      'question': 'How do you create a variable with the numeric value 5?',
      'options': ['5 = x', 'x = 5', 'x := 5', 'None'],
      'answer': 'x = 5',
      'difficulty': 'Easy',
    },
    {
      'question': 'What is the correct file extension for Python files?',
      'options': ['.pyth', '.pt', '.py', '.python'],
      'answer': '.py',
      'difficulty': 'Easy',
    },
    {
      'question': 'What is the output of list(range(5))?',
      'options': ['0 1 2 3 4', '[0, 1, 2, 3, 4]', '[1, 2, 3, 4, 5]', 'None'],
      'answer': '[0, 1, 2, 3, 4]',
      'difficulty': 'Easy',
    },
    {
      'question': 'What is used to define a block of code in Python?',
      'options': ['{}', '[]', '()', ':'],
      'answer': ':',
      'difficulty': 'Easy',
    },
    {
      'question':
          'What will be the output of the following code: print(type([]))?',
      'options': [
        '<class list>',
        '<type list>',
        '<class list()>',
        '<class dict>'
      ],
      'answer': '<class list>',
      'difficulty': 'Easy',
    },
    {
      'question': 'Which operator is used for floor division?',
      'options': ['//', '%', '**', '/'],
      'answer': '//',
      'difficulty': 'Easy',
    },

    {
      'question': 'What is the correct file extension for Python files?',
      'options': ['.py', '.python', '.pyt', '.pt'],
      'answer': '.py'
    },
    {
      'question': 'How do you insert comments in Python?',
      'options': [
        '# This is a comment',
        '// This is a comment',
        '/* This is a comment */',
        '<!-- This is a comment -->'
      ],
      'answer': '# This is a comment'
    },
    {
      'question': 'What is the output of print(2 + 3)?',
      'options': ['5', '23', 'Error', 'None'],
      'answer': '5'
    },
    {
      'question': 'Which of the following is a Python built-in data type?',
      'options': ['list', 'array', 'hashmap', 'tree'],
      'answer': 'list'
    },
    {
      'question': 'Which function is used to read a file in Python?',
      'options': ['open()', 'read()', 'get()', 'file()'],
      'answer': 'open()'
    },
    {
      'question': 'What is the keyword used to define a function in Python?',
      'options': ['def', 'function', 'fun', 'method'],
      'answer': 'def'
    },
    {
      'question': 'Which symbol is used for string concatenation in Python?',
      'options': ['+', '-', '*', '/'],
      'answer': '+'
    },
    {
      'question': 'What will be the output of print("Hello" * 3)?',
      'options': ['HelloHelloHello', 'Hello3', 'Hello Hello Hello', 'Error'],
      'answer': 'HelloHelloHello'
    },
    {
      'question': 'What is the output of print(type(5))?',
      'options': ['int', 'str', 'float', 'list'],
      'answer': 'int'
    },
    {
      'question': 'What is the correct syntax to create a list in Python?',
      'options': ['[]', '()', '{}', '<>'],
      'answer': '[]'
    },
    {
      'question':
          'Which of the following is used to handle exceptions in Python?',
      'options': ['try...except', 'try...catch', 'throw', 'error'],
      'answer': 'try...except'
    },
    {
      'question': 'What is the output of print(len("Python"))?',
      'options': ['6', '5', '7', 'Error'],
      'answer': '6'
    },
    {
      'question': 'How do you create a variable with the floating number 2.8?',
      'options': ['x = float(2.8)', 'x = 2.8', 'x = 2.8f', 'x = float(2.8f)'],
      'answer': 'x = 2.8'
    },
    {
      'question': 'Which of the following is not a Python keyword?',
      'options': ['for', 'while', 'if', 'foreach'],
      'answer': 'foreach'
    },
    {
      'question': 'How do you start a while loop in Python?',
      'options': [
        'while (x > y)',
        'while x > y:',
        'while x > y',
        'while: (x > y)'
      ],
      'answer': 'while x > y:'
    },
    {
      'question': 'What is the output of print(10 % 3)?',
      'options': ['3', '1', '0', '10'],
      'answer': '1'
    },
    {
      'question':
          'Which of the following is the correct way to define a dictionary in Python?',
      'options': ['{}', '[]', '()', '<>'],
      'answer': '{}'
    },
    {
      'question': 'How do you remove an item from a list in Python?',
      'options': ['delete()', 'remove()', 'pop()', 'clear()'],
      'answer': 'remove()'
    },
    {
      'question': 'Which statement is used to exit a loop in Python?',
      'options': ['exit', 'stop', 'break', 'continue'],
      'answer': 'break'
    },
    {
      'question': 'What is the output of print(0 == False)?',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True'
    },
    {
      'question': 'What will be the output of print("A" in "Apple")?',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True'
    },
    {
      'question': 'What is the result of the expression 3 ** 2?',
      'options': ['6', '9', '8', 'Error'],
      'answer': '9'
    },
    {
      'question':
          'Which function is used to convert a string to an integer in Python?',
      'options': ['int()', 'str()', 'float()', 'convert()'],
      'answer': 'int()'
    },
    {
      'question': 'What is the output of print(bool(""))?',
      'options': ['True', 'False', 'None', 'Error'],
      'answer': 'False'
    },
    {
      'question': 'How do you start a function in Python?',
      'options': [
        'function myFunction():',
        'def myFunction():',
        'myFunction():',
        'func myFunction():'
      ],
      'answer': 'def myFunction():'
    },
    {
      'question': 'Which of the following will create a tuple in Python?',
      'options': ['()', '[]', '{}', '<>'],
      'answer': '()'
    },
    {
      'question': 'What will be the output of print("Python"[0])?',
      'options': ['P', 'y', 'o', 'Error'],
      'answer': 'P'
    },
    {
      'question':
          'Which method is used to add an element at the end of a list in Python?',
      'options': ['append()', 'add()', 'insert()', 'extend()'],
      'answer': 'append()'
    },
    {
      'question': 'What is the output of print(4 == 4 and 5 == 5)?',
      'options': ['True', 'False', 'None', 'Error'],
      'answer': 'True'
    },
    {
      'question': 'What is the purpose of the pass statement in Python?',
      'options': [
        'To skip the current iteration',
        'To terminate a loop',
        'To do nothing',
        'To raise an error'
      ],
      'answer': 'To do nothing'
    },
    {
      'question': 'What is the output of print("abc".upper())?',
      'options': ['ABC', 'abc', 'Abc', 'Error'],
      'answer': 'ABC'
    },
    {
      'question':
          'Which of the following methods can be used to find the length of a string in Python?',
      'options': ['length()', 'len()', 'size()', 'count()'],
      'answer': 'len()'
    },
    {
      'question': 'What is the output of print("hello".replace("l", "x"))?',
      'options': ['hexxo', 'hexxo', 'hxxo', 'hello'],
      'answer': 'hexxo'
    },
    {
      'question':
          'Which operator is used to check if two variables are identical in Python?',
      'options': ['==', '!=', '===', 'is'],
      'answer': 'is'
    },
    {
      'question': 'What is the output of print("Python"[-1])?',
      'options': ['n', 'o', 'Error', 'None'],
      'answer': 'n'
    },
    {
      'question': 'How do you declare a variable in Python?',
      'options': ['var x = 10', 'x := 10', 'x = 10', '10 = x'],
      'answer': 'x = 10'
    },
    {
      'question': 'What will be the output of print(10 // 3)?',
      'options': ['3', '4', '3.33', 'Error'],
      'answer': '3'
    },
    {
      'question': 'Which keyword is used to define a class in Python?',
      'options': ['class', 'def', 'method', 'type'],
      'answer': 'class'
    },
    {
      'question': 'What is the output of print(list(range(5)))?',
      'options': [
        '[0, 1, 2, 3, 4]',
        '[1, 2, 3, 4, 5]',
        '[0, 1, 2, 3, 4, 5]',
        'Error'
      ],
      'answer': '[0, 1, 2, 3, 4]'
    },
    {
      'question': 'What is the purpose of the continue statement in Python?',
      'options': [
        'To skip the current iteration of a loop',
        'To exit the loop',
        'To start a new loop',
        'None'
      ],
      'answer': 'To skip the current iteration of a loop'
    },
    {
      'question': 'What is the output of print(type([]))?',
      'options': ['list', 'dict', 'tuple', 'set'],
      'answer': 'list'
    },
    {
      'question': 'Which of the following is a mutable data type in Python?',
      'options': ['tuple', 'str', 'list', 'int'],
      'answer': 'list'
    },
    {
      'question': 'What will be the output of print("Hello"[1:4])?',
      'options': ['ell', 'Hel', 'llo', 'Error'],
      'answer': 'ell'
    },

// More Easy Questions...

// Medium Questions
    {
      'question': 'What is the output of print(2 * 3 ** 3)?',
      'options': ['54', '18', '6', 'None'],
      'answer': '54',
      'difficulty': 'Medium',
    },
    {
      'question':
          'Which of the following is not a built-in data type in Python?',
      'options': ['List', 'Dictionary', 'Class', 'Tuple'],
      'answer': 'Class',
      'difficulty': 'Medium',
    },
    {
      'question': 'How do you create a list in Python?',
      'options': ['[]', '{}', '()', '<>'],
      'answer': '[]',
      'difficulty': 'Medium',
    },
    {
      'question':
          'What will be the output of the following code: print(2 ** 3 ** 2)?',
      'options': ['64', '9', '8', 'None'],
      'answer': '512',
      'difficulty': 'Medium',
    },
    {
      'question':
          'Which of the following methods is used to remove an item from a list by value?',
      'options': ['remove()', 'pop()', 'delete()', 'discard()'],
      'answer': 'remove()',
      'difficulty': 'Medium',
    },
    {
      'question': 'What does the len() function do?',
      'options': [
        'Returns the length of an object',
        'Converts to a list',
        'Counts the number of items',
        'None'
      ],
      'answer': 'Returns the length of an object',
      'difficulty': 'Medium',
    },
    {
      'question': 'Which symbol is used for comments in Python?',
      'options': ['#', '//', '/*', '/* */'],
      'answer': '#',
      'difficulty': 'Medium',
    },
    {
      'question':
          'What will be the output of the following code: print("Hello" + "World")?',
      'options': ['HelloWorld', 'Hello World', 'Error', 'HelloWorld!'],
      'answer': 'HelloWorld',
      'difficulty': 'Medium',
    },
    {
      'question':
          'What will be the output of the following code: print("Hello" * 3)?',
      'options': ['HelloHelloHello', 'Hello 3', '3Hello', 'Error'],
      'answer': 'HelloHelloHello',
      'difficulty': 'Medium',
    },
    {
      'question': 'Which function is used to get user input in Python?',
      'options': ['input()', 'scan()', 'read()', 'get()'],
      'answer': 'input()',
      'difficulty': 'Medium',
    },

    {
      'question': 'What will be the output of print(2 * 3 ** 2)?',
      'options': ['6', '18', '12', 'Error'],
      'answer': '18'
    },
    {
      'question': 'Which function is used to get the absolute value in Python?',
      'options': ['abs()', 'value()', 'get()', 'abs_value()'],
      'answer': 'abs()'
    },
    {
      'question': 'How do you create a set in Python?',
      'options': ['[]', '{}', '()', '<>'],
      'answer': '{}'
    },
    {
      'question': 'What will be the output of print("abc" + "def")?',
      'options': ['abcdef', 'abc def', 'Error', 'abc+def'],
      'answer': 'abcdef'
    },
    {
      'question': 'What is the output of print("Hello".find("e"))?',
      'options': ['1', '0', '2', '-1'],
      'answer': '1'
    },
    {
      'question': 'What will be the output of print(len([1, 2, 3]))?',
      'options': ['2', '3', '4', 'Error'],
      'answer': '3'
    },
    {
      'question':
          'What does the * operator do when used with a list in Python?',
      'options': [
        'Reverses the list',
        'Duplicates the list',
        'Sorts the list',
        'None'
      ],
      'answer': 'Duplicates the list'
    },
    {
      'question':
          'Which of the following methods is used to sort a list in Python?',
      'options': ['sort()', 'order()', 'arrange()', 'None'],
      'answer': 'sort()'
    },
    {
      'question': 'What is the output of print([1, 2, 3] == [1, 2, 3])?',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True'
    },
    {
      'question':
          'Which of the following functions can be used to convert a string to lowercase in Python?',
      'options': ['lower()', 'downcase()', 'toLower()', 'str.lower()'],
      'answer': 'lower()'
    },
    {
      'question': 'What will be the output of print([x for x in range(3)])?',
      'options': ['[0, 1, 2]', '[1, 2, 3]', '[0, 1, 2, 3]', 'Error'],
      'answer': '[0, 1, 2]'
    },
    {
      'question': 'What is the output of print("Hello".upper())?',
      'options': ['HELLO', 'Hello', 'hello', 'Error'],
      'answer': 'HELLO'
    },
    {
      'question': 'How do you create a class in Python?',
      'options': [
        'class MyClass:',
        'MyClass(){}',
        'class MyClass()',
        'define MyClass()'
      ],
      'answer': 'class MyClass:'
    },
    {
      'question':
          'Which method is used to remove all items from a list in Python?',
      'options': ['clear()', 'remove_all()', 'delete()', 'reset()'],
      'answer': 'clear()'
    },
    {
      'question': 'What will be the output of print("abc".capitalize())?',
      'options': ['Abc', 'ABC', 'abc', 'Error'],
      'answer': 'Abc'
    },
    {
      'question': 'Which statement is used to handle exceptions in Python?',
      'options': [
        'try...except',
        'handle...catch',
        'try...catch',
        'error...except'
      ],
      'answer': 'try...except'
    },
    {
      'question': 'What is the output of print("Python"[0:2])?',
      'options': ['Py', 'Python', 'P', 'Error'],
      'answer': 'Py'
    },
    {
      'question': 'How do you create a generator in Python?',
      'options': [
        'def my_generator()',
        'my_generator() = generator',
        'yield',
        'yield from'
      ],
      'answer': 'def my_generator():'
    },
    {
      'question': 'What is the purpose of the __init__ method in a class?',
      'options': [
        'To initialize the object',
        'To destroy the object',
        'To clone the object',
        'None'
      ],
      'answer': 'To initialize the object'
    },
    {
      'question': 'What will be the output of print({"a": 1, "b": 2}["b"]))?',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '2'
    },
    {
      'question': 'How do you import a module in Python?',
      'options': [
        'import module_name',
        'require(module_name)',
        'include module_name',
        'using module_name'
      ],
      'answer': 'import module_name'
    },
    {
      'question':
          'What will be the output of print("Hello, World!".split(","))?',
      'options': [
        '["Hello", " World!"]',
        '["Hello", "World!"]',
        '["Hello,", " World!"]',
        'Error'
      ],
      'answer': '["Hello", " World!"]'
    },
    {
      'question':
          'Which of the following is the correct way to declare a lambda function in Python?',
      'options': [
        'lambda x: x + 1',
        'def lambda(x): return x + 1',
        'lambda x {x + 1}',
        'lambda(x): x + 1'
      ],
      'answer': 'lambda x: x + 1'
    },
    {
      'question':
          'What is the purpose of the self parameter in a class method?',
      'options': [
        'To refer to the instance of the class',
        'To refer to the class itself',
        'To refer to other classes',
        'None'
      ],
      'answer': 'To refer to the instance of the class'
    },
    {
      'question': 'What will be the output of print("1" + "1")?',
      'options': ['2', '11', 'Error', 'None'],
      'answer': '11'
    },
    {
      'question': 'Which operator is used for exponentiation in Python?',
      'options': ['^', '**', 'exp()', 'None'],
      'answer': '**'
    },
    {
      'question': 'What will be the output of print({1, 2, 3} - {2, 3})?',
      'options': ['{1}', '{2}', '{1, 2, 3}', 'Error'],
      'answer': '{1}'
    },
    {
      'question': 'How do you define a class variable in Python?',
      'options': [
        'class_variable = value',
        'self.class_variable = value',
        'class class_variable = value',
        'value = class_variable'
      ],
      'answer': 'class_variable = value'
    },
    {
      'question':
          'Which of the following is not a valid way to define a function in Python?',
      'options': [
        'def function_name()',
        'function_name()',
        'lambda function_name:',
        'None'
      ],
      'answer': 'function_name()'
    },
    {
      'question': 'What is the output of print(3 != 3)?',
      'options': ['True', 'False', 'None', 'Error'],
      'answer': 'False'
    },
    {
      'question':
          'Which of the following will create a shallow copy of a list in Python?',
      'options': ['list.copy()', 'list[:]', 'copy.copy(list)', 'None'],
      'answer': 'list.copy()'
    },
    {
      'question': 'What will be the output of print({"a": 1, "b": 2}.keys())?',
      'options': ['dict_keys(["a", "b"])', '["a", "b"]', '("a", "b")', 'Error'],
      'answer': 'dict_keys(["a", "b"])'
    },
    {
      'question':
          'Which of the following is used to create an empty dictionary in Python?',
      'options': ['{}', '[]', '()', '<>'],
      'answer': '{}'
    },
    {
      'question':
          'What is the output of print("Hello, World!".replace("World", "Python"))?',
      'options': ['Hello, Python!', 'Hello, World!', 'Hello, Python', 'Error'],
      'answer': 'Hello, Python!'
    },
    {
      'question': 'How do you create a list comprehension in Python?',
      'options': [
        '[x for x in range(10)]',
        'list(x for x in range(10))',
        'list(range(10))',
        'None'
      ],
      'answer': '[x for x in range(10)]'
    },
    {
      'question': 'What will be the output of print(type([1, 2, 3]) is list)?',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True'
    },
    {
      'question':
          'Which of the following will result in a TypeError in Python?',
      'options': ['1 + "1"', '1 - 1', '1 * 1', '1 / 1'],
      'answer': '1 + "1"'
    },
    {
      'question': 'What is the output of print("Python"[-2])?',
      'options': ['o', 'n', 'Error', 'None'],
      'answer': 'o'
    },

// More Medium Questions...

// Hard Questions
    {
      'question':
          'What will be the output of the following code: print(type([]))?',
      'options': [
        '<class list>',
        '<type list>',
        '<class list()>',
        '<class dict>'
      ],
      'answer': '<class list>',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is the output of list(map(str, [1, 2, 3]))?',
      'options': ['1, 2, 3', '[1, 2, 3]', 'Error', 'None'],
      'answer': '["1", "2", "3"]',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is the correct way to create a class in Python?',
      'options': [
        'class MyClass():',
        'class MyClass:',
        'class MyClass{}',
        'class MyClass:()'
      ],
      'answer': 'class MyClass:',
      'difficulty': 'Hard',
    },
    {
      'question':
          'What will be the output of the following code: print(0.1 + 0.2 == 0.3)?',
      'options': ['True', 'False', 'None', 'Error'],
      'answer': 'False',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is a lambda function in Python?',
      'options': [
        'A small anonymous function',
        'A type of loop',
        'A function with no parameters',
        'None'
      ],
      'answer': 'A small anonymous function',
      'difficulty': 'Hard',
    },
    {
      'question':
          'Which of the following is a valid way to declare a tuple in Python?',
      'options': ['()', '[]', '{}', '<>'],
      'answer': '()',
      'difficulty': 'Hard',
    },
    {
      'question':
          'What will be the output of the following code: print(10//3)?',
      'options': ['3', '3.33', '4', 'None'],
      'answer': '3',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is the correct syntax for creating a set in Python?',
      'options': ['set()', '{}', '[]', '()'],
      'answer': '{}',
      'difficulty': 'Hard',
    },
    {
      'question':
          'What will be the output of the following code: print("a" in ["a", "b", "c"])?',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is the use of the pass statement in Python?',
      'options': [
        'To define a function',
        'To terminate a loop',
        'To create a placeholder',
        'None'
      ],
      'answer': 'To create a placeholder',
      'difficulty': 'Hard',
    },

    {
      'question': 'What is the output of print({1, 2, 3}.union({2, 3, 4}))?',
      'options': ['{1, 2, 3, 4}', '{1, 2, 3}', '{2, 3}', 'Error'],
      'answer': '{1, 2, 3, 4}'
    },
    {
      'question':
          'How do you handle multiple exceptions in a single except clause?',
      'options': [
        'except (TypeError, ValueError):',
        'except TypeError, ValueError:',
        'except (TypeError or ValueError):',
        'except TypeError or ValueError:'
      ],
      'answer': 'except (TypeError, ValueError):'
    },
    {
      'question': 'What will be the output of print("abc"[-1: -4: -1])?',
      'options': ['cba', 'None', 'Error', 'abc'],
      'answer': 'cba'
    },
    {
      'question':
          'What is the purpose of the __str__ method in Python classes?',
      'options': [
        'To define a string representation of an object',
        'To define how to initialize an object',
        'To define how to clone an object',
        'None'
      ],
      'answer': 'To define a string representation of an object'
    },
    {
      'question': 'What does the zip() function do in Python?',
      'options': [
        'Combines two or more iterables',
        'Creates a copy of a list',
        'Reverses a list',
        'None'
      ],
      'answer': 'Combines two or more iterables'
    },
    {
      'question': 'What will be the output of print("Hello" * 3)?',
      'options': ['HelloHelloHello', 'Hello Hello Hello', 'Error', 'None'],
      'answer': 'HelloHelloHello'
    },
    {
      'question':
          'Which of the following is not a built-in data type in Python?',
      'options': ['List', 'Dictionary', 'Array', 'Set'],
      'answer': 'Array'
    },
    {
      'question': 'What will be the output of print(list(range(3, 8, 2)))?',
      'options': ['[3, 5, 7]', '[3, 4, 5, 6, 7]', '[3, 5]', 'Error'],
      'answer': '[3, 5, 7]'
    },
    {
      'question': 'What will be the output of print(sum([1, 2, 3]))?',
      'options': ['6', '5', 'Error', 'None'],
      'answer': '6'
    },
    {
      'question': 'How can you create a copy of a dictionary in Python?',
      'options': ['dict.copy()', 'dict()', 'copy(dict)', 'None'],
      'answer': 'dict.copy()'
    },
    {
      'question':
          'What will be the output of print([i for i in range(5) if i % 2 == 0])?',
      'options': ['[0, 1, 2, 3, 4]', '[0, 2, 4]', '[1, 3]', 'Error'],
      'answer': '[0, 2, 4]'
    },
    {
      'question':
          'Which keyword is used to define an inner function in Python?',
      'options': ['inner', 'def', 'function', 'None'],
      'answer': 'def'
    },
    {
      'question': 'What is the output of print({"x": 10, "y": 20}.get("x"))?',
      'options': ['10', '20', 'None', 'Error'],
      'answer': '10'
    },
    {
      'question': 'How do you create a set in Python?',
      'options': ['set()', '[]', '{}', '()'],
      'answer': '{}'
    },
    {
      'question': 'What will be the output of print("1" == 1)?',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'False'
    },
    {
      'question':
          'Which method is used to convert a string to an integer in Python?',
      'options': ['int()', 'str()', 'to_int()', 'float()'],
      'answer': 'int()'
    },
    {
      'question': 'What will be the output of print("abc" * 0)?',
      'options': ['abc', '', 'None', 'Error'],
      'answer': ''
    },
    {
      'question': 'What is the output of print(type(()))?',
      'options': ['tuple', 'list', 'dict', 'set'],
      'answer': 'tuple'
    },
    {
      'question': 'How do you create a private variable in a Python class?',
      'options': ['_variable', '__variable', 'private variable', 'None'],
      'answer': '__variable'
    },
    {
      'question': 'What will be the output of print("Python".count("o"))?',
      'options': ['0', '1', '2', 'Error'],
      'answer': '1'
    },
    {
      'question': 'Which function is used to read a file in Python?',
      'options': ['read()', 'open()', 'load()', 'None'],
      'answer': 'open()'
    },
    {
      'question': 'What is the output of print(len({"a": 1, "b": 2}))?',
      'options': ['2', '1', '3', 'Error'],
      'answer': '2'
    },
    {
      'question': 'What will be the output of print("Python"[:-1])?',
      'options': ['Python', 'Pytho', 'None', 'Error'],
      'answer': 'Pytho'
    },
    {
      'question': 'How do you define a static method in a class?',
      'options': [
        '@staticmethod',
        'def static_method',
        'static_method()',
        'None'
      ],
      'answer': '@staticmethod'
    },
    {
      'question': 'What will be the output of print("abc".isalpha())?',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True'
    },
    {
      'question': 'What is the output of print(3 in [1, 2, 3])?',
      'options': ['True', 'False', 'None', 'Error'],
      'answer': 'True'
    },
    {
      'question': 'How do you concatenate two lists in Python?',
      'options': [
        'list1 + list2',
        'list1.append(list2)',
        'list1.concat(list2)',
        'None'
      ],
      'answer': 'list1 + list2'
    },
    {
      'question': 'What will be the output of print("Hello".startswith("H"))?',
      'options': ['True', 'False', 'None', 'Error'],
      'answer': 'True'
    },
    {
      'question': 'What does the enumerate() function do in Python?',
      'options': [
        'Adds a counter to an iterable',
        'Removes duplicates from a list',
        'Sorts a list',
        'None'
      ],
      'answer': 'Adds a counter to an iterable'
    },
    {
      'question': 'What is the output of print("a" * 2 + "b" * 2)?',
      'options': ['aabb', 'aa bb', 'Error', 'None'],
      'answer': 'aabb'
    },
    {
      'question': 'How do you create a default dictionary in Python?',
      'options': ['defaultdict()', 'dict()', 'None', '{}'],
      'answer': 'defaultdict()'
    },
    {
      'question': 'What will be the output of print("Python"[0:3])?',
      'options': ['Pyt', 'Pytho', 'None', 'Python'],
      'answer': 'Pyt'
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
        title: const Text('Python Quiz', style: TextStyle(color: Colors.white)),
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
