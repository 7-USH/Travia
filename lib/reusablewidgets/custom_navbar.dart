// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:final_project/Screens/favourites_screen.dart';
import 'package:final_project/Screens/google_map.dart';
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  Color selectedBackgroundColor = Colors.white.withOpacity(0.2);
  Color simpleColor = Colors.black;
  Color effectColor = const Color(0xFFCE6730);
  var lat;
  var long;

  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    lat = position.latitude;
    long = position.longitude;
  }

  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    int index;
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildNewSingleNavbar(
                icon: Icons.home_outlined, label: 0, onTap: () {}),
            buildNewSingleNavbar(
                icon: Icons.favorite_outline,
                label: 1,
                onTap: () {
                  
                }),
            buildNewSingleNavbar(
                icon: Icons.travel_explore,
                label: 2,
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, GoogleScreen.id);
                  });
                }),
            buildNewSingleNavbar(
                icon: Icons.settings_outlined,
                label: 3,
                onTap: () {
                  // TODO : show settings
                }),
          ],
        ),
      ),
    );
  }

  Widget buildNewSingleNavbar(
      {required IconData icon, required int label, required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _selectedIndex = label;
        });
      },
      onTapUp: (TapUpDetails details) {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _selectedIndex = 0;
          });
        });
      },
      child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: label == _selectedIndex
                ? Colors.white
                : selectedBackgroundColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: label == _selectedIndex ? kBoxShadows : null,
          ),
          // ignore: prefer_const_constructors
          child: Icon(
            icon,
            size: 35,
            color: label == _selectedIndex ? effectColor : simpleColor,
          )),
    );
  }
}
