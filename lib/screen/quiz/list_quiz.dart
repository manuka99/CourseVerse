import 'dart:async';
import 'dart:convert';

import 'package:app/screen/quiz/list_questions.dart';
import 'package:app/screen/quiz/list_quiz.dart';
import 'package:app/screen/quiz/update_quiz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './add_quiz.dart';
import '../../home.dart';
import '../../main.dart';
import 'package:app/screen/quiz/add_quiz.dart';
import 'list_quiz.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({required this.index, required this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://localhost/course_verse/app/lib/backend/delete_quiz.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return QuizList();
    }));
    _DeleteData(context, "Deleted");
  }

  void _DeleteData(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'Done', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "${widget.list[widget.index]['question']}",
      )),
      body: Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                new Text(widget.list[widget.index]['question'],
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    )),
                new Text(
                  "Option 1 : ${widget.list[widget.index]['option1']}",
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
                new Text(
                  "Option 2 : ${widget.list[widget.index]['option2']}",
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
                new Text(
                  "Option 3 : ${widget.list[widget.index]['option3']}",
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
                new Text(
                  "Option 4 : ${widget.list[widget.index]['option4']}",
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),
                new Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: new RaisedButton(
                        child: new Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                        onPressed: () => Navigator.of(context)
                            .pushReplacement(new MaterialPageRoute(
                          builder: (BuildContext context) => new UpdateQuiz(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: new RaisedButton(
                        child: new Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                        onPressed: () => deleteData(),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: new RaisedButton(
                        child: new Text(
                          "Go Back",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.black54,
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return QuizList();
                          }));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
