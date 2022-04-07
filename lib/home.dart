import 'package:app/screen/quiz_app/main_quiz.dart';
import 'package:flutter/material.dart';
import './screen/quiz/list_quiz.dart';
import './screen/quiz/list_questions.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key, required String title}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 250,
          margin: const EdgeInsets.only(top: 40.0, bottom: 30.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1633613286848-e6f43bbafb8d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
              opacity: 0.7,
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.white,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(104, 255, 255, 255),
                blurRadius: 20.0,
                spreadRadius: 20.0,
              )
            ],
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Center(
            child: RaisedButton.icon(
              icon: Icon(
                Icons.arrow_right,
              ),
              elevation: 30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Color.fromARGB(255, 226, 148, 174))),
              label: Text("View Quiz"),
              color: Colors.black,
              textColor: Colors.white,
              padding: EdgeInsets.all(15.0),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return MainQuiz();
                }));
              },
            ),
          ),
        ),
        Container(
          width: 500,
          height: 250,
          margin: const EdgeInsets.only(top: 10.0, bottom: 40.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1636633762833-5d1658f1e29b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=739&q=80"),
              opacity: 0.9,
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.white,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(104, 255, 255, 255),
                blurRadius: 20.0,
                spreadRadius: 20.0,
              )
            ],
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Center(
            child: RaisedButton.icon(
              icon: Icon(
                Icons.arrow_right,
              ),
              elevation: 30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Color.fromARGB(255, 189, 158, 230))),
              label: Text("Add Questions"),
              color: Colors.black,
              textColor: Colors.white,
              padding: EdgeInsets.all(15.0),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return QuizList();
                }));
              },
            ),
          ),
        ),
      ],
    );
  }
}
