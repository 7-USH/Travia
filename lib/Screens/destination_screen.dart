// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, unnecessary_null_comparison

import 'package:final_project/Screens/colorloader.dart';
import 'package:final_project/Screens/flash_screen.dart';
import 'package:final_project/Screens/google_map.dart';
import 'package:final_project/Screens/loaderscreen.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/provider/data.dart';
import 'package:final_project/reusablewidgets/bookbutton.dart';
import 'package:final_project/services/location.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
// ignore: unused_import

// ignore: must_be_immutable
class DestinationPage extends StatefulWidget {
  DestinationPage(
      {Key? key,
      required this.latitude,
      required this.longitude,
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
  double latitude;
  double longitude;

  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  late double latitude = 0;
  late double longitude = 0;

  @override
  void initState() {
    super.initState();
    getLocation();
    setState(() {});
  }

  void getLocation() async {
    MyLocation location = MyLocation();
    await location.getCurrentLocation();
    latitude = await location.getLatitude();
    print(latitude);
    longitude = await location.getLongitude();
    print(longitude);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String rate = widget.rating;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: latitude == 0 ? Center() : BookButton(text: "BOOK"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: latitude == 0
          ? ColorLoader3()
          : ListView(
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
                                      color:
                                          Colors.transparent.withOpacity(0.3),
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
                                      color:
                                          Colors.transparent.withOpacity(0.3),
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
                                      setState(() {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return GoogleScreen(
                                            desLat: widget.latitude,
                                            desLon: widget.longitude,
                                            place: widget.title,
                                            souLat: latitude,
                                            souLon: longitude,
                                          );
                                        }));
                                      });
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
                                    FontAwesomeIcons.star,
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
