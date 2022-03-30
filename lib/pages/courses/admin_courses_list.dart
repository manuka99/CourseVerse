import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:CTSE/pages/update_student_page.dart';

class AdminCourseList extends StatefulWidget {
  AdminCourseList({Key? key}) : super(key: key);

  @override
  _ListAdminCoursesPageState createState() => _ListAdminCoursesPageState();
}

class _ListAdminCoursesPageState extends State<AdminCourseList> {
  final Stream<QuerySnapshot> coursesStream =
      FirebaseFirestore.instance.collection('courses').snapshots();

  // For Deleting User
  CollectionReference courses =
      FirebaseFirestore.instance.collection('courses');
  Future<void> deleteCourse(id) {
    // print("User Deleted $id");
    return courses
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: coursesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Container(
            height: 600,
            width: double.infinity,
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage("images/books.jpg"), fit: BoxFit.cover),
            // ),
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(90),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: Center(
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: Center(
                            child: Text(
                              'Courses  ',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: Center(
                            child: Text(
                              'Fee',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //    TableCell(
                      //   child: Container(
                      //     color: Colors.greenAccent,
                      //     child: Center(
                      //       child: Text(
                      //         'Time',
                      //         style: TextStyle(
                      //           fontSize: 14.0,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      TableCell(
                        child: Container(
                          color: Colors.greenAccent,
                          child: Center(
                            child: Text(
                              'Action',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var i = 0; i < storedocs.length; i++) ...[
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['cname'],
                                  style: TextStyle(fontSize: 12.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['courses'],
                                  style: TextStyle(fontSize: 12.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['fee'],
                                  style: TextStyle(fontSize: 12.0))),
                        ),
                        //   TableCell(
                        //   child: Center(
                        //       child: Text(storedocs[i]['time'],
                        //           style: TextStyle(fontSize: 12.0))),
                        // ),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () => {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => UpdateStudentPage(
                                  //         id: storedocs[i]['id']),
                                  //   ),
                                  // )
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                    {deleteCourse(storedocs[i]['id'])},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        });
  }
}