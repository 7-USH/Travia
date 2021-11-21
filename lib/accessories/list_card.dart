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
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: kBoxShadows,
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            width: size.width/1.9,
            height: size.height/2.9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: (){

                  // TODO: Function to new Page from image 

                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child:null,
                ),
              ),
            ),
          ),
        ]));
  }
}

