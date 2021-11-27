// ignore_for_file: must_be_immutable, unnecessary_this

import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

class FlashScreen extends StatelessWidget {
  FlashScreen({Key? key, required this.nextPage, this.duration = 0})
      : super(key: key);
  static String id = "flashscreen";
  Widget nextPage;
  int duration;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.nextPage));
    });

    return Scaffold(
      body: Center(child: kAppLogo(context, Colors.white, Colors.white24, 50)),
    );
  }
}
