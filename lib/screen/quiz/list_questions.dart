import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import 'list_quiz.dart';
import '../../home.dart';
import 'package:app/screen/quiz/add_quiz.dart';

class QuizList extends StatefulWidget {
  @override
  _QuizListState createState() => new _QuizListState();
}

class _QuizListState extends State<QuizList> {
  Future<List> getData() async {
    final response = await http
        .get("http://localhost/course_verse/app/lib/backend/view_quiz.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "List Questions",
        ),
        backgroundColor: Color.fromARGB(255, 94, 21, 107),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          //SizedBox(height: 10,),
          FloatingActionButton.extended(
            heroTag: "add data",
            onPressed: () {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => new MyApp()));
            },
            label: const Text('Home'),
            icon: const Icon(Icons.home),
            backgroundColor: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          //SizedBox(height: 10,),
          FloatingActionButton.extended(
            heroTag: "add data",
            onPressed: () {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => new TopicQuiz()));
            },
            label: const Text('Add'),
            icon: const Icon(Icons.add),
            backgroundColor: Color.fromARGB(255, 94, 21, 107),
          ),
        ],
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data ?? [],
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(15.0),
          child: new GestureDetector(
            onTap: () =>
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) => new Detail(
                          list: list,
                          index: i,
                        ))),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['question'],
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: new Icon(
                  Icons.question_answer,
                  color: Color.fromARGB(255, 94, 21, 107),
                  size: 40,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
