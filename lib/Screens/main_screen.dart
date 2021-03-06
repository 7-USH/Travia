// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:final_project/Screens/colorloader.dart';
import 'package:final_project/accessories/circular_background.dart';
import 'package:final_project/accessories/list_card.dart';
import 'package:final_project/accessories/logout_button.dart';
import 'package:final_project/accessories/text_field.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/networking/firestore_getinfo.dart';
import 'package:final_project/provider/data.dart';
import 'package:final_project/reusablewidgets/change_color_text.dart';
import 'package:final_project/reusablewidgets/custom_navbar.dart';
import 'package:final_project/reusablewidgets/tab_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// ignore: use_key_in_widget_constructors
class MainScreen extends StatefulWidget {
  static String id = 'mainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LocationPermission? permission;

  Future<void> _askPermission() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    Provider.of<Data>(context, listen: false)
        .setUserUid(_auth.currentUser?.uid);
  }


  @override
  void initState() {
    super.initState();
    _askPermission();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _auth.currentUser == null
        ? ColorLoader3()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: CircleBackground(
                              onPressed: () {},
                              widget: Icon(
                                Icons.person,
                                color: Color(0xFFCE6730),
                              ),
                              height1: 50,
                              height2: 40,
                              width1: 50,
                              width2: 40,
                            ),
                          ),
                          SizedBox(
                            width: size.width / 20,
                          ),
                          Text(
                            "Hello, There!",
                            style: kMainScreenText,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: LogOutBackground(
                          auth: _auth,
                          widget: Icon(
                            Icons.settings_outlined,
                            color: Color(0xFFCE6730),
                          ),
                          height1: 50,
                          height2: 40,
                          width1: 50,
                          width2: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: RichText(
                        text: TextSpan(
                          text: "What's next \non your",
                          style: kMainScreenDarkText,
                          children: const <TextSpan>[
                            TextSpan(
                                text: " wishlist",
                                style: TextStyle(color: Color(0xFFCE6730))),
                            TextSpan(
                              text: " ?",
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: size.height / 28,
                  ),
                  Center(child: MyTextField()),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  MyListView(size: size),
                  SizedBox(
                    height: size.height / 90,
                  ),
                  CustomNavBar()
                ],
              ),
            ),
          );
  }
}

class MyListView extends StatefulWidget {
  const MyListView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final itemController = ItemScrollController();

  int tappedIndex = 0;

  Future scrollToIndex(int index) async {
    itemController.scrollTo(
        index: index,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubic);
  }

  List<String> message = [
    "Most Viewed",
    "Popular",
    "Recommended",
    "Best in Nature"
  ];

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    return Column(
      children: [
        Container(
            height: 60,
            color: Colors.transparent,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return OnClickTextColorChange(
                      label: index,
                      tappedIndex: tappedIndex,
                      shouldColor: false,
                      message: message[index],
                      onTap: () {
                        int i = 0;
                        if (index == 0) {
                          scrollToIndex(0);
                          i++;
                        }
                        if (index == 1) {
                          scrollToIndex(4);
                          i++;
                        }
                        if (index == 2) {
                          scrollToIndex(6);
                          i++;
                        } else {
                          scrollToIndex(8);
                          i = 0;
                        }
                        setState(() {
                          tappedIndex = index;
                        });
                      });
                })),
        SizedBox(
          height: size.height / 50,
        ),
        Container(
          color: Colors.transparent,
          height: widget.size.height / 3 + 50,
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirestorInfo.firestore.collection('Destination').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  );
                } else {
                  List<Widget> widgets =
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return ListCard(
                      imageUrl: data['imageUrl'].toString(),
                      title: data['title'].toString(),
                      subtitle: data['subTitle'].toString(),
                      about: data['about'].toString(),
                      rating: data['rating'].toString(),
                      latitude: data['latitude'],
                      longitude: data['longitude'],
                    );
                  }).toList();

                  return ScrollablePositionedList.builder(
                    itemCount: widgets.length,
                    itemScrollController: itemController,
                    itemBuilder: (context, index) {
                      return widgets[index];
                    },
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                  );
                }
              }),
        ),
      ],
    );
  }
}
