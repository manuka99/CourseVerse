// Quiz_

import 'package:app/screen/quiz_app/quiz_question.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './quiz_answer.dart';
// import './quiz_question.dart';

class Quizes extends StatelessWidget {
  final List<Map<String, Object>> ques;
  final int q_index;
  final Function ans_q;

  Quizes({
    required this.ques,
    required this.q_index,
    required this.ans_q,
  });

  Widget build(BuildContext context) {
    return Column(
      children: [
        Questions(
          ques[q_index]['questiontxt'] as String,
        ),
        ...(ques[q_index]['options'] as List<Map<String, Object>>)
            .map((answer) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Answers(() => ans_q(answer['point']), answer['text'] as String),
          );
        }).toList()
      ],
    );
  }
}
