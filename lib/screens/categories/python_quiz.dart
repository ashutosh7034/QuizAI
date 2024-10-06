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
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\nprint(x * 2)',
      'options': [
        '[1, 2, 3, 1, 2, 3]',
        '[1, 2, 3, 2, 3, 3]',
        '[2, 3, 3]',
        'Error'
      ],
      'answer': '[1, 2, 3, 1, 2, 3]',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint(type([]) is list)',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is the correct syntax for a decorator in Python?',
      'options': [
        '@decorator',
        'decorator@',
        'def decorator',
        'None of the above'
      ],
      'answer': '@decorator',
    },
    {
      'question':
          'What will be the output of the following code?\n\ndef func(a, b=[]):\n    b.append(a)\n    return b\n\nprint(func(1))',
      'options': ['[1]', '[1, 1]', '[1, 2]', 'Error'],
      'answer': '[1]',
    },
    {
      'question':
          'What will be the output of the following code?\n\nx = {1, 2, 3}\ny = {2, 3, 4}\nprint(x & y)',
      'options': ['{1, 2, 3}', '{2, 3}', '{4}', 'Error'],
      'answer': '{2, 3}',
    },
    {
      'question':
          'Which of the following can be used to create an empty tuple in Python?',
      'options': ['()', 'tuple()', '{}', 'None of the above'],
      'answer': '()',
    },
    {
      'question':
          'What will be the output of the following code?\n\nx = [1, 2, 3]\nprint(x[-1])',
      'options': ['1', '2', '3', 'Error'],
      'answer': '3',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint(1 < 2 < 3)',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following statements will correctly raise an exception?',
      'options': [
        'raise Exception',
        'throw Exception',
        'raise Exception()',
        'throw Exception()'
      ],
      'answer': 'raise Exception',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\ny = x\ny.append(4)\nprint(x)',
      'options': ['[1, 2, 3]', '[1, 2, 3, 4]', '[1, 2]', 'Error'],
      'answer': '[1, 2, 3, 4]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello" + 3)',
      'options': ['Hello3', 'Error', 'Hello', 'None of the above'],
      'answer': 'Error',
    },
    {
      'question':
          'Which of the following can be used to check if a key exists in a dictionary?',
      'options': [
        'key in dict',
        'dict.has_key(key)',
        'key in dict.keys()',
        'All of the above'
      ],
      'answer': 'key in dict',
    },
    {
      'question':
          'What will be the output of the following code?\n\nx = {1: "one", 2: "two"}\nprint(x.get(3, "three"))',
      'options': ['three', 'None', 'Error', 'three'],
      'answer': 'three',
    },
    {
      'question':
          'Which of the following statements is true about Python lists?',
      'options': [
        'Lists are immutable',
        'Lists can hold mixed data types',
        'Lists cannot be nested',
        'All of the above'
      ],
      'answer': 'Lists can hold mixed data types',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint(3 * "A")',
      'options': ['AAA', 'A', 'Error', 'None of the above'],
      'answer': 'AAA',
    },
    {
      'question':
          'What is the output of the following code?\n\ndef f():\n    return 1, 2, 3\n\nprint(f())',
      'options': ['1, 2, 3', '[1, 2, 3]', '(1, 2, 3)', 'Error'],
      'answer': '(1, 2, 3)',
    },
    {
      'question':
          'Which of the following statements is correct regarding Python sets?',
      'options': [
        'Sets are ordered',
        'Sets allow duplicates',
        'Sets are mutable',
        'None of the above'
      ],
      'answer': 'Sets are mutable',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\nprint(x[::-1])',
      'options': ['[1, 2, 3]', '[3, 2, 1]', 'Error', 'None of the above'],
      'answer': '[3, 2, 1]',
    },
    {
      'question':
          'Which of the following is a valid way to import a module in Python?',
      'options': [
        'import module',
        'from module import *',
        'import module as alias',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What will be the output of the following code?\n\nx = 5\nprint(x == 5 and x > 3)',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint(0.1 + 0.2 == 0.3)',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'False',
    },
    {
      'question': 'Which of the following is used to define a class in Python?',
      'options': [
        'class ClassName:',
        'define ClassName:',
        'class ClassName[]:',
        'None of the above'
      ],
      'answer': 'class ClassName:',
    },
    {
      'question':
          'What will be the output of the following code?\n\nx = {1, 2, 3}\ny = {3, 4, 5}\nprint(x | y)',
      'options': ['{1, 2, 3, 4, 5}', '{1, 2, 3}', '{3, 4, 5}', 'Error'],
      'answer': '{1, 2, 3, 4, 5}',
    },
    {
      'question': 'Which of the following is used to read a file in Python?',
      'options': [
        'open("file.txt")',
        'file.read()',
        'read.file()',
        'All of the above'
      ],
      'answer': 'open("file.txt")',
    },
    {
      'question':
          'What will be the output of the following code?\n\nx = [1, 2, 3]\nprint(x.append(4))',
      'options': ['None', '[1, 2, 3, 4]', 'Error', '4'],
      'answer': 'None',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint({x: x**2 for x in (1, 2, 3)})',
      'options': [
        '{1: 1, 2: 4, 3: 9}',
        '{1: 1, 2: 2, 3: 3}',
        'Error',
        'None of the above'
      ],
      'answer': '{1: 1, 2: 4, 3: 9}',
    },
    {
      'question':
          'Which of the following is a valid way to create a generator in Python?',
      'options': [
        '(x*x for x in range(3))',
        '[x*x for x in range(3)]',
        'generator(x*x for x in range(3))',
        'None of the above'
      ],
      'answer': '(x*x for x in range(3))',
    },
    {
      'question':
          'What is the output of the following code?\n\ndef foo(x, y=5):\n    return x + y\n\nprint(foo(3))',
      'options': ['8', '5', '3', 'Error'],
      'answer': '8',
    },
    {
      'question':
          'What will be the output of the following code?\n\nx = {1, 2, 3}\ny = {1, 2}\nprint(x - y)',
      'options': ['{3}', '{1, 2}', '{1, 2, 3}', 'Error'],
      'answer': '{3}',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello World".split())',
      'options': ['["Hello", "World"]', 'Error', 'None', '["Hello World"]'],
      'answer': '["Hello", "World"]',
    },
    {
      'question':
          'Which of the following methods can be used to convert a string to an integer in Python?',
      'options': ['int()', 'str()', 'float()', 'None of the above'],
      'answer': 'int()',
    },
    {
      'question':
          'What will be the output of the following code?\n\nx = [1, 2, 3]\nprint(x[1:3])',
      'options': ['[2, 3]', '[1, 2]', 'Error', 'None'],
      'answer': '[2, 3]',
    },
    {
      'question':
          'Which of the following is not a built-in data type in Python?',
      'options': ['List', 'Tuple', 'Dictionary', 'Array'],
      'answer': 'Array',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint((lambda x: x + 1)(2))',
      'options': ['3', '2', 'Error', 'None'],
      'answer': '3',
    },
    {
      'question':
          'Which of the following statements is true regarding Python dictionaries?',
      'options': [
        'Dictionaries are ordered',
        'Dictionaries cannot contain duplicates',
        'Dictionaries can be indexed',
        'All of the above'
      ],
      'answer': 'Dictionaries cannot contain duplicates',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint([1, 2, 3] == [1, 2, 3])',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint(type((x for x in range(3))))',
      'options': [
        '<class "generator">',
        '<class "list">',
        '<class "tuple">',
        'Error'
      ],
      'answer': '<class "generator">',
    },
    {
      'question':
          'Which of the following is used to handle exceptions in Python?',
      'options': [
        'try-except',
        'try-catch',
        'except-throw',
        'None of the above'
      ],
      'answer': 'try-except',
    },
    {
      'question':
          'What will be the output of the following code?\n\nx = None\nprint(x is None)',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = {1, 2, 3}\ny = frozenset(x)\nprint(y)',
      'options': ['{1, 2, 3}', 'Error', 'None', 'frozenset{1, 2, 3}'],
      'answer': 'frozenset{1, 2, 3}',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint(len("Hello"))',
      'options': ['5', 'Error', 'None', '4'],
      'answer': '5',
    },
    {
      'question':
          'Which of the following keywords is used to define a function in Python?',
      'options': ['function', 'def', 'func', 'define'],
      'answer': 'def',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("ABCD"[2:])',
      'options': ['C', 'CD', 'D', 'Error'],
      'answer': 'CD',
    },
    {
      'question':
          'Which of the following is not a valid way to create a list in Python?',
      'options': ['list()', '[1, 2, 3]', '[]', 'list[1, 2, 3]'],
      'answer': 'list[1, 2, 3]',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\nprint(x[0])',
      'options': ['1', '2', '3', 'Error'],
      'answer': '1',
    },
    {
      'question':
          'Which of the following methods is used to add an element to a set in Python?',
      'options': ['add()', 'append()', 'insert()', 'None of the above'],
      'answer': 'add()',
    },
    {
      'question': 'What is the output of the following code?\n\nprint(5 // 2)',
      'options': ['2.5', '2', 'Error', 'None'],
      'answer': '2',
    },
    {
      'question':
          'Which of the following functions is used to find the maximum value in a list?',
      'options': ['max()', 'min()', 'maxValue()', 'None of the above'],
      'answer': 'max()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python" * 3)',
      'options': ['PythonPythonPython', 'Error', 'Python 3', 'None'],
      'answer': 'PythonPythonPython',
    },
    {
      'question':
          'Which of the following statements is used to exit a loop in Python?',
      'options': ['continue', 'break', 'exit', 'stop'],
      'answer': 'break',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\nprint(x[-2])',
      'options': ['2', '1', '3', 'Error'],
      'answer': '2',
    },
    {
      'question': 'Which of the following is a mutable data type in Python?',
      'options': ['List', 'Tuple', 'String', 'None of the above'],
      'answer': 'List',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint(2 ** 3)',
      'options': ['6', '8', 'Error', 'None'],
      'answer': '8',
    },
    {
      'question':
          'Which of the following methods is used to remove an element from a list?',
      'options': ['remove()', 'delete()', 'discard()', 'None of the above'],
      'answer': 'remove()',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\nx[1] = 4\nprint(x)',
      'options': ['[1, 4, 3]', '[1, 2, 3]', '[4]', 'Error'],
      'answer': '[1, 4, 3]',
    },
    {
      'question':
          'Which of the following is used to define a private method in Python?',
      'options': ['__method', 'method__', '_method', 'method'],
      'answer': '__method',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint("A" < "B")',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question': 'Which of the following is true regarding Python lists?',
      'options': [
        'Lists are ordered',
        'Lists cannot contain duplicates',
        'Lists are immutable',
        'All of the above'
      ],
      'answer': 'Lists are ordered',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("1" + "2")',
      'options': ['12', '3', 'Error', 'None'],
      'answer': '12',
    },
    {
      'question': 'Which of the following is a valid Python comment?',
      'options': [
        '# Comment',
        '/* Comment */',
        '// Comment',
        'None of the above'
      ],
      'answer': '# Comment',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = {1, 2, 3}\ny = {2, 3, 4}\nprint(x & y)',
      'options': ['{1, 2, 3}', '{2, 3}', '{4}', 'Error'],
      'answer': '{2, 3}',
    },
    {
      'question':
          'Which of the following keywords is used for exception handling in Python?',
      'options': ['catch', 'finally', 'except', 'None of the above'],
      'answer': 'except',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint(type([]))',
      'options': [
        '<class "list">',
        '<class "array">',
        '<class "set">',
        'Error'
      ],
      'answer': '<class "list">',
    },
    {
      'question':
          'Which of the following functions can be used to convert a string to a float?',
      'options': ['float()', 'str()', 'int()', 'None of the above'],
      'answer': 'float()',
    },
    {
      'question':
          'What will be the output of the following code?\n\nx = "Python"\nprint(x[0])',
      'options': ['P', 'Error', 'None', 'Python'],
      'answer': 'P',
    },
    {
      'question': 'Which of the following is used to sort a list in Python?',
      'options': ['sort()', 'order()', 'arrange()', 'None of the above'],
      'answer': 'sort()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello World".replace("World", "Python"))',
      'options': ['Hello Python', 'Hello World', 'Error', 'None'],
      'answer': 'Hello Python',
    },
    {
      'question':
          'Which of the following methods can be used to find the length of a string?',
      'options': ['len()', 'size()', 'length()', 'None of the above'],
      'answer': 'len()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("ABCD"[-1])',
      'options': ['A', 'B', 'C', 'D'],
      'answer': 'D',
    },
    {
      'question':
          'Which of the following is not a valid variable name in Python?',
      'options': ['my_var', 'myVar', 'my-var', 'myVar1'],
      'answer': 'my-var',
    },
    {
      'question':
          'What will be the output of the following code?\n\nx = (1, 2, 3)\nprint(x[1])',
      'options': ['1', '2', '3', 'Error'],
      'answer': '2',
    },
    {
      'question': 'Which of the following is a built-in function in Python?',
      'options': ['map()', 'filter()', 'reduce()', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint([1, 2] + [3, 4])',
      'options': ['[1, 2, 3, 4]', '[1, 2, 3]', '[1, 2] [3, 4]', 'Error'],
      'answer': '[1, 2, 3, 4]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint(bool(""))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'False',
    },
    {
      'question': 'Which of the following is true regarding Python tuples?',
      'options': [
        'Tuples are immutable',
        'Tuples can contain duplicates',
        'Tuples can be nested',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint(1 + 2 * 3)',
      'options': ['9', '6', '7', 'Error'],
      'answer': '7',
    },
    {
      'question':
          'Which of the following functions can be used to create a list from a string?',
      'options': ['list()', 'split()', 'join()', 'None of the above'],
      'answer': 'split()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint(range(3))',
      'options': ['range(0, 3)', '[0, 1, 2]', '[1, 2, 3]', 'Error'],
      'answer': 'range(0, 3)',
    },
    {
      'question': 'Which of the following is not a core data type in Python?',
      'options': ['List', 'Dictionary', 'Set', 'Class'],
      'answer': 'Class',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint("Hello".upper())',
      'options': ['HELLO', 'Hello', 'Error', 'None'],
      'answer': 'HELLO',
    },
    {
      'question':
          'Which of the following is used to handle exceptions in Python?',
      'options': [
        'try-catch',
        'try-except',
        'catch-except',
        'None of the above'
      ],
      'answer': 'try-except',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\nprint(x.pop(0))',
      'options': ['1', '2', '3', 'Error'],
      'answer': '1',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("1" == 1)',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'False',
    },
    {
      'question':
          'Which of the following statements is true regarding Python strings?',
      'options': [
        'Strings are mutable',
        'Strings can be concatenated',
        'Strings cannot be indexed',
        'All of the above'
      ],
      'answer': 'Strings can be concatenated',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".find("e"))',
      'options': ['1', '0', '-1', 'Error'],
      'answer': '1',
    },
    {
      'question':
          'Which of the following methods can be used to clear all items from a list?',
      'options': ['clear()', 'remove()', 'delete()', 'None of the above'],
      'answer': 'clear()',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint(len([1, 2, 3]))',
      'options': ['3', '2', 'Error', 'None'],
      'answer': '3',
    },
    {
      'question':
          'Which of the following is used to read the entire contents of a file in Python?',
      'options': ['read()', 'readline()', 'readlines()', 'None of the above'],
      'answer': 'read()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("A" * 2 + "B")',
      'options': ['AAB', 'AAAB', 'AB', 'Error'],
      'answer': 'AAB',
    },
    {
      'question':
          'Which of the following is not a valid way to create a function in Python?',
      'options': [
        'def my_func():',
        'function my_func():',
        'def my_func(param):',
        'None of the above'
      ],
      'answer': 'function my_func():',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = 10\nprint(type(x))',
      'options': ['<class "int">', '<class "str">', '<class "float">', 'Error'],
      'answer': '<class "int">',
    },
    {
      'question':
          'Which of the following is not a valid way to create a set in Python?',
      'options': ['set()', '{}', '[]', 'set([1, 2, 3])'],
      'answer': '[]',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint("ABC"[-1])',
      'options': ['A', 'B', 'C', 'Error'],
      'answer': 'C',
    },
    {
      'question':
          'Which of the following is used to import a module in Python?',
      'options': [
        'import module',
        'require module',
        'include module',
        'None of the above'
      ],
      'answer': 'import module',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = (1, 2, 3)\nprint(len(x))',
      'options': ['3', '2', 'Error', 'None'],
      'answer': '3',
    },
    {
      'question':
          'Which of the following is a way to define a constant in Python?',
      'options': [
        'CONSTANT = value',
        'const CONSTANT = value',
        'CONSTANT := value',
        'None of the above'
      ],
      'answer': 'CONSTANT = value',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\nprint(x + [4])',
      'options': ['[1, 2, 3, 4]', '[4, 1, 2, 3]', '[1, 2, 3] [4]', 'Error'],
      'answer': '[1, 2, 3, 4]',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = "Hello"\nprint(x[1:4])',
      'options': ['ell', 'ell', 'Hello', 'Error'],
      'answer': 'ell',
    },
    {
      'question':
          'Which of the following functions can be used to convert a list to a tuple?',
      'options': ['tuple()', 'list()', 'convert()', 'None of the above'],
      'answer': 'tuple()',
    },
    {
      'question': 'What is the output of the following code?\n\nprint(10 % 3)',
      'options': ['3', '1', '0', 'Error'],
      'answer': '1',
    },
    {
      'question':
          'Which of the following is not a built-in function in Python?',
      'options': ['sum()', 'max()', 'min()', 'average()'],
      'answer': 'average()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint([1, 2, 3] * 2)',
      'options': ['[1, 2, 3, 1, 2, 3]', '[1, 2, 3]', '[1, 2, 3, 2]', 'Error'],
      'answer': '[1, 2, 3, 1, 2, 3]',
    },
    {
      'question':
          'Which of the following methods is used to add an element at a specific position in a list?',
      'options': ['insert()', 'add()', 'append()', 'None of the above'],
      'answer': 'insert()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("A" + "B")',
      'options': ['AB', 'A+B', 'Error', 'None'],
      'answer': 'AB',
    },
    {
      'question':
          'Which of the following keywords is used to define a class in Python?',
      'options': ['class', 'define', 'func', 'None of the above'],
      'answer': 'class',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = "Hello"\nprint(x[::-1])',
      'options': ['olleH', 'Hello', 'Error', 'None'],
      'answer': 'olleH',
    },
    {
      'question':
          'Which of the following methods is used to reverse a list in Python?',
      'options': ['reverse()', 'invert()', 'rev()', 'None of the above'],
      'answer': 'reverse()',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = "Hello"\nprint(x[1])',
      'options': ['e', 'Error', 'None', 'Hello'],
      'answer': 'e',
    },
    {
      'question': 'Which of the following is used to format strings in Python?',
      'options': ['format()', 'style()', 'template()', 'None of the above'],
      'answer': 'format()',
    },
    {
      'question':
          'What will be the output of the following code?\n\nprint("Hello".endswith("o"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is used to create a generator in Python?',
      'options': ['()', '[]', '{}', 'None of the above'],
      'answer': '()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello World"[0])',
      'options': ['H', 'Error', 'None', 'Hello'],
      'answer': 'H',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a number is even in Python?',
      'options': [
        'if num % 2 == 0:',
        'if num & 1 == 0:',
        'if num // 2:',
        'None of the above'
      ],
      'answer': 'if num // 2:',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\nx.remove(2)\nprint(x)',
      'options': ['[1, 2, 3]', '[1, 3]', 'Error', '[2, 3]'],
      'answer': '[1, 3]',
    },
    {
      'question':
          'Which of the following is used to handle multiple exceptions in Python?',
      'options': ['try-except', 'except-else', 'try-catch', 'except'],
      'answer': 'except',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".replace("e", "a"))',
      'options': ['Hallo', 'Hello', 'Error', 'None'],
      'answer': 'Hallo',
    },
    {
      'question':
          'Which of the following is used to iterate over a list in Python?',
      'options': ['for loop', 'while loop', 'iter()', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\nprint(x.index(3))',
      'options': ['2', '1', '0', 'Error'],
      'answer': '2',
    },
    {
      'question':
          'Which of the following is used to convert a string to lowercase in Python?',
      'options': ['lower()', 'upcase()', 'downcase()', 'None of the above'],
      'answer': 'lower()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".startswith("Py"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question': 'Which of the following is used to open a file in Python?',
      'options': ['open()', 'create()', 'file()', 'None of the above'],
      'answer': 'open()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".find("y"))',
      'options': ['1', '0', '-1', 'Error'],
      'answer': '1',
    },
    {
      'question': 'Which of the following is true regarding Python sets?',
      'options': [
        'Sets are ordered',
        'Sets can contain duplicates',
        'Sets are mutable',
        'All of the above'
      ],
      'answer': 'Sets are mutable',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".islower())',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'False',
    },
    {
      'question':
          'Which of the following is not a valid way to define a variable in Python?',
      'options': [
        'my_var = 10',
        'my var = 10',
        'myVar = 10',
        'None of the above'
      ],
      'answer': 'my var = 10',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[1:3])',
      'options': ['Py', 'yt', 'tho', 'Error'],
      'answer': 'yt',
    },
    {
      'question':
          'Which of the following is used to find the smallest value in a list?',
      'options': ['min()', 'lowest()', 'smallest()', 'None of the above'],
      'answer': 'min()',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = {1, 2, 3}\nprint(x.add(4))',
      'options': ['None', '4', 'Error', '{1, 2, 3, 4}'],
      'answer': 'None',
    },
    {
      'question': 'Which of the following is a Python dictionary method?',
      'options': ['keys()', 'values()', 'items()', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".count("l"))',
      'options': ['2', '1', 'Error', 'None'],
      'answer': '2',
    },
    {
      'question':
          'Which of the following is used to generate random numbers in Python?',
      'options': [
        'random()',
        'randint()',
        'random.randint()',
        'None of the above'
      ],
      'answer': 'random.randint()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".upper())',
      'options': ['PYTHON', 'Python', 'Error', 'None'],
      'answer': 'PYTHON',
    },
    {
      'question':
          'Which of the following is used to merge two dictionaries in Python?',
      'options': ['merge()', 'update()', 'join()', 'None of the above'],
      'answer': 'update()',
    },
    {
      'question': 'What is the output of the following code?\n\nprint(10 // 3)',
      'options': ['3', '4', '1', 'Error'],
      'answer': '3',
    },
    {
      'question':
          'Which of the following is used to create a view object that displays a list of a dictionary\'s key-value pairs?',
      'options': ['view()', 'items()', 'pairs()', 'None of the above'],
      'answer': 'items()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("ABC"[0])',
      'options': ['A', 'B', 'C', 'Error'],
      'answer': 'A',
    },
    {
      'question':
          'Which of the following is not a valid way to create a string in Python?',
      'options': ['""', 'None', '\'\'', '""'],
      'answer': 'None',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\nprint(x[-2])',
      'options': ['1', '2', '3', 'Error'],
      'answer': '2',
    },
    {
      'question':
          'Which of the following is used to remove an element from a set in Python?',
      'options': ['remove()', 'discard()', 'pop()', 'All of the above'],
      'answer': 'All of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".isalpha())',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is not a valid way to create a float in Python?',
      'options': ['float(1)', '1.0', '1', 'None'],
      'answer': '1',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint([1, 2, 3].pop())',
      'options': ['3', 'Error', '[1, 2]', '[1, 2, 3]'],
      'answer': '3',
    },
    {
      'question':
          'Which of the following is used to check if a key exists in a dictionary?',
      'options': ['exists()', 'has_key()', 'in', 'None of the above'],
      'answer': 'in',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = "abc"\nprint(x[::-1])',
      'options': ['cba', 'abc', 'Error', 'None'],
      'answer': 'cba',
    },
    {
      'question': 'Which of the following is used to create a list in Python?',
      'options': ['[]', '()', '{}', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello"[1])',
      'options': ['e', 'Error', 'None', 'Hello'],
      'answer': 'e',
    },
    {
      'question':
          'Which of the following is used to find the largest value in a list?',
      'options': ['max()', 'highest()', 'largest()', 'None of the above'],
      'answer': 'max()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("abc".capitalize())',
      'options': ['Abc', 'abc', 'Error', 'None'],
      'answer': 'Abc',
    },
    {
      'question':
          'Which of the following is used to check if a string contains only digits in Python?',
      'options': [
        'isnumeric()',
        'isdigit()',
        'isdecimal()',
        'All of the above'
      ],
      'answer': 'All of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".replace("o", "a"))',
      'options': ['Python', 'Pythan', 'Error', 'None'],
      'answer': 'Pythan',
    },
    {
      'question':
          'Which of the following is used to remove whitespace from the start and end of a string in Python?',
      'options': ['strip()', 'trim()', 'remove()', 'None of the above'],
      'answer': 'strip()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint([1, 2] == [2, 1])',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'False',
    },
    {
      'question':
          'Which of the following is not a valid way to iterate through a dictionary in Python?',
      'options': [
        'for key in dict:',
        'for value in dict.values():',
        'for item in dict.items():',
        'for index in dict:'
      ],
      'answer': 'for index in dict:',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[2])',
      'options': ['t', 'P', 'y', 'Error'],
      'answer': 't',
    },
    {
      'question':
          'Which of the following is not a valid way to check the type of a variable in Python?',
      'options': ['type()', 'isinstance()', 'check_type()', 'None'],
      'answer': 'check_type()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[1:4])',
      'options': ['Pyt', 'yth', 'yth', 'Error'],
      'answer': 'yth',
    },
    {
      'question':
          'Which of the following is used to create a new dictionary in Python?',
      'options': ['{}', '[]', '()', 'None of the above'],
      'answer': '{}',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".swapcase())',
      'options': ['hELLO', 'Hello', 'Error', 'None'],
      'answer': 'hELLO',
    },
    {
      'question':
          'Which of the following is not a valid way to define a lambda function in Python?',
      'options': [
        'lambda x: x * 2',
        'def lambda x: x * 2',
        'lambda x: x + 1',
        'None of the above'
      ],
      'answer': 'def lambda x: x * 2',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = "Python"\nprint(x[0:3])',
      'options': ['Pyt', 'Py', 'Pyth', 'Error'],
      'answer': 'Pyt',
    },
    {
      'question':
          'Which of the following is used to access values in a dictionary?',
      'options': ['()', '[]', '{}', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint([1, 2, 3] + [4])',
      'options': ['[1, 2, 3, 4]', '[1, 2, 3] [4]', '[4, 1, 2, 3]', 'Error'],
      'answer': '[1, 2, 3, 4]',
    },
    {
      'question':
          'Which of the following is not a valid way to remove an item from a list in Python?',
      'options': ['remove()', 'delete()', 'pop()', 'All of the above'],
      'answer': 'delete()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python" == "python")',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'False',
    },
    {
      'question':
          'Which of the following is used to convert a string to an integer in Python?',
      'options': ['int()', 'str()', 'float()', 'None of the above'],
      'answer': 'int()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[3:])',
      'options': ['on', 'Py', 'thon', 'Error'],
      'answer': 'thon',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a number is positive in Python?',
      'options': [
        'if num > 0:',
        'if num >= 0:',
        'if num == 0:',
        'None of the above'
      ],
      'answer': 'if num == 0:',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("ABC".lower())',
      'options': ['abc', 'ABC', 'Error', 'None'],
      'answer': 'abc',
    },
    {
      'question':
          'Which of the following is not a valid way to create a boolean in Python?',
      'options': ['bool(1)', 'True', 'false', 'None'],
      'answer': 'false',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".find("o"))',
      'options': ['4', '0', 'Error', 'None'],
      'answer': '4',
    },
    {
      'question':
          'Which of the following is used to check if a string contains only whitespace in Python?',
      'options': [
        'isspace()',
        'iswhitespace()',
        'isblank()',
        'None of the above'
      ],
      'answer': 'isspace()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".title())',
      'options': ['Hello', 'hello', 'Error', 'None'],
      'answer': 'Hello',
    },
    {
      'question':
          'Which of the following is not a valid way to create a dictionary in Python?',
      'options': ['{}', 'dict()', '[]', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".count("y"))',
      'options': ['1', '0', 'Error', 'None'],
      'answer': '1',
    },
    {
      'question': 'Which of the following is used to create a tuple in Python?',
      'options': ['[]', '()', '{}', 'None of the above'],
      'answer': '()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[0:2])',
      'options': ['Py', 'Pyth', 'Error', 'None'],
      'answer': 'Py',
    },
    {
      'question':
          'Which of the following is used to convert a string to a float in Python?',
      'options': ['float()', 'int()', 'str()', 'None of the above'],
      'answer': 'float()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".split(","))',
      'options': [
        '["Hello", " World"]',
        'Error',
        '["Hello, World"]',
        '["Hello World"]'
      ],
      'answer': '["Hello", " World"]',
    },
    {
      'question':
          'Which of the following is not a valid way to convert a list to a string in Python?',
      'options': ['str()', 'join()', 'join()', 'None of the above'],
      'answer': 'str()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint([1, 2, 3].extend([4, 5]))\nprint([1, 2, 3])',
      'options': [
        'None\n[1, 2, 3, 4, 5]',
        '[1, 2, 3, 4, 5]',
        '[1, 2, 3]',
        'Error'
      ],
      'answer': 'None\n[1, 2, 3, 4, 5]',
    },
    {
      'question':
          'Which of the following is used to create a new list in Python?',
      'options': ['[]', '()', '{}', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint([1, 2, 3].insert(0, 4))\nprint([1, 2, 3])',
      'options': ['None\n[4, 1, 2, 3]', 'Error', '[1, 2, 3]', '[1, 2, 3, 4]'],
      'answer': 'None\n[4, 1, 2, 3]',
    },
    {
      'question':
          'What is the output of the following code?\n\nx = [1, 2, 3]\nprint(x.remove(1))\nprint(x)',
      'options': ['None\n[2, 3]', '[1, 2, 3]', '[2, 3]', 'Error'],
      'answer': 'None\n[2, 3]',
    },
    {
      'question':
          'Which of the following is not a valid way to create a variable in Python?',
      'options': [
        'my_var = 10',
        'my var = 10',
        'myVar = 10',
        'None of the above'
      ],
      'answer': 'my var = 10',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".replace("World", "Python"))',
      'options': ['Hello, Python', 'Hello, World', 'Error', 'None'],
      'answer': 'Hello, Python',
    },
    {
      'question':
          'Which of the following is used to check if a string contains only alphabets in Python?',
      'options': [
        'isalpha()',
        'isletters()',
        'isalphabet()',
        'None of the above'
      ],
      'answer': 'isalpha()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python" * 2)',
      'options': ['PythonPython', 'Python', 'Error', 'None'],
      'answer': 'PythonPython',
    },
    {
      'question':
          'Which of the following is used to get the length of a list in Python?',
      'options': ['len()', 'length()', 'size()', 'None of the above'],
      'answer': 'len()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("abc".upper())',
      'options': ['ABC', 'abc', 'Error', 'None'],
      'answer': 'ABC',
    },
    {
      'question':
          'Which of the following is not a valid way to define a function in Python?',
      'options': [
        'def my_func():',
        'my_func() = def:',
        'lambda x: x + 1',
        'None of the above'
      ],
      'answer': 'my_func() = def:',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".find("P"))',
      'options': ['0', '1', 'Error', '-1'],
      'answer': '0',
    },
    {
      'question': 'Which of the following is used to create a set in Python?',
      'options': ['[]', '()', '{}', 'None of the above'],
      'answer': '{}',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[0:5])',
      'options': ['Pytho', 'Pyth', 'Python', 'Error'],
      'answer': 'Pytho',
    },
    {
      'question':
          'Which of the following is not a valid way to concatenate two strings in Python?',
      'options': [
        'str1 + str2',
        'str1.append(str2)',
        'str1.join(str2)',
        'None of the above'
      ],
      'answer': 'str1.append(str2)',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".index("o"))',
      'options': ['4', '3', 'Error', 'None'],
      'answer': '3',
    },
    {
      'question':
          'Which of the following is used to check if a string starts with a specific substring in Python?',
      'options': [
        'startswith()',
        'beginswith()',
        'start()',
        'None of the above'
      ],
      'answer': 'startswith()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[0:2])',
      'options': ['Py', 'Pyt', 'Error', 'None'],
      'answer': 'Py',
    },
    {
      'question':
          'Which of the following is used to create a frozenset in Python?',
      'options': ['frozenset()', 'set()', '{}', 'None of the above'],
      'answer': 'frozenset()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".capitalize())',
      'options': ['Python', 'Python', 'Error', 'None'],
      'answer': 'Python',
    },
    {
      'question':
          'Which of the following is used to remove an element from a dictionary?',
      'options': ['del', 'remove()', 'discard()', 'None of the above'],
      'answer': 'del',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[-1])',
      'options': ['n', 'Error', 'None', 'Python'],
      'answer': 'n',
    },
    {
      'question':
          'Which of the following is not a valid way to compare two strings in Python?',
      'options': ['==', '!=', 'compare()', 'None of the above'],
      'answer': 'compare()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[-3])',
      'options': ['t', 'n', 'Error', 'o'],
      'answer': 't',
    },
    {
      'question':
          'Which of the following is used to create an empty dictionary in Python?',
      'options': ['{}', '[]', '()', 'None of the above'],
      'answer': '{}',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("abc".endswith("c"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is used to create a frozenset in Python?',
      'options': ['frozenset()', 'set()', '[]', 'None of the above'],
      'answer': 'frozenset()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python" == "Python")',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is used to create an empty list in Python?',
      'options': ['[]', '()', '{}', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("abc".find("a"))',
      'options': ['0', '1', 'Error', '-1'],
      'answer': '0',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a number is odd in Python?',
      'options': [
        'if num % 2 == 1:',
        'if num & 1:',
        'if num // 2 != 0:',
        'None of the above'
      ],
      'answer': 'if num // 2 != 0:',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".count("l"))',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '2',
    },
    {
      'question':
          'Which of the following is used to check if a number is even in Python?',
      'options': [
        'if num % 2 == 0:',
        'if num & 1 == 0:',
        'if num // 2 == 0:',
        'None of the above'
      ],
      'answer': 'if num % 2 == 0:',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[-3:])',
      'options': ['ton', 'Py', 'Error', 'n'],
      'answer': 'ton',
    },
    {
      'question':
          'Which of the following is used to create a new string in Python?',
      'options': ['str()', 'new_string()', 'string()', 'None of the above'],
      'answer': 'str()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".isupper())',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'False',
    },
    {
      'question':
          'Which of the following is used to check if a string contains only lowercase letters in Python?',
      'options': [
        'islower()',
        'is_lower()',
        'is_lowercase()',
        'None of the above'
      ],
      'answer': 'islower()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello"[1:3])',
      'options': ['el', 'e', 'Error', 'He'],
      'answer': 'el',
    },
    {
      'question':
          'Which of the following is not a valid way to create a string in Python?',
      'options': ['"Hello"', "'Hello'", 'Hello', 'None of the above'],
      'answer': 'Hello',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python" + "Programming")',
      'options': ['PythonProgramming', 'Error', 'None', 'Python Programming'],
      'answer': 'PythonProgramming',
    },
    {
      'question':
          'Which of the following is used to get the absolute value of a number in Python?',
      'options': ['abs()', 'absolute()', 'abs_value()', 'None of the above'],
      'answer': 'abs()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".replace("P", "J"))',
      'options': ['Jython', 'Python', 'Error', 'None'],
      'answer': 'Jython',
    },
    {
      'question':
          'Which of the following is used to check if a string contains only uppercase letters in Python?',
      'options': [
        'isupper()',
        'is_upper()',
        'is_uppercase()',
        'None of the above'
      ],
      'answer': 'isupper()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[:3])',
      'options': ['Pyt', 'Py', 'Pyth', 'Error'],
      'answer': 'Pyt',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a variable is None in Python?',
      'options': [
        'if var is None:',
        'if var == None:',
        'if var != None:',
        'None of the above'
      ],
      'answer': 'if var != None:',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python" * 3)',
      'options': ['PythonPythonPython', 'Python', 'Error', 'None'],
      'answer': 'PythonPythonPython',
    },
    {
      'question': 'Which of the following is used to round a number in Python?',
      'options': ['round()', 'ceil()', 'floor()', 'None of the above'],
      'answer': 'round()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello"[0])',
      'options': ['H', 'e', 'Error', 'Hello'],
      'answer': 'H',
    },
    {
      'question':
          'Which of the following is used to create an empty set in Python?',
      'options': ['set()', '{}', 'None', 'All of the above'],
      'answer': 'set()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python" + "3.0")',
      'options': ['Python3.0', 'Error', 'None', 'Python 3.0'],
      'answer': 'Python3.0',
    },
    {
      'question':
          'Which of the following is not a valid way to get the current time in Python?',
      'options': [
        'time()',
        'datetime.now()',
        'time.localtime()',
        'None of the above'
      ],
      'answer': 'time()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".startswith("He"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is used to convert a string to a boolean in Python?',
      'options': ['bool()', 'convert()', 'to_bool()', 'None of the above'],
      'answer': 'bool()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[-2])',
      'options': ['o', 'n', 'Error', 'None'],
      'answer': 'o',
    },
    {
      'question':
          'Which of the following is used to convert an integer to a string in Python?',
      'options': ['str()', 'int()', 'string()', 'None of the above'],
      'answer': 'str()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[-3:])',
      'options': ['ton', 'on', 'Error', 'n'],
      'answer': 'ton',
    },
    {
      'question':
          'Which of the following is not a valid way to define a dictionary in Python?',
      'options': ['{}', 'dict()', '[]', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[0])',
      'options': ['P', 'p', 'Error', 'None'],
      'answer': 'P',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a variable is an integer in Python?',
      'options': [
        'isinstance(var, int)',
        'type(var) == int',
        'isint()',
        'None of the above'
      ],
      'answer': 'isint()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".startswith("P"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is used to get the maximum value in a dictionary?',
      'options': ['max()', 'highest()', 'max_value()', 'None of the above'],
      'answer': 'max()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".islower())',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'False',
    },
    {
      'question':
          'Which of the following is used to remove a key from a dictionary?',
      'options': ['del', 'remove()', 'discard()', 'None of the above'],
      'answer': 'del',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[-1])',
      'options': ['n', 'Error', 'None', 'Python'],
      'answer': 'n',
    },
    {
      'question':
          'Which of the following is not a valid way to create a boolean in Python?',
      'options': ['bool(0)', 'True', 'false', 'None'],
      'answer': 'false',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".count("o"))',
      'options': ['0', '1', 'Error', 'None'],
      'answer': '0',
    },
    {
      'question': 'Which of the following is used to create a list in Python?',
      'options': ['[]', '()', '{}', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".index("n"))',
      'options': ['5', '4', 'Error', 'None'],
      'answer': '4',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a number is positive in Python?',
      'options': [
        'if num > 0:',
        'if num >= 0:',
        'if num < 0:',
        'None of the above'
      ],
      'answer': 'if num < 0:',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".count("P"))',
      'options': ['1', '0', 'Error', 'None'],
      'answer': '1',
    },
    {
      'question':
          'Which of the following is used to create a new variable in Python?',
      'options': ['=', '==', ':=', 'None of the above'],
      'answer': '=',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".split("l"))',
      'options': ['["He", "lo"]', '["Hel", "o"]', 'Error', 'None'],
      'answer': '["He", "lo"]',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is empty in Python?',
      'options': [
        'if not string:',
        'if string == "":',
        'if string:',
        'None of the above'
      ],
      'answer': 'if string:',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[2:5])',
      'options': ['tho', 'tho', 'Pyt', 'Error'],
      'answer': 'tho',
    },
    {
      'question':
          'Which of the following is used to get the current date in Python?',
      'options': [
        'date.today()',
        'datetime.now()',
        'datetime.today()',
        'None of the above'
      ],
      'answer': 'date.today()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".strip("H"))',
      'options': ['ello', 'Hello', 'Error', 'None'],
      'answer': 'ello',
    },
    {
      'question':
          'Which of the following is not a valid way to create a number in Python?',
      'options': ['10', '10.5', '0b10', 'None of the above'],
      'answer': 'None of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[:-1])',
      'options': ['Pytho', 'Pytho', 'Error', 'Python'],
      'answer': 'Pytho',
    },
    {
      'question':
          'Which of the following is used to create a slice of a list in Python?',
      'options': ['slice()', '[:]', '[::]', 'None of the above'],
      'answer': '[:]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[-2:])',
      'options': ['on', 'n', 'Error', 'None'],
      'answer': 'on',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is numeric in Python?',
      'options': [
        'isnumeric()',
        'isdigit()',
        'is_number()',
        'None of the above'
      ],
      'answer': 'is_number()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".upper())',
      'options': ['HELLO', 'hello', 'Error', 'None'],
      'answer': 'HELLO',
    },
    {
      'question':
          'Which of the following is used to remove all elements from a list in Python?',
      'options': ['clear()', 'remove()', 'delete()', 'None of the above'],
      'answer': 'clear()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[-1:])',
      'options': ['n', 'Error', 'None', 'Python'],
      'answer': 'n',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string contains only digits in Python?',
      'options': [
        'isdigit()',
        'is_numeric()',
        'isdecimal()',
        'None of the above'
      ],
      'answer': 'is_numeric()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".rfind("n"))',
      'options': ['4', '5', 'Error', 'None'],
      'answer': '4',
    },
    {
      'question':
          'Which of the following is used to check if a string contains only whitespace in Python?',
      'options': [
        'isspace()',
        'is_whitespace()',
        'isblank()',
        'None of the above'
      ],
      'answer': 'isspace()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".strip("H"))',
      'options': ['ello, World', 'Hello, World', 'Error', 'None'],
      'answer': 'ello, World',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is alphanumeric in Python?',
      'options': [
        'isalnum()',
        'is_alpha_numeric()',
        'is_alnum()',
        'None of the above'
      ],
      'answer': 'is_alpha_numeric()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".count("P"))',
      'options': ['1', '0', 'Error', 'None'],
      'answer': '1',
    },
    {
      'question':
          'Which of the following is used to create an empty bytearray in Python?',
      'options': ['bytearray()', '[]', '{}', 'None of the above'],
      'answer': 'bytearray()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".split(" "))',
      'options': ['["Hello,", "World"]', '["Hello", "World"]', 'Error', 'None'],
      'answer': '["Hello,", "World"]',
    },
    {
      'question':
          'Which of the following is not a valid way to create a variable in Python?',
      'options': [
        'my_var = 10',
        'my var = 10',
        'myVar = 10',
        'None of the above'
      ],
      'answer': 'my var = 10',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".rindex("n"))',
      'options': ['4', '5', 'Error', 'None'],
      'answer': '4',
    },
    {
      'question':
          'Which of the following is used to create a new bytearray in Python?',
      'options': ['bytearray()', '[]', '{}', 'None of the above'],
      'answer': 'bytearray()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello"[1])',
      'options': ['H', 'e', 'Error', 'l'],
      'answer': 'e',
    },
    {
      'question':
          'Which of the following is used to check if a string is a valid identifier in Python?',
      'options': [
        'isidentifier()',
        'is_valid()',
        'is_id()',
        'None of the above'
      ],
      'answer': 'isidentifier()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".capitalize())',
      'options': ['Python', 'Error', 'None', 'PYTHON'],
      'answer': 'Python',
    },
    {
      'question':
          'Which of the following is not a valid way to remove duplicates from a list in Python?',
      'options': ['set()', 'list()', 'unique()', 'None of the above'],
      'answer': 'unique()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".startswith("Hello"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is used to get the number of items in a dictionary?',
      'options': ['len()', 'length()', 'size()', 'None of the above'],
      'answer': 'len()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".endswith("n"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is used to convert a bytearray to a string in Python?',
      'options': ['decode()', 'encode()', 'str()', 'None of the above'],
      'answer': 'decode()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".find("o"))',
      'options': ['4', '3', 'Error', 'None'],
      'answer': '3',
    },
    {
      'question':
          'Which of the following is used to get the length of a string in Python?',
      'options': ['len()', 'length()', 'size()', 'None of the above'],
      'answer': 'len()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".replace("o", "a"))',
      'options': ['Hella, Warld', 'Hello, World', 'Error', 'None'],
      'answer': 'Hella, Warld',
    },
    {
      'question':
          'Which of the following is not a valid way to create a tuple in Python?',
      'options': ['()', '[]', 'tuple()', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".count("l"))',
      'options': ['3', '2', 'Error', 'None'],
      'answer': '3',
    },
    {
      'question':
          'Which of the following is used to convert a string to an integer in Python?',
      'options': ['int()', 'str()', 'float()', 'None of the above'],
      'answer': 'int()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".split(","))',
      'options': ['["Hello", " World"]', '["Hello", "World"]', 'Error', 'None'],
      'answer': '["Hello", " World"]',
    },
    {
      'question':
          'Which of the following is not a valid way to create a float in Python?',
      'options': ['10', '10.0', '0b10', 'None of the above'],
      'answer': '0b10',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[0:2])',
      'options': ['Py', 'Pyt', 'Error', 'None'],
      'answer': 'Py',
    },
    {
      'question':
          'Which of the following is used to check if a string contains only letters in Python?',
      'options': [
        'isalpha()',
        'is_letters()',
        'isalpha_numeric()',
        'None of the above'
      ],
      'answer': 'isalpha()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".count("o"))',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '2',
    },
    {
      'question':
          'Which of the following is used to convert a string to a float in Python?',
      'options': ['float()', 'int()', 'str()', 'None of the above'],
      'answer': 'float()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".find("l"))',
      'options': ['2', '1', 'Error', 'None'],
      'answer': '2',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is a valid email in Python?',
      'options': [
        'is_valid_email()',
        're.match()',
        'is_email()',
        'None of the above'
      ],
      'answer': 'is_valid_email()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".startswith("y"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'False',
    },
    {
      'question':
          'Which of the following is used to convert a float to a string in Python?',
      'options': ['str()', 'float()', 'to_string()', 'None of the above'],
      'answer': 'str()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".endswith("World"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is not a valid way to create a frozenset in Python?',
      'options': ['frozenset()', '[]', 'set()', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".index("l"))',
      'options': ['2', '1', 'Error', 'None'],
      'answer': '2',
    },
    {
      'question':
          'Which of the following is used to get the minimum value in a dictionary?',
      'options': ['min()', 'lowest()', 'min_value()', 'None of the above'],
      'answer': 'min()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".capitalize())',
      'options': ['Hello', 'hello', 'Error', 'None'],
      'answer': 'Hello',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is uppercase in Python?',
      'options': [
        'isupper()',
        'is_upper()',
        'is_uppercase()',
        'None of the above'
      ],
      'answer': 'is_upper()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[1:3])',
      'options': ['Py', 'yth', 'Error', 'yt'],
      'answer': 'yth',
    },
    {
      'question':
          'Which of the following is used to create an empty dictionary in Python?',
      'options': ['{}', 'dict()', 'Both', 'None of the above'],
      'answer': 'Both',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".replace("n", "N"))',
      'options': ['PythoN', 'Error', 'Python', 'None'],
      'answer': 'PythoN',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is a valid URL in Python?',
      'options': [
        'is_valid_url()',
        're.match()',
        'is_url()',
        'None of the above'
      ],
      'answer': 'is_valid_url()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".isupper())',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'False',
    },
    {
      'question':
          'Which of the following is used to convert a byte to a string in Python?',
      'options': ['decode()', 'encode()', 'str()', 'None of the above'],
      'answer': 'decode()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".isalpha())',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is not a valid way to create a set in Python?',
      'options': ['set()', '[]', '{}', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".join(["Hello", "World"]))',
      'options': ['HelloPythonWorld', 'Hello World', 'Error', 'None'],
      'answer': 'HelloPythonWorld',
    },
    {
      'question':
          'Which of the following is used to get the current time in Python?',
      'options': [
        'time.time()',
        'datetime.now()',
        'time.localtime()',
        'None of the above'
      ],
      'answer': 'datetime.now()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".title())',
      'options': ['Hello', 'Hello World', 'Error', 'None'],
      'answer': 'Hello',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a variable is a list in Python?',
      'options': [
        'isinstance(var, list)',
        'type(var) == list',
        'is_list()',
        'None of the above'
      ],
      'answer': 'is_list()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".find("x"))',
      'options': ['-1', 'Error', 'None', '0'],
      'answer': '-1',
    },
    {
      'question':
          'Which of the following is used to get the length of a dictionary in Python?',
      'options': ['len()', 'length()', 'size()', 'None of the above'],
      'answer': 'len()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".count("a"))',
      'options': ['0', '1', 'Error', 'None'],
      'answer': '0',
    },
    {
      'question':
          'Which of the following is not a valid way to create a frozenset in Python?',
      'options': ['frozenset()', '[]', 'set()', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".startswith("P"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is used to get the maximum value in a dictionary?',
      'options': ['max()', 'highest()', 'max_value()', 'None of the above'],
      'answer': 'max()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".split("l"))',
      'options': [
        '["He", "lo, World"]',
        '["Hel", "lo, Wor", "d"]',
        'Error',
        'None'
      ],
      'answer': '["Hel", "lo, Wor", "d"]',
    },
    {
      'question':
          'Which of the following is not a valid way to create a boolean in Python?',
      'options': ['True', 'False', '1', 'None of the above'],
      'answer': 'None of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".index("o"))',
      'options': ['4', '5', 'Error', 'None'],
      'answer': '4',
    },
    {
      'question':
          'Which of the following is used to get the current date and time in Python?',
      'options': [
        'datetime.now()',
        'datetime.today()',
        'datetime.current()',
        'None of the above'
      ],
      'answer': 'datetime.now()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".isalnum())',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a variable is a tuple in Python?',
      'options': [
        'isinstance(var, tuple)',
        'type(var) == tuple',
        'is_tuple()',
        'None of the above'
      ],
      'answer': 'is_tuple()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".find("y"))',
      'options': ['1', '0', 'Error', 'None'],
      'answer': '1',
    },
    {
      'question':
          'Which of the following is used to convert a list to a set in Python?',
      'options': ['set()', 'list()', '[]', 'None of the above'],
      'answer': 'set()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".count("l"))',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '2',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a variable is a string in Python?',
      'options': [
        'isinstance(var, str)',
        'type(var) == str',
        'is_string()',
        'None of the above'
      ],
      'answer': 'is_string()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".index("o"))',
      'options': ['3', '4', 'Error', 'None'],
      'answer': 'Error',
    },
    {
      'question':
          'Which of the following is used to check if a string contains only numbers in Python?',
      'options': [
        'isnumeric()',
        'isdigit()',
        'is_number()',
        'None of the above'
      ],
      'answer': 'isnumeric()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".count("n"))',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '1',
    },
    {
      'question':
          'Which of the following is used to check if a string is lowercase in Python?',
      'options': [
        'islower()',
        'is_lower()',
        'is_lowercase()',
        'None of the above'
      ],
      'answer': 'islower()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".find("H"))',
      'options': ['0', '1', 'Error', 'None'],
      'answer': '0',
    },
    {
      'question':
          'Which of the following is not a valid way to create a lambda function in Python?',
      'options': [
        'lambda x: x + 1',
        'x => x + 1',
        'lambda x: x + 1',
        'None of the above'
      ],
      'answer': 'x => x + 1',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".title())',
      'options': ['Python', 'Error', 'None', 'Python'],
      'answer': 'Python',
    },
    {
      'question':
          'Which of the following is used to create a dictionary in Python?',
      'options': ['{}', '[]', '()', 'None of the above'],
      'answer': '{}',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".replace("o", "O"))',
      'options': ['HellO, WOrld', 'Hello, World', 'Error', 'None'],
      'answer': 'HellO, WOrld',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is a valid JSON in Python?',
      'options': [
        'is_valid_json()',
        'json.loads()',
        'is_json()',
        'None of the above'
      ],
      'answer': 'is_valid_json()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".endswith("on"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is used to get the current date in Python?',
      'options': [
        'date.today()',
        'datetime.now()',
        'datetime.today()',
        'None of the above'
      ],
      'answer': 'date.today()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".count("l"))',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '3',
    },
    {
      'question':
          'Which of the following is not a valid way to create a tuple in Python?',
      'options': ['()', '[]', 'tuple()', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".find("o"))',
      'options': ['-1', 'Error', 'None', '0'],
      'answer': '-1',
    },
    {
      'question':
          'Which of the following is used to get the current time in Python?',
      'options': [
        'time.time()',
        'datetime.now()',
        'time.localtime()',
        'None of the above'
      ],
      'answer': 'datetime.now()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".join(["Hello", "World"]))',
      'options': ['HelloPythonWorld', 'Hello World', 'Error', 'None'],
      'answer': 'HelloPythonWorld',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is a valid URL in Python?',
      'options': [
        'is_valid_url()',
        're.match()',
        'is_url()',
        'None of the above'
      ],
      'answer': 'is_valid_url()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".title())',
      'options': ['Hello', 'Hello World', 'Error', 'None'],
      'answer': 'Hello',
    },
    {
      'question':
          'Which of the following is used to create an empty dictionary in Python?',
      'options': ['{}', 'dict()', 'Both', 'None of the above'],
      'answer': 'Both',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".replace("n", "N"))',
      'options': ['PythoN', 'Error', 'Python', 'None'],
      'answer': 'PythoN',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is uppercase in Python?',
      'options': [
        'isupper()',
        'is_upper()',
        'is_uppercase()',
        'None of the above'
      ],
      'answer': 'is_upper()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[1:3])',
      'options': ['Py', 'yth', 'Error', 'yt'],
      'answer': 'yth',
    },
    {
      'question':
          'Which of the following is used to get the maximum value in a dictionary?',
      'options': ['max()', 'highest()', 'max_value()', 'None of the above'],
      'answer': 'max()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".split("l"))',
      'options': [
        '["He", "lo, World"]',
        '["Hel", "lo, Wor", "d"]',
        'Error',
        'None'
      ],
      'answer': '["Hel", "lo, Wor", "d"]',
    },
    {
      'question':
          'Which of the following is not a valid way to create a boolean in Python?',
      'options': ['True', 'False', '1', 'None of the above'],
      'answer': 'None of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".index("o"))',
      'options': ['4', '5', 'Error', 'None'],
      'answer': '4',
    },
    {
      'question':
          'Which of the following is used to get the current date and time in Python?',
      'options': [
        'datetime.now()',
        'datetime.today()',
        'datetime.current()',
        'None of the above'
      ],
      'answer': 'datetime.now()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".isalnum())',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a variable is a tuple in Python?',
      'options': [
        'isinstance(var, tuple)',
        'type(var) == tuple',
        'is_tuple()',
        'None of the above'
      ],
      'answer': 'is_tuple()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".find("y"))',
      'options': ['1', '0', 'Error', 'None'],
      'answer': '1',
    },
    {
      'question':
          'Which of the following is used to convert a list to a set in Python?',
      'options': ['set()', 'list()', '[]', 'None of the above'],
      'answer': 'set()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".count("l"))',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '2',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a variable is a string in Python?',
      'options': [
        'isinstance(var, str)',
        'type(var) == str',
        'is_string()',
        'None of the above'
      ],
      'answer': 'is_string()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".index("o"))',
      'options': ['3', '4', 'Error', 'None'],
      'answer': 'Error',
    },
    {
      'question':
          'Which of the following is used to check if a string contains only numbers in Python?',
      'options': [
        'isnumeric()',
        'isdigit()',
        'is_number()',
        'None of the above'
      ],
      'answer': 'isnumeric()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".count("n"))',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '1',
    },
    {
      'question':
          'Which of the following is used to check if a string is lowercase in Python?',
      'options': [
        'islower()',
        'is_lower()',
        'is_lowercase()',
        'None of the above'
      ],
      'answer': 'islower()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".find("H"))',
      'options': ['0', '1', 'Error', 'None'],
      'answer': '0',
    },
    {
      'question':
          'Which of the following is not a valid way to create a lambda function in Python?',
      'options': [
        'lambda x: x + 1',
        'x => x + 1',
        'lambda x: x + 1',
        'None of the above'
      ],
      'answer': 'x => x + 1',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".title())',
      'options': ['Python', 'Error', 'None', 'Python'],
      'answer': 'Python',
    },
    {
      'question':
          'Which of the following is used to create a dictionary in Python?',
      'options': ['{}', '[]', '()', 'None of the above'],
      'answer': '{}',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".replace("o", "O"))',
      'options': ['HellO, WOrld', 'Hello, World', 'Error', 'None'],
      'answer': 'HellO, WOrld',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is a valid JSON in Python?',
      'options': [
        'is_valid_json()',
        'json.loads()',
        'is_json()',
        'None of the above'
      ],
      'answer': 'is_valid_json()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".endswith("on"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is used to get the current date in Python?',
      'options': [
        'date.today()',
        'datetime.now()',
        'datetime.today()',
        'None of the above'
      ],
      'answer': 'date.today()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".count("l"))',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '3',
    },
    {
      'question':
          'Which of the following is not a valid way to create a tuple in Python?',
      'options': ['()', '[]', 'tuple()', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".find("o"))',
      'options': ['-1', 'Error', 'None', '0'],
      'answer': '-1',
    },
    {
      'question':
          'Which of the following is used to get the current time in Python?',
      'options': [
        'time.time()',
        'datetime.now()',
        'time.localtime()',
        'None of the above'
      ],
      'answer': 'datetime.now()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".join(["Hello", "World"]))',
      'options': ['HelloPythonWorld', 'Hello World', 'Error', 'None'],
      'answer': 'HelloPythonWorld',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is a valid URL in Python?',
      'options': [
        'is_valid_url()',
        're.match()',
        'is_url()',
        'None of the above'
      ],
      'answer': 'is_valid_url()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".title())',
      'options': ['Hello', 'Hello World', 'Error', 'None'],
      'answer': 'Hello',
    },
    {
      'question':
          'Which of the following is used to create an empty dictionary in Python?',
      'options': ['{}', 'dict()', 'Both', 'None of the above'],
      'answer': 'Both',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".replace("n", "N"))',
      'options': ['PythoN', 'Error', 'Python', 'None'],
      'answer': 'PythoN',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is uppercase in Python?',
      'options': [
        'isupper()',
        'is_upper()',
        'is_uppercase()',
        'None of the above'
      ],
      'answer': 'is_upper()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[1:3])',
      'options': ['Py', 'yth', 'Error', 'yt'],
      'answer': 'yth',
    },
    {
      'question':
          'Which of the following is used to get the maximum value in a dictionary?',
      'options': ['max()', 'highest()', 'max_value()', 'None of the above'],
      'answer': 'max()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".split("l"))',
      'options': [
        '["He", "lo, World"]',
        '["Hel", "lo, Wor", "d"]',
        'Error',
        'None'
      ],
      'answer': '["Hel", "lo, Wor", "d"]',
    },
    {
      'question':
          'Which of the following is not a valid way to create a boolean in Python?',
      'options': ['True', 'False', '1', 'None of the above'],
      'answer': 'None of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".index("o"))',
      'options': ['4', '5', 'Error', 'None'],
      'answer': '4',
    },
    {
      'question':
          'Which of the following is used to get the current date and time in Python?',
      'options': [
        'datetime.now()',
        'datetime.today()',
        'datetime.current()',
        'None of the above'
      ],
      'answer': 'datetime.now()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".isalnum())',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a variable is a tuple in Python?',
      'options': [
        'isinstance(var, tuple)',
        'type(var) == tuple',
        'is_tuple()',
        'None of the above'
      ],
      'answer': 'is_tuple()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".find("y"))',
      'options': ['1', '0', 'Error', 'None'],
      'answer': '1',
    },
    {
      'question':
          'Which of the following is used to convert a list to a set in Python?',
      'options': ['set()', 'list()', '[]', 'None of the above'],
      'answer': 'set()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".count("l"))',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '2',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a variable is a string in Python?',
      'options': [
        'isinstance(var, str)',
        'type(var) == str',
        'is_string()',
        'None of the above'
      ],
      'answer': 'is_string()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".index("o"))',
      'options': ['3', '4', 'Error', 'None'],
      'answer': 'Error',
    },
    {
      'question':
          'Which of the following is used to check if a string contains only numbers in Python?',
      'options': [
        'isnumeric()',
        'isdigit()',
        'is_number()',
        'None of the above'
      ],
      'answer': 'isnumeric()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".count("n"))',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '1',
    },
    {
      'question':
          'Which of the following is used to check if a string is lowercase in Python?',
      'options': [
        'islower()',
        'is_lower()',
        'is_lowercase()',
        'None of the above'
      ],
      'answer': 'islower()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".find("H"))',
      'options': ['0', '1', 'Error', 'None'],
      'answer': '0',
    },
    {
      'question':
          'Which of the following is not a valid way to create a lambda function in Python?',
      'options': [
        'lambda x: x + 1',
        'x => x + 1',
        'lambda x: x + 1',
        'None of the above'
      ],
      'answer': 'x => x + 1',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".title())',
      'options': ['Python', 'Error', 'None', 'Python'],
      'answer': 'Python',
    },
    {
      'question':
          'Which of the following is used to create a dictionary in Python?',
      'options': ['{}', '[]', '()', 'None of the above'],
      'answer': '{}',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".replace("o", "O"))',
      'options': ['HellO, WOrld', 'Hello, World', 'Error', 'None'],
      'answer': 'HellO, WOrld',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is a valid JSON in Python?',
      'options': [
        'is_valid_json()',
        'json.loads()',
        'is_json()',
        'None of the above'
      ],
      'answer': 'is_valid_json()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".endswith("on"))',
      'options': ['True', 'False', 'Error', 'None'],
      'answer': 'True',
    },
    {
      'question':
          'Which of the following is used to get the current date in Python?',
      'options': [
        'date.today()',
        'datetime.now()',
        'datetime.today()',
        'None of the above'
      ],
      'answer': 'date.today()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".count("l"))',
      'options': ['1', '2', 'Error', 'None'],
      'answer': '3',
    },
    {
      'question':
          'Which of the following is not a valid way to create a tuple in Python?',
      'options': ['()', '[]', 'tuple()', 'None of the above'],
      'answer': '[]',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".find("o"))',
      'options': ['-1', 'Error', 'None', '0'],
      'answer': '-1',
    },
    {
      'question':
          'Which of the following is used to get the current time in Python?',
      'options': [
        'time.time()',
        'datetime.now()',
        'time.localtime()',
        'None of the above'
      ],
      'answer': 'datetime.now()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".join(["Hello", "World"]))',
      'options': ['HelloPythonWorld', 'Hello World', 'Error', 'None'],
      'answer': 'HelloPythonWorld',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is a valid URL in Python?',
      'options': [
        'is_valid_url()',
        're.match()',
        'is_url()',
        'None of the above'
      ],
      'answer': 'is_valid_url()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello".title())',
      'options': ['Hello', 'Hello World', 'Error', 'None'],
      'answer': 'Hello',
    },
    {
      'question':
          'Which of the following is used to create an empty dictionary in Python?',
      'options': ['{}', 'dict()', 'Both', 'None of the above'],
      'answer': 'Both',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python".replace("n", "N"))',
      'options': ['PythoN', 'Error', 'Python', 'None'],
      'answer': 'PythoN',
    },
    {
      'question':
          'Which of the following is not a valid way to check if a string is uppercase in Python?',
      'options': [
        'isupper()',
        'is_upper()',
        'is_uppercase()',
        'None of the above'
      ],
      'answer': 'is_upper()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Python"[1:3])',
      'options': ['Py', 'yth', 'Error', 'yt'],
      'answer': 'yth',
    },
    {
      'question':
          'Which of the following is used to get the maximum value in a dictionary?',
      'options': ['max()', 'highest()', 'max_value()', 'None of the above'],
      'answer': 'max()',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".split("l"))',
      'options': [
        '["He", "lo, World"]',
        '["Hel", "lo, Wor", "d"]',
        'Error',
        'None'
      ],
      'answer': '["Hel", "lo, Wor", "d"]',
    },
    {
      'question':
          'Which of the following is not a valid way to create a boolean in Python?',
      'options': ['True', 'False', '1', 'None of the above'],
      'answer': 'None of the above',
    },
    {
      'question':
          'What is the output of the following code?\n\nprint("Hello, World".index("o"))',
      'options': ['4', '5', 'Error', 'None'],
      'answer': '4',
    },
    {
      'question':
          'Which of the following is used to get the current date and time in Python?',
      'options': [
        'datetime.now()',
        'datetime.today()',
        'datetime.current()',
        'None of the above'
      ],
      'answer': 'datetime.now()',
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
