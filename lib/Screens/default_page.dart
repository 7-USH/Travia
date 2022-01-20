// ignore_for_file: avoid_unnecessary_containers

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
        child: Column(children: [
          Container(
            height:size.height/1.2,
            width: size.width/1.2,
            child: Image.asset("assets/sorry.jpg"),
          ),
          Text("Ops Page not Found",style: kBlackBoldSmallText,)
        ],),
      ),
    );
  }
}
