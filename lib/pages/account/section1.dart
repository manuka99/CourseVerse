import 'package:course_app/common/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSection1 extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String name = "Manuka Yasas";
  String phone = "+92 0721146092";
  double profileState = 0.62;

  void initState() async {

  }

  @override
  Widget build(BuildContext context) {
    name = _auth.currentUser!.displayName.toString();
    if(name == "null")
      name = "user_" + _auth.currentUser!.uid;

    phone = _auth.currentUser!.email.toString();
    if(phone == "null")
      phone = _auth.currentUser!.phoneNumber.toString();

    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      height: 298,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CustomColors.app_primary,
        boxShadow: [
          BoxShadow(
            color: CustomColors.shadowColor,
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 4,
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        _auth.signOut();
                        Navigator.pushNamed(context, "/register");
                      },
                      icon: Icon(Icons.logout, size: 28),
                      color: Colors.white),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings, size: 28),
                      color: Colors.white)
                ],
              ),
              SizedBox(height: 64),
              Text(
                this.name,
                style: TextStyle(fontFamily: "Poppins", fontSize: 14),
              ),
              Text(
                this.phone,
                style: TextStyle(fontFamily: "Poppins", fontSize: 12),
              ),
              SizedBox(height: 20),
              Text(
                "${this.profileState * 100}%",
                style: TextStyle(fontFamily: "Poppins", fontSize: 12),
              ),
              Container(
                width: 272,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: LinearProgressIndicator(
                  value: this.profileState,
                  color: Colors.white,
                  minHeight: 10,
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.11),
                ),
              ),
              SizedBox(height: 12),
              OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith(
                      (states) => BorderSide(color: Colors.white)),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => (states.contains(MaterialState.pressed))
                          ? Colors.black12
                          : Colors.transparent),
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                      (states) => RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {},
                child: Text(
                  "Complete your profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Wrap(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/user-avatar2.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(width: 1, color: Colors.white)),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
