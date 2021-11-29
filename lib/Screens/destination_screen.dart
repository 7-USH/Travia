// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:final_project/constants.dart';
import 'package:final_project/reusablewidgets/bookbutton.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:velocity_x/velocity_x.dart';
// ignore: unused_import

// ignore: must_be_immutable
class DestinationPage extends StatefulWidget {
  DestinationPage(
      {Key? key,
      required this.child,
      required this.about,
      required this.rating,
      required this.title})
      : super(key: key);

  static String id = 'destinationScreen';
  Widget child;
  String about;
  String rating;
  String title;

  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {

  @override
  Widget build(BuildContext context) {
    String rate = widget.rating;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: BookButton(text: "BOOK"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: ListView(
          padding: EdgeInsets.only(bottom: 100),
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    height: size.height / 1.8,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: kImageShadows,
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: widget.child),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 40, left: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.transparent.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 40, right: 30),
                        child: GestureDetector(
                          onTap: () {
                            //TODO:add to favourites button
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.transparent.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(
                              Icons.favorite_outline_outlined,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height / 2.04, left: size.width / 9),
                  // ignore: avoid_unnecessary_containers
                  child: Text(
                    widget.title,
                    style: kImageText,
                  ).shimmer(
                      primaryColor: Colors.white,
                      secondaryColor: Colors.grey,
                      duration: const Duration(seconds: 2)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height / 1.64, left: size.width / 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: size.height / 12,
                            width: size.width / 6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: kBoxShadows),
                            child: IconButton(
                              onPressed: () {
                                
                                // TODO : give location of current place
                              },
                              icon: Icon(Icons.place_sharp),
                              color: Color(0xFFCE6730),
                              iconSize: 40,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            """Get \nLocation""",
                            style: kBlackBoldSmallText,
                          )
                        ],
                      ),
                      SizedBox(
                        width: size.width / 12,
                      ),
                      Row(
                        children: [
                          Container(
                            height: size.height / 12,
                            width: size.width / 6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: kBoxShadows),
                            child: Icon(
                              FontAwesome5.star,
                              color: Color(0xFFCE6730),
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            """$rate\nRatings""",
                            style: kBlackBoldSmallText,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height / 1.4, left: size.width / 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Text(
                          "Description",
                          style: kMainScreenDarkText,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // ignore: sized_box_for_whitespace
                      Text(
                        widget.about,
                        style: kBlackSmallText,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
