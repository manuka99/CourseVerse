import 'package:course_app/common/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterMobile extends StatelessWidget {
  var mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void submitMobile() {
      var mobile = mobileNumberController.text.trim();
      if (mobile.startsWith("0")) mobile = mobile.replaceFirst("0", "");
      if (mobile.length == 9)
        Navigator.of(context).pushNamed("/register/mobile/otp", arguments: {
          'mobile': "+94${mobile}",
        });
      else{
        FocusScope.of(context).unfocus();
        final errorSnackBar = SnackBar(
          content: Text("Error: Please enter a valid mobile number"),
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
        ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
      }
    }

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
            Image.asset("assets/images/mobile_security.png"),
            SizedBox(height: 22),
            Container(
              width: 204,
              child: Text(
                "Enter your mobile number we will send you the OTP to verify later",
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
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              initialValue: "+ 94",
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabled: false,
                                  suffixText: "+94",
                                  fillColor: CustomColors.blackDark1TextColor),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            flex: 8,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              controller: mobileNumberController,
                              style: TextStyle(
                                  color: CustomColors.blackDark1TextColor),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: CustomColors.blackDark1TextColor),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          submitMobile();
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
          ],
        ),
      ),
    );
  }
}
