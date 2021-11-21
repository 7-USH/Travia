// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable
import 'package:final_project/constants.dart';
import 'package:final_project/services/modalsheet.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatefulWidget {
  String text;
  LoginButton({Key? key, required this.text}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  Color buttonColor = Color(0xFFCE6730);

  @override
  Widget build(BuildContext context) {
   
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          UserInfoClass(userType: UserType.newUser).showHalfPage(context,"New User!");
        },
        onTapDown: (TapDownDetails details) {
          setState(() {
            buttonColor = Colors.orangeAccent.shade700;
          });
        },
        onTapUp: (TapUpDetails details) {
          setState(() {
            buttonColor = Color(0xFFCE6730);
          });
        },
        child: Container(
          child: Center(
            child: Text(
              widget.text,
              style: GoogleFonts.lobster(fontSize: 25, color: Colors.white),
            ),
          ),
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: const Offset(5, 5),
                  blurRadius: 4,
                ),
              ]),
        ),
      ),
    );
  }
}
