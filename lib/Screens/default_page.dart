// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({Key? key}) : super(key: key);

  static String id = "defualt page";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Image.asset("assets/sorry.jpg"),
          Text("Oops! Page not Found",style: kBlackBoldSmallText,)
        ],),
      ),
    );
  }
}
