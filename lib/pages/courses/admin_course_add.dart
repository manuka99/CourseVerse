import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/common/custom_colors.dart';
import 'package:flutter/material.dart';
import 'admin_courses_list.dart';

class AdminCourseAdd extends StatefulWidget {
  AdminCourseAdd({Key? key}) : super(key: key);

  @override
  _AdminCourseAddState createState() => _AdminCourseAddState();
}

class _AdminCourseAddState extends State<AdminCourseAdd> {
  final _formKey = GlobalKey<FormState>();
  final double _headerHeight = 250;

  var cname = "";
  var courses = "";
  var fee = "";
  var time = "";
  bool checkedValue = false;
  bool checkboxValue = false;
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final cnameController = TextEditingController();
  final coursesController = TextEditingController();
  final feeController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    cnameController.dispose();
    coursesController.dispose();
    feeController.dispose();
    timeController.dispose();
    super.dispose();
  }

  clearText() {
    cnameController.clear();
    coursesController.clear();
    feeController.clear();
    timeController.clear();
  }

  // Adding Student
  CollectionReference students =
      FirebaseFirestore.instance.collection('courses');

  Future<void> addUser() {
    return students
        .add({'cname': cname, 'courses': courses, 'fee': fee, 'time': time})
        .then((value) => print('Course Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  void showAlertDialog(BuildContext context) => showDialog(context: context,
    builder: (BuildContext context) { 
    return  AlertDialog(
     title: const Text('Success'),
     content: const Text('New course successfully added'),
     // ignore: deprecated_member_use
     actions: [OutlineButton(onPressed: () => Navigator.of(context).pop(),child: const Text('Close'))]);
     },
   );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Courses"),
        backgroundColor: CustomColors.app_primary,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: _headerHeight,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                              controller: cnameController,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelText: 'Course Name',
                                hintText: 'Enter course name',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Course Name';
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        Container(
                          child: TextFormField(
                              controller: coursesController,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelText: 'Number of courses',
                                hintText: 'Enter number of courses',
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Number Of Courses';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                              controller: feeController,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelText: 'Course Fee',
                                hintText: 'Enter course fee',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Course Fee';
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                              controller: timeController,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelText: 'Full Course Time',
                                hintText: 'Enter full course time',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Full Course Time';
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(303, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(93, 95, 239, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                            child: Text(
                              'Add Course',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AdminCourseList()),
                                    (Route<dynamic> route) => false);
                                setState(() {
                                  cname = cnameController.text;
                                  courses = coursesController.text;
                                  fee = feeController.text;
                                  time = timeController.text;
                                  addUser();
                                   showAlertDialog(context);
                                  clearText();
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
