// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
        color: Colors.transparent,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: kBoxShadows,
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            width: size.width/2.15,
            height: size.height/3,
            padding: EdgeInsets.only(top: 5, bottom: 50),
            child: ClipRRect(
              child: Card(
                child: Image.asset("assets/forest.jpg"),
              ),
            ),
          ),
        ]));
  }
}
