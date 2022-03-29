import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/models/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseBox extends StatelessWidget {

  late Course course;
  CourseBox({required this.course});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 166,
        width: 148,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: TextButton(
                onPressed: () {},
                child: Container(
                  height: 135,
                  width: 130,
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 4),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                          spreadRadius: 4,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 48,
                      ),
                      Text(
                        course.name,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: CustomColors.blackLight3TextColor,
                            fontSize: 10),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        course.specialization,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: CustomColors.blackLight3TextColor,
                            fontSize: 9),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.star,
                                color: Colors.amberAccent, size: 12)),
                        TextSpan(
                          text: " ${course.rating}",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              color: CustomColors.blackLight3TextColor,
                              fontSize: 9),
                        ),
                      ]))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(course.imageUrl),
                backgroundColor: Colors.transparent,
                radius: 59 / 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
