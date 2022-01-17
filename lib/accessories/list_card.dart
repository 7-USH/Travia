// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_field, unused_element, unused_local_variable, avoid_print, prefer_typing_uninitialized_variables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Screens/destination_screen.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/provider/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListCard extends StatefulWidget {
  ListCard(
      {Key? key,
      required this.latitude,
      required this.longitude,
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
  double latitude;
  double longitude;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  Color blackColor = Colors.black;
  bool oneTap = false;

  @override
  void initState() {
    super.initState();
    showHighLights();
    setState(() {
      
    });
  }

  void showHighLights() async {
    DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
        .instance
        .collection("Users")
        .doc(Provider.of<Data>(context, listen: false).getUserUid())
        .get();

    var data = userData.data();
    var array = data!['favs'];
    var item;
    for (item in array) {
      if (item['title'] == widget.title) {
        oneTap = true;
        setState(() {
          
        });
      } 
    }
  }

  Future _addData(String uid) async {
    DocumentReference docs =
        FirebaseFirestore.instance.collection("Users").doc(uid);

    DocumentSnapshot<Map<String, dynamic>> userData =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    var data = userData.data();
    data!['favs'].add({
      "image": widget.imageUrl,
      "title": widget.title,
      "subtitle": widget.subtitle,
    });
    return await docs.update(data);
  }

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DestinationPage(
                subtitle: widget.subtitle,
                latitude: widget.latitude,
                longitude: widget.longitude,
                about: widget.about,
                highlight: oneTap,
                rating: widget.rating,
                title: widget.title,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              );
            }));
          },
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
                            widget.imageUrl,
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
                            widget.title,
                            style: kBlackSmallText,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.subtitle,
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
                child: IconButton(
                    onPressed: () {
                      if (oneTap == false) {
                        _addData(
                          Provider.of<Data>(context, listen: false)
                              .getUserUid()!,
                        );
                      } else {
                        _deleteData(Provider.of<Data>(context, listen: false)
                            .getUserUid()!);
                      }
                      setState(() {
                        oneTap = !oneTap;
                      });
                    },
                    icon: Icon(
                      Icons.favorite_outline_rounded,
                      color: oneTap == true ? Color(0xFFCE6730) : blackColor,
                    )))
          ]),
        ));
  }
}
