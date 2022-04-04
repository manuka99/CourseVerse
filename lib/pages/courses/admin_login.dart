import 'package:course_app/pages/courses/admin_courses_list.dart';
import 'package:course_app/pages/courses/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:course_app/common/custom_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'admin_course_add.dart';
import 'admin_courses_list.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginWidgetState createState() => _AdminLoginWidgetState();
}

class _AdminLoginWidgetState extends State<AdminLogin> {
  void _showToastMsg() {
    Fluttertoast.showToast(
      msg: "Login Successfull",
      fontSize: 12,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          Container(
            height: 269,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: CustomColors.app_primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(160),
                    bottomRight: Radius.circular(240))),
            child: Center(
              child: Text("Welcome",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      height: 1)),
            ),
          ),

          new ListTile(
            contentPadding: EdgeInsets.fromLTRB(50, 20, 50, 0),
            title: new TextFormField(
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'User Name',
                  hintText: 'Enter user name',
                  labelStyle: TextStyle(
                    color: CustomColors.blackDark1TextColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w200,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                )),
          ),
          new ListTile(
            contentPadding: EdgeInsets.fromLTRB(50, 20, 50, 0),
            title: new TextFormField(
                autofocus: false,
                obscureText: true,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: ' ********* ',
                  labelStyle: TextStyle(
                    color: CustomColors.blackDark1TextColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w200,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                )),
          ),
          Positioned(
              top: 350,
              left: 55,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminCourseAdd(),
                      ),
                    );
                    _showToastMsg();
                  },
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(303, 50)),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(93, 95, 239, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ))),

          // new TextButton(
          //   style: ButtonStyle(
          //     foregroundColor:
          //         MaterialStateProperty.all<Color>(Colors.grey.shade700),
          //   ),
          //   onPressed: () {},
          //   child: Text('Forgot Password ?'),
          // ),
          // new TextButton(
          //   style: ButtonStyle(
          //     foregroundColor: MaterialStateProperty.all<Color>(Colors.pink),
          //   ),
          //   onPressed: () {},
          //   child: Text('Need a account? Sign up'),
          // ),
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
    );
  }
}
