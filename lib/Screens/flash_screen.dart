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
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => this.nextPage),ModalRoute.withName(FlashScreen.id));
    });

    return Scaffold(
      backgroundColor: const Color(0xFFCE6730),
      body: Center(child: kAppLogo(context, Colors.white, Colors.white24, 50)),
    );
  }
}
