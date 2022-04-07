import 'package:flutter/material.dart';
import './quiz.dart';
import './quiz_output.dart';

class MainQuiz extends StatefulWidget {
  const MainQuiz({Key? key}) : super(key: key);

  @override
  State<MainQuiz> createState() => _MainQuizState();
}

class _MainQuizState extends State<MainQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          backgroundColor: Color.fromARGB(255, 94, 21, 107),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _q_index < _ques.length
              ? Quizes(
                  ans_q: _ans_q,
                  q_index: _q_index,
                  ques: _ques,
                )
              : OutputResult(_tot_score, _Quizesreset),
        ));
  }

  final _ques = const [
    {
      'questiontxt': "1. Which is not an OOP concept? ",
      'options': [
        {'text': 'Abstraction', 'point': 0},
        {'text': 'Encapsulation', 'point': 0},
        {'text': 'Inheritance', 'point': 0},
        {'text': 'Multithreading', 'point': 1},
      ],
    },
    {
      'questiontxt': "2. Who invented Java?",
      'options': [
        {'text': 'James Gosling', 'point': 1},
        {'text': 'Dennis Ritchie', 'point': 0},
        {'text': 'Bjarne Stroustrup', 'point': 0},
        {'text': 'Anders Hejlsberg', 'point': 0},
      ],
    },
    {
      'questiontxt': "3. Which is not an OOP concept? ",
      'options': [
        {'text': 'Abstraction', 'point': 0},
        {'text': 'Multithreading', 'point': 1},
        {'text': 'Encapsulation', 'point': 0},
        {'text': 'Inheritance', 'point': 0},
      ],
    },
    {
      'questiontxt': "4. Who invented Java",
      'options': [
        {'text': 'Dennis Ritchie', 'point': 0},
        {'text': 'James Gosling', 'point': 1},
        {'text': 'Bjarne Stroustrup', 'point': 0},
        {'text': 'Anders Hejlsberg', 'point': 0},
      ],
    },
    {
      'questiontxt': "5. Who invented Java",
      'options': [
        {'text': 'Dennis Ritchie', 'point': 0},
        {'text': 'Bjarne Stroustrup', 'point': 0},
        {'text': 'James Gosling', 'point': 1},
        {'text': 'Anders Hejlsberg', 'point': 0},
      ],
    },
  ];

  var _q_index = 0;
  var _tot_score = 0;

  void _Quizesreset() {
    setState(() {
      _q_index = 0;
      _tot_score = 0;
    });
  }

  void _ans_q(int point) {
    _tot_score += point;
    setState(() {
      _q_index = _q_index + 1;
    });
    print(_q_index);
    if (_q_index < _ques.length) {
      print('Have More Questions!');
    } else {
      print('No Questions!');
    }
  }
}
