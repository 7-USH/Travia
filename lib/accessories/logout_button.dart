// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:final_project/Screens/login_screen.dart';
import 'package:final_project/Screens/main_screen.dart';
import 'package:final_project/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LogOutBackground extends StatefulWidget {
  LogOutBackground({
    required this.auth,
    required this.widget,
    required this.height1,
    required this.height2,
    required this.width1,
    required this.width2,
    Key? key,
  }) : super(key: key);
  final double height1, height2;
  final double width1, width2;
  Widget widget;
  FirebaseAuth auth;

  @override
  State<LogOutBackground> createState() => _LogOutBackgroundState();
}

class _LogOutBackgroundState extends State<LogOutBackground> {
  Color color = Colors.white;
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: widget.height1,
        width: widget.width1,
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.02),
            borderRadius: const BorderRadius.all(Radius.circular(25))),
      ),
      GestureDetector(
        onTap: () {
          Scaffold.of(context).showBottomSheet((context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                      color: kbackGroundColor,
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        //TODO: logout
                        await storage.delete(key: "uid");
                        setState(() {});
                        Navigator.pushNamedAndRemoveUntil(context,
                            LoginScreen.id, ModalRoute.withName(MainScreen.id));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 12,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: kBoxShadows),
                        child: Center(
                          child: Text(
                            "Log Out",
                            style: kButtonText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        },
        onTapDown: (TapDownDetails details) {
          setState(() {
            color = Colors.grey.shade500;
          });
        },
        onTapUp: (TapUpDetails details) {
          setState(() {
            color = Colors.white;
          });
        },
        child: Container(
          height: widget.height2,
          width: widget.width2,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0.7, 4),
                    spreadRadius: 1,
                    blurRadius: 8),
                BoxShadow(
                    color: Colors.white.withOpacity(0.4),
                    offset: const Offset(-3, -4),
                    spreadRadius: -2,
                    blurRadius: 20),
              ],
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: Center(child: widget.widget),
        ),
      )
    ]);
  }
}
