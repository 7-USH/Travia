// ignore_for_file: camel_case_types

import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite_Card extends StatefulWidget {
  Favourite_Card({Key? key}) : super(key: key);

  String title = "Mumbai";
  String imageUrl = "https://wallpapercave.com/wp/wp3768670.jpg";
  String subtitle = "Mumbai";
  String rating = "5";

  @override
  _Favourite_CardState createState() => _Favourite_CardState();
}

class _Favourite_CardState extends State<Favourite_Card> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Material(
        child: Container(
          height: size.height / 5,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: kBoxShadows,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: size.height / 6,
                      width: size.height / 6,
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(
                  width: size.width / 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height / 30,
                        child: FittedBox(
                          child: Text(
                            widget.title,
                            style: kBlackSmallText,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 100,
                      ),
                      Text(
                        widget.subtitle,
                        style: kBlackVerySmallText,
                      ),
                      SizedBox(height: size.height/60,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ignore: prefer_const_constructors
                          Icon(
                            FontAwesomeIcons.star,
                            color: const Color(0xFFCE6730),
                            size: 25,
                          ),
                          SizedBox(width: size.width/40,),
                          Text(widget.rating,
                            style: GoogleFonts.belgrano(color: Colors.black, fontSize: 23, ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
