import 'package:course_app/common/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSection2BTN extends StatelessWidget {

  late IconData icon;
  late String title;
  late String route;

  ProfileSection2BTN({required this.icon, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (states) => EdgeInsets.all(24)),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              this.icon,
              color: CustomColors.icon2,
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                this.title,
                style: TextStyle(
                    color: CustomColors.blackLight2TextColor,
                    fontSize: 12,
                    fontFamily: "Poppins"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.arrow_forward_ios_rounded,
                color: CustomColors.blackLightTextColor, size: 14),
          ),
        ],
      ),
    );
  }
}
