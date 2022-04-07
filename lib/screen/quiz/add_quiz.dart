import 'package:app/screen/quiz/list_questions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopicQuiz extends StatefulWidget {
  const TopicQuiz({Key? key}) : super(key: key);

  @override
  _TopicQuizState createState() => _TopicQuizState();
}

class _TopicQuizState extends State<TopicQuiz> {
//controller to retrieve the value from the text field
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();

  void addQuestion() {
    var url = "http://localhost/course_verse/app/lib/backend/add_quiz.php";
    print(questionController.text);
    http.post(url, body: {
      "question": questionController.text,
      "option1": option1Controller.text,
      "option2": option2Controller.text,
      "option3": option3Controller.text,
      "option4": option4Controller.text,
    });
  }

  void error(BuildContext context, String error) {
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
        title: Text("Add Quiz"),
      ),
      body: Form(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: questionController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.question_mark),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 94, 21, 107),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Question',
                      hintStyle: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                      labelText: "Question",
                    ),
                    //validate text field
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Question Field is empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: option1Controller,
                    decoration: InputDecoration(
                      icon: Icon(Icons.info),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 94, 21, 107),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Option 1',
                      hintStyle: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                      labelText: "Option 1",
                    ),
                    //validate the text field
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Option 1 field is empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: option2Controller,
                    decoration: InputDecoration(
                      icon: Icon(Icons.info),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 94, 21, 107),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Option 2',
                      hintStyle: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                      labelText: "Option 2",
                    ),
                    //validate text field
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Option 2 field is empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: option3Controller,
                    decoration: InputDecoration(
                      icon: Icon(Icons.info),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 94, 21, 107),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Option 3',
                      hintStyle: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                      labelText: "Option 3",
                    ),
                    //validate text field
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Option 3 field is empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: option4Controller,
                    decoration: InputDecoration(
                      icon: Icon(Icons.info),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 94, 21, 107),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Option 4',
                      hintStyle: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                      labelText: "Option 4",
                    ),
                    //validate text field
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Option 4 field is empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (questionController.value.text.isEmpty) {
                            setState(() {
                              error(context, "Question is Empty");
                            });
                          } else if (option1Controller.value.text.isEmpty) {
                            setState(() {
                              error(context, "Option 1 is empty");
                            });
                          } else if (option2Controller.value.text.isEmpty) {
                            setState(() {
                              error(context, "Option 2 is empty");
                            });
                          } else if (option3Controller.value.text.isEmpty) {
                            setState(() {
                              error(context, "Option 3 is empty");
                            });
                          } else if (option4Controller.value.text.isEmpty) {
                            setState(() {
                              error(context, "Option 4 is empty");
                            });
                          } else {
                            addQuestion();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return QuizList();
                            }));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(
                              255, 94, 21, 107), // Background color
                        ),
                        child: const Text(
                          "Add Question",
                          style: TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return QuizList();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black54,
                        ),
                        child: const Text(
                          "Go  Back",
                          style: TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
