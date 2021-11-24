// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:final_project/Screens/destination_screen.dart';
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListCard extends StatelessWidget {
  ListCard(
      {Key? key,
      required this.rating,
      required this.about,
      required this.imageUrl,
      required this.title,
      required this.subtitle})
      : super(key: key);

  String imageUrl;
  String title;
  String subtitle;
  String about;
  String rating;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DestinationPage(
              about: about,
              rating: rating,
              title: title,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            );
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
              height: size.height / 2.9, //size.height / 2.9
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
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: kBlackSmallText,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            subtitle,
                            style: kBlackVerySmallText,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                left: size.width / 2.3,
                bottom: size.height / 13,
                child: HeartIcon())
          ]),
        ));
  }
}

class HeartIcon extends StatefulWidget {
  const HeartIcon({Key? key}) : super(key: key);

  @override
  _HeartIconState createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  Color blackColor = Colors.black;
  bool oneTap = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            oneTap = !oneTap;

            // add function;
          });
        },
        icon: Icon(
          Icons.favorite_outline_rounded,
          color: oneTap == true ? Color(0xFFCE6730) : blackColor,
        ));
  }
}
