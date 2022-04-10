import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../common/custom_colors.dart';
import 'admin_courses_list.dart';

class AdminCourseEdit extends StatefulWidget {
  DocumentSnapshot docid;
  AdminCourseEdit({required this.docid});

  @override
  _AdminCourseEditState createState() => _AdminCourseEditState();
}

class _AdminCourseEditState extends State<AdminCourseEdit> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.docid.get('cname'));
    content = TextEditingController(text: widget.docid.get('time'));
    super.initState();
  }

  void _showUpdateToastMsg() {
    Fluttertoast.showToast(
      msg: " Successfully updated",
      fontSize: 12,
    );
  }

   void _showDeleteToastMsg() {
    Fluttertoast.showToast(
      msg: " Successfully deleted",
      fontSize: 12,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.app_primary,
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'cname': title.text,
                'time': content.text,
              }).whenComplete(() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => AdminCourseList()));
              });
                _showUpdateToastMsg();
            },
            child: Text("Update",
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Color.fromRGBO(255, 255, 255, 1),
                    height: 1)),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => AdminCourseList()));
              });
             _showDeleteToastMsg();
            },
            child: Text("Delete",
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Color.fromRGBO(255, 255, 255, 1),
                    height: 1)),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: CustomColors.app_primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(160),
                      bottomRight: Radius.circular(240))),
              child: Center(
                child: Text("Update/ Delete",
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 255, 255, 1),
                        height: 1)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              // decoration:
              //     BoxDecoration(borderRadius: BorderRadius.circular(80)),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  labelText: 'Edit Course Name :',
                  hintText: ' Update Course Name ',
                  labelStyle: TextStyle(
                    color: CustomColors.blackDark1TextColor,
                    fontFamily: "Poppins",
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: TextField(
                  controller: content,
                  decoration: InputDecoration(
                    hintText: 'Update Course Time',
                    labelText: 'Edit Course Time :',
                    labelStyle: TextStyle(
                      color: CustomColors.blackDark1TextColor,
                      fontFamily: "Poppins",
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
                child: Stack(
              children: [
                Positioned(
                  bottom: -106,
                  right: -106,
                  child: Container(
                    height: 212,
                    width: 212,
                    decoration: BoxDecoration(
                        color: CustomColors.app_primary,
                        borderRadius: BorderRadius.circular(106)),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
