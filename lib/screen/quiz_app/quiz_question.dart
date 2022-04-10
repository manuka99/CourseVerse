import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String questiontxt;

  Questions(this.questiontxt);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Text(
        questiontxt,
        style: TextStyle(
          color: Color.fromARGB(255, 94, 21, 107),
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
