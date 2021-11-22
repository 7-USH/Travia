// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:final_project/Screens/destination_screen.dart';
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () =>   Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DestinationPage(child: Container(
                    color: Colors.red,
                    height: 400,
                    width: double.infinity,
                    child: Image.asset("assets/taj.jpg",
                    fit: BoxFit.cover,
                    ),
                    ),);
                  })),
          child: Stack(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: kBoxShadows,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              width: size.width / 1.9,
              height: size.height / 2.9,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/taj.jpg",
                        fit: BoxFit.cover,
                        ) ,
                      )),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Taj Mahal",
                            style: kBlackSmallText,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text("Agra",
                            style: kBlackVerySmallText,)
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
