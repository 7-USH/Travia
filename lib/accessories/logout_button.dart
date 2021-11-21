import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
          widget.auth.signOut();
          Navigator.pop(context);
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
