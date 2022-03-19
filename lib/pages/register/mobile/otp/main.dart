import 'dart:convert';

import 'package:course_app/common/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';

class MobileOtp extends StatefulWidget {
  late String mobileNumber;

  MobileOtp(Object? arguments) {
    Map data = arguments as Map;
    this.mobileNumber = data["mobile"];
  }

  @override
  _MobileOtpState createState() => _MobileOtpState(this.mobileNumber);
}

class _MobileOtpState extends State<MobileOtp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final codeController = TextEditingController();
  SmsAutoFill smsAutoFill = SmsAutoFill();
  late String mobileNumber;
  late String verificationId;

  _MobileOtpState(this.mobileNumber);

  final codeSentSnackBar = SnackBar(
    content: const Text('Code was sent successfully'),
    duration: Duration(seconds: 4),
    backgroundColor: CustomColors.starGreen,
  );

  final verifiedSnackBar = SnackBar(
    content: const Text('Verification was completed'),
    duration: Duration(seconds: 2),
    backgroundColor: CustomColors.starGreen,
  );

  final errorSnackBar = (String? msg, BuildContext context) => SnackBar(
        content: Text("Error: ${msg}"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 8),
        action: SnackBarAction(
          label: 'X',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startPhoneAuth();
  }

  Future<void> listenForSMSCode() async {
    print("smsAutoFill.hint");
    print(smsAutoFill.hint);
    codeController.text = (await smsAutoFill.hint)!;
  }

  void startPhoneAuth() async {
    print('mobile');
    print(mobileNumber);
    // await listenForSMSCode();
    auth.verifyPhoneNumber(
      // phoneNumber: '+94721146092',
      phoneNumber: mobileNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print("verificationCompleted");
    ScaffoldMessenger.of(context).showSnackBar(verifiedSnackBar);
    String? code = credential.smsCode;
    codeController.text = code!;

    // Sign the user with the credential
    signInUserWithCredential(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print("error");
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context)
        .showSnackBar(errorSnackBar(error.message, context));
  }

  void onCodeSent(String verificationId, int? resendToken) {
    print("code sent");
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(codeSentSnackBar);
    this.verificationId = verificationId;
  }

  void onSubmitPin() {
    String code = codeController.text.trim().toString();
    int? iCode = int.tryParse(code);
    if (code.isNotEmpty && iCode != null && code.length == 6)
      buildPhoneAuthCredential(code);
    else {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context)
          .showSnackBar(errorSnackBar("Code must have 6 Digits", context));
    }
  }

  void buildPhoneAuthCredential(String smsCode) async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: smsCode);
    // Sign the user with the credential
    signInUserWithCredential(credential);
  }

  void signInUserWithCredential(AuthCredential credential) {
    auth
        .signInWithCredential(credential)
        .then((value) =>
            Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false))
        .onError((FirebaseAuthException error, stackTrace) {
      FocusScope.of(context).unfocus();
      return ScaffoldMessenger.of(context)
          .showSnackBar(errorSnackBar(error.message, context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: CustomColors.app_bg_scaffold,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: CustomColors.blackDark1TextColor,
              size: 28,
            )),
      ),
      body: Container(
        padding: EdgeInsets.all(20.00),
        child: Column(
          children: [
            Row(children: []),
            Text("Enter code",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: CustomColors.blackLightTextColor,
                )),
            SizedBox(height: 10),
            Wrap(
              children: [
                Icon(
                  Icons.star,
                  color: CustomColors.starGreen,
                  size: 22,
                ),
                Icon(
                  Icons.star,
                  color: CustomColors.starGreen,
                  size: 22,
                ),
                Icon(
                  Icons.star,
                  color: CustomColors.starGreen,
                  size: 22,
                ),
                Icon(
                  Icons.star,
                  color: CustomColors.starGreen,
                  size: 22,
                ),
                Icon(
                  Icons.star,
                  color: CustomColors.starGreen,
                  size: 22,
                ),
                Icon(
                  Icons.star,
                  color: CustomColors.starGreen,
                  size: 22,
                ),
              ],
            ),
            SizedBox(height: 22),
            Container(
              width: 260,
              child: Text(
                "We have sent you an SMS on " + mobileNumber + " with 6 digit verification code.",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  color: CustomColors.blackLight2TextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 52),
            Container(
              height: 200,
              width: 328,
              child: Card(
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PinCodeTextField(
                        controller: this.codeController,
                        appContext: context,
                        length: 6,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        textStyle:
                            TextStyle(color: CustomColors.blackDark1TextColor),
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 40,
                          fieldWidth: 40,
                          inactiveFillColor: Colors.transparent,
                          selectedFillColor: Colors.transparent,
                          activeFillColor: Colors.transparent,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        // errorAnimationController: errorController,
                        // controller: textEditingController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          onSubmitPin();
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith<
                                  RoundedRectangleBorder>(
                              (states) => RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          minimumSize: MaterialStateProperty.resolveWith<Size>(
                              (states) => Size(52, 44)),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.pressed))
                              return CustomColors.blackLightTextColor;
                            return CustomColors.app_primary;
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Did not receive the code?",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12,
                color: CustomColors.blackLight2TextColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Re-send",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        color: CustomColors.iconSelected,
                      ),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(width: 80),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Get a call now",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        color: CustomColors.iconSelected,
                      ),
                      textAlign: TextAlign.center,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
