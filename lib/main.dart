import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},dsd
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal ?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dot', 'score': 5},
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 1},
      ]
    },
    {
      'questionText': 'Who\'s your favourite instructor ?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 5},
        {'text': 'Max', 'score': 3},
        {'text': 'Max', 'score': 1},
      ]
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    _totalScore += score;

    print(_questionIndex);
    if (_questionIndex > _questions.length) {
      print('we have more question');
    } else {
      print('No more question');
    }
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
