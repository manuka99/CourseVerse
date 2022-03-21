import 'package:course_app/pages/monitor/section1.dart';
import 'package:course_app/pages/monitor/section2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:course_app/pages/monitor/app_bar.dart';

class Monitor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: MonitorBody(),
    );
  }
}

class MonitorBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Section1(), //section 1 with title, country and icon buttons
        Section2(), //section 2 with vertical scroll bar and its content
      ],
    );
  }
}