// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:final_project/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';


// ignore: use_key_in_widget_constructors, must_be_immutable
class OnBoardButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  OnBoardButton({required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap:(){
          Navigator.pushNamed(context, LoginScreen.id);
        },
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xFFCE6730).withOpacity(0.6),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFCE6730).withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(4, 4),
                ),
              ]),
          child: Center(
            child: Text(
              message,
              style: GoogleFonts.vidaloka(
                 fontSize: 24,
                   color: Colors.white,
                  ),
            ).shimmer(
              primaryColor: Colors.white,
              secondaryColor: Colors.white54,
              duration: Duration(seconds:5),
            ),
          ),
        ),
      ),
    );
  }
}
