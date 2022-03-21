import 'package:course_app/Widgets/circular.button.dart';
import 'package:course_app/common/app.constraints.dart';
import 'package:course_app/common/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Section1 extends StatelessWidget {
  List circularButtonData = [
    CircularButton(
        svg:
            SvgPicture.asset("assets/icons/nurse.svg", color: Colors.lightBlue),
        title: "Doctor",
        description: "Chanel Doctor",
        route: "/order/history"),
    CircularButton(
        svg: SvgPicture.asset("assets/icons/pill.svg", color: Colors.lightBlue),
        title: "Medicine",
        description: "Buy Medicine",
        route: "/order/history"),
    CircularButton(
        svg: SvgPicture.asset("assets/icons/microscope.svg",
            color: Colors.lightBlue),
        title: "Diagnostic",
        description: "Lab Reports",
        route: "/order/history"),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: AppConstraints.home_hero_height,
      child: Stack(
        children: [
          Container(
            height: AppConstraints.home_hero_curve_height,
            decoration: BoxDecoration(
                color: CustomColors.app_primary,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(36),
                    bottomLeft: Radius.circular(36))),
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lanka Health",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 19),
                ),
                Text(
                  "Sri Lanka",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: CustomColors.lightTextColor,
                      fontSize: 12),
                )
              ],
            ),
          )),
          Positioned(
            top: AppConstraints.home_hero_curve_height -
                AppConstraints.home_hero_button_radius / 2,
            width: screenSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButtonWidget(circularButton: circularButtonData[0]),
                CircularButtonWidget(circularButton: circularButtonData[1]),
                CircularButtonWidget(circularButton: circularButtonData[2])
              ],
            ),
          )
        ],
      ),
    );
  }
}
