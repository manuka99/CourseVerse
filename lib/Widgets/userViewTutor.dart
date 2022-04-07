import 'package:course_app/Widgets/TutorDetails.dart';
import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/services/database.dart';
import 'package:flutter/material.dart';

class userViewTutor extends StatefulWidget {
  userViewTutor({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _userViewTutor createState() => _userViewTutor();
}

class _userViewTutor extends State<userViewTutor> {
  late Database db;
  List docs = [];
  initialise() {
    db = Database();
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.dBlue,
        title: const Text("Tutors"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              elevation: 20,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TutorDetailsView(
                              Tutors: docs[index], db: db))).then((value) => {
                        if (value != null) {initialise()}
                      });
                },
                contentPadding: const EdgeInsets.only(
                    right: 30, left: 36, top: 10, bottom: 10),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/img1.jpg"),
                ),
                title: Text(docs[index]['name']),
                subtitle: Text(docs[index]['education']),
                trailing: const Icon(Icons.workspace_premium_rounded),
                iconColor: Colors.greenAccent,
              ));
        },
      ),
    );
  }
}
