import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Image.asset("assets/logo.png"), height: 1000,),
      backgroundColor: Colors.amberAccent,
    );
  }
}
