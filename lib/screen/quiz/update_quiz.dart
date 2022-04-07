import 'package:app/screen/quiz/add_quiz.dart';
import 'package:app/screen/quiz/list_questions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateQuiz extends StatefulWidget {
  final List list;
  final int index;

  UpdateQuiz({required this.list, required this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<UpdateQuiz> {
  late TextEditingController questionController;
  late TextEditingController option1Controller;
  late TextEditingController option2Controller;
  late TextEditingController option3Controller;
  late TextEditingController option4Controller;

  void editData() {
    var url = "http://localhost/course_verse/app/lib/backend/update_quiz.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "question": questionController.text,
      "option1": option1Controller.text,
      "option2": option2Controller.text,
      "option3": option3Controller.text,
      "option4": option4Controller.text
    });
  }

  @override
  void initState() {
    questionController =
        new TextEditingController(text: widget.list[widget.index]['question']);
    option1Controller =
        new TextEditingController(text: widget.list[widget.index]['option1']);
    option2Controller =
        new TextEditingController(text: widget.list[widget.index]['option2']);
    option3Controller =
        new TextEditingController(text: widget.list[widget.index]['option3']);
    option4Controller =
        new TextEditingController(text: widget.list[widget.index]['option4']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Edit Data",
          style: TextStyle(fontFamily: "Poppins"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: questionController,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                  ),
                  decoration: new InputDecoration(
                    hintText: "Question",
                    labelText: "Question",
                  ),
                ),
                new TextField(
                  controller: option1Controller,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                  ),
                  decoration: new InputDecoration(
                    hintText: "Option 1",
                    labelText: "Option 1",
                  ),
                ),
                new TextField(
                  controller: option2Controller,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                  ),
                  decoration: new InputDecoration(
                    hintText: "Option 2",
                    labelText: "Option 2",
                  ),
                ),
                new TextField(
                  controller: option3Controller,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                  ),
                  decoration: new InputDecoration(
                    hintText: "Option 3",
                    labelText: "Option 3",
                  ),
                ),
                new TextField(
                  controller: option3Controller,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                  ),
                  decoration: new InputDecoration(
                    hintText: "Option 4",
                    labelText: "Option 4",
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  margin: EdgeInsets.only(
                    top: 40,
                  ),
                  height: 40,
                  child: RaisedButton(
                    child: new Text(
                      "Update",
                      style:
                          TextStyle(fontFamily: "Poppins", color: Colors.white),
                    ),
                    color: Color.fromARGB(255, 102, 170, 233),
                    onPressed: () {
                      editData();
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                              builder: (BuildContext context) => QuizList()));
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  height: 40,
                  child: RaisedButton(
                    child: new Text(
                      "List",
                      style:
                          TextStyle(fontFamily: "Poppins", color: Colors.white),
                    ),
                    color: Colors.black,
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
    );
  }
}
