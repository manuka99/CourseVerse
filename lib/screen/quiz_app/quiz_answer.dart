import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final void Function() selectHandler;
  final String anstxt;

  Answers(this.selectHandler, this.anstxt);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Color.fromARGB(255, 94, 21, 107),
        textColor: Colors.white,
        child: Text(anstxt),
        onPressed: selectHandler,
      ),
    );
  }
}
