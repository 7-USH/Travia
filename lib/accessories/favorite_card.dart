// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/provider/data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Favourite_Card extends StatefulWidget {
  Favourite_Card(
      {Key? key,
      this.title = "Mumbai",
      this.imageUrl = "https://wallpapercave.com/wp/wp3768670.jpg",
      this.subtitle = "Mumbai",
      this.rating = "5"})
      : super(key: key);

  String title;
  String imageUrl;
  String subtitle;
  String rating;

  @override
  _Favourite_CardState createState() => _Favourite_CardState();
}

class _Favourite_CardState extends State<Favourite_Card> {
  Color highlight = Colors.white;
  bool onTap = false;

  Future _deleteData(String uid) async {
    DocumentReference docs =
        FirebaseFirestore.instance.collection("Users").doc(uid);

    DocumentSnapshot<Map<String, dynamic>> userData =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    var data = userData.data();

    data!['favs'] = data['favs'].where((item) {
      return item['title'] != widget.title;
    }).toList();
    return await docs.update(data);
  }

  String getTitle() {
    return widget.title;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 5),
      child: Material(
        child: Container(
          height: size.height / 8,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: size.height / 9,
                          width: size.height / 9,
                          child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        )),
                        SizedBox(
                      width: size.width / 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height / 35,
                          child: FittedBox(
                            child: Text(
                              widget.title,
                              style: kBlackSmallText,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 150,
                        ),
                        Text(
                          widget.subtitle,
                          style: kBlackVerySmallText,
                        ),
                        SizedBox(
                          height: size.height / 160,
                        ),
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
                            SizedBox(
                              width: size.width / 40,
                            ),
                            Text(
                              widget.rating,
                              style: GoogleFonts.belgrano(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),               
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: onTap ? highlight : kbackGroundColor),
                    child: IconButton(
                        onPressed: () {
                          onTap = true;
                          _deleteData(Provider.of<Data>(context, listen: false)
                              .getUserUid()!);
                          setState(() {});
                        },
                        icon: Icon(Icons.remove)),
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
