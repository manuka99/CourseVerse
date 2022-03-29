import 'package:course_app/common/custom_colors.dart';
import 'package:flutter/material.dart';

PreferredSize buildAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(40.0),
    child: AppBar(
      elevation: 0,
      backgroundColor: CustomColors.app_primary
      // leading: IconButton(onPressed: () {}, icon: Icon(Icons.home)),
    ),
  );
}
