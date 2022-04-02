import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:crudapp/addnote.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//import 'editnote.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AdminCourseList());
}

class AdminCourseList  extends StatefulWidget {
  @override
  _ListAdminCoursesPageState  createState() => _ListAdminCoursesPageState ();
}

class _ListAdminCoursesPageState  extends State<AdminCourseList > {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('courses').snapshots();

      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses List'),
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) =>
                    //         editnote(docid: snapshot.data!.docs[index]),
                    //   ),
                    // );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: 3,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['cname'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data!.docChanges[index].doc['time'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                           trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            //ref.child(snapshot.key!).remove();
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         // ignore: unnecessary_new
                            //         builder: (context) => new UpdateScreen(
                            //               value: snapshot.key!,
                            //             )));
                          },
                          icon: const Icon(
                            Icons.update,
                            color: Colors.green,
                          )),
                    ],
                  ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                                 
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}