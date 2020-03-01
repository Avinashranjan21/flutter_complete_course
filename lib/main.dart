import 'package:flutter/material.dart';
import 'package:flutter_complete_course/answer.dart';
import 'package:flutter_complete_course/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var isQuestionContinue = true;

  var _question = [
    {
      'questionText': 'What is your Profession?',
      'answerOption': ['Software', 'Police', 'Electrician', 'None of above']
    },
    {
      'questionText': 'What is your favorite topic?',
      'answerOption': [
        'Machine Learning',
        'IOT',
        'Augmented Reality',
        'None of above'
      ]
    },
    {
      'questionText': 'What is your favorite programming language?',
      'answerOption': ['Kotlin', 'Dart', 'Python', 'None of above']
    },
    {
      'questionText': 'What is your favorite operating system?',
      'answerOption': ['MacOS', 'Linux', 'Windows 10', 'None of above']
    },
  ];

  void questionAnswered() {
    setState(() {
      if (_questionIndex == _question.length - 1) {
//        _questionIndex = 0;
        isQuestionContinue = false;
      } else {
        _questionIndex += 1;
      }
    });
    print("Question answered for index $_questionIndex");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: isQuestionContinue
            ? Column(
                children: [
                  Question(_question[_questionIndex]['questionText']),
                  ...(_question[_questionIndex]['answerOption'] as List<String>)
                      .map((answer) {
                    return Answer(answer, questionAnswered);
                  }).toList()
                ],
              )
            : Center(
                child: Text("Yipee all question done!!"),
              ),
      ),
    );
  }
}
