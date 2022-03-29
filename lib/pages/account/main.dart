import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/pages/account/section1.dart';
import 'package:course_app/pages/account/section2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [ProfileSection1(), ProfileSection2()],
        ),
      ),
    );
  }
}
