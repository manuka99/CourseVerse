import 'package:course_app/Widgets/course.box.dart';
import 'package:course_app/common/app.constraints.dart';
import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/models/course.dart';
import 'package:course_app/services/course_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingCourse extends StatefulWidget {

  @override
  _TrendingCoursesState createState() => _TrendingCoursesState();
}

class _TrendingCoursesState extends State<TrendingCourse> {
  late Iterable<Course> courses = [];

  @override
  void initState() {
    loadDoctors();
  }

  loadDoctors() async {
    courses = await CourseService.getDoctors();
    print(courses.length);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 10, 0.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending Courses",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: CustomColors.blackLight3TextColor,
                    fontSize: 14),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: CustomColors.iconSelected,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          height: 174,
          padding: EdgeInsets.only(left: 10),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (context, index) =>
                  CourseBox(course: courses.elementAt(index))),
        ),
      ],
    );
  }
}