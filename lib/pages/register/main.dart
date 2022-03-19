import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/common/icons.dart';
import 'package:course_app/pages/register/register_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterHome extends StatefulWidget {
  @override
  _RegisterHomeState createState() => _RegisterHomeState();
}

class _RegisterHomeState extends State<RegisterHome> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 269,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: CustomColors.app_primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(160),
                        bottomRight: Radius.circular(240))),
                child: Center(
                  child: Text("Lanka Health",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w800,
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 269 - 106,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RegisterButton(
                        icon: Icons.mobile_friendly_outlined,
                        title: "Mobile Number",
                        callback: handleMobileLoginCallback),
                    RegisterButton(
                        icon: Icons.facebook_rounded,
                        title: "Facebook",
                        callback: handleFBLoginCallback),
                    RegisterButton(
                        icon: CustomIcons.google,
                        title: "Google",
                        callback: handleGoogleLoginCallback),
                  ],
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

  void handleMobileLoginCallback() {
    Navigator.pushNamed(context, "/register/mobile");
  }

  void handleFBLoginCallback() async {
    FacebookLoginResult _result = await _facebookLogin.logIn(['email']);
    switch (_result.status) {
      case FacebookLoginStatus.cancelledByUser:
        print("fb login cancelled by user");
        break;
      case FacebookLoginStatus.error:
        print("fb login error");
        print(_result.errorMessage);
        break;
      case FacebookLoginStatus.loggedIn:
        loginWithFacebook(_result);
        print("fb login success");
        break;
    }
  }

  void handleGoogleLoginCallback() {
    Navigator.pushNamed(context, "/");
  }

  void loginWithFacebook(FacebookLoginResult _result) async {
    FacebookAccessToken _token = _result.accessToken;
    AuthCredential _credential = FacebookAuthProvider.credential(_token.token);
    var a = await _auth.signInWithCredential(_credential);
    //navigate
    Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false);
  }

  void logout() async {
    await _auth.signOut().then((value) => setState(() {
          _facebookLogin.logOut();
        }));
  }
}
