import 'package:course_app/common/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

@override
class _IntroScreenState extends State<IntroScreen> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  List<Slide> slides = [];

  void initState() {
    super.initState();
    slides.add(new Slide(
        pathImage: "assets/images/intro1.png",
        backgroundColor: Colors.white,
        widgetDescription: Column(
          children: [
            Text("Instructor Led Teaching",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: CustomColors.blackDark1TextColor)),
            SizedBox(
              height: 10,
            ),
            Text("All instructors are certified experts",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w200,
                    color: CustomColors.blackDark1TextColor)),
          ],
        )));
    slides.add(new Slide(
        pathImage: "assets/images/intro2.png",
        backgroundColor: Colors.white,
        widgetDescription: Column(
          children: [
            Text("Premium Online Courses",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: CustomColors.blackDark1TextColor)),
            SizedBox(
              height: 10,
            ),
            Text("All courses are updated regularly",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w200,
                    color: CustomColors.blackDark1TextColor)),
          ],
        )));
    slides.add(new Slide(
        pathImage: "assets/images/intro3.png",
        backgroundColor: Colors.white,
        widgetDescription: Column(
          children: [
            Text("Industry Recognized",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: CustomColors.blackDark1TextColor)),
            SizedBox(
              height: 10,
            ),
            Text("All certificates are highly recognized",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w200,
                    color: CustomColors.blackDark1TextColor)),
            SizedBox(
              height: 40,
            ),
            OutlinedButton(
                onPressed: () {
                  onDonePress();
                },
                child: Text("Get Started"),
                style: OutlinedButton.styleFrom(
                  textStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: CustomColors.blueTextColor),
                  minimumSize: Size(200, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  side: BorderSide(width: 1, color: CustomColors.blueTextColor),
                ))
          ],
        )));
  }

  void onDonePress() {
    User? user = _auth.currentUser;
    if(user != null)
      Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false);
    else
      Navigator.pushNamedAndRemoveUntil(context, "/register", (r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
        slides: this.slides,
        showDotIndicator: true,
        showNextBtn: false,
        onDonePress: this.onDonePress,
        showSkipBtn: false,
        showDoneBtn: false);
  }
}
