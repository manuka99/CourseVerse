import 'package:course_app/common/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      child: Row(
        children: [
          SizedBox(width: 28),
          Container(
            height: 46,
            width: 46,
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assets/images/support-user.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(34),
                border: Border.all(color: Colors.white, width: 2)),
            child: Stack(
              children: [
                new Align(
                    alignment: Alignment.bottomRight,
                    child: new Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          color: Colors.lightGreenAccent,
                          shape: BoxShape.circle),
                      alignment: Alignment.center,
                    ))
              ],
            ),
          ),
          SizedBox(width: 14),
          Text("Support Team",
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600))
        ],
      ),
      decoration: BoxDecoration(
          color: CustomColors.app_primary,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(28),
              bottomLeft: Radius.circular(28))),
    );
  }
}
