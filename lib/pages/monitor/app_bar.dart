import 'package:flutter/material.dart';

PreferredSize buildAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(40.0),
    child: AppBar(
      elevation: 0,
      // leading: IconButton(onPressed: () {}, icon: Icon(Icons.home)),
    ),
  );
}
