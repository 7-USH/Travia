// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

// ignore: unused_import
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';

class BookButton extends StatefulWidget {
  String text;
  BookButton({Key? key, required this.text})
      : super(key: key);

  @override
  State<BookButton> createState() => _BookButtonState();
}

class _BookButtonState extends State<BookButton> {
  Color buttonColor = const Color(0xFFCE6730);

  void testAlert(BuildContext context) {
    var alert = Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            color: Color(0xFFCE6730),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Text("Under Development !",
                  style: GoogleFonts.belgrano(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
        ));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Container(
          padding: EdgeInsets.only(bottom: 0),
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration:
              BoxDecoration(color: Colors.white.withOpacity(0.2), boxShadow: [
            BoxShadow(
                color: Colors.white,
                blurRadius: 40,
                spreadRadius: 5,
                offset: Offset(0, 10))
          ]),
        ),
        GestureDetector(
          onTap: () => testAlert(context),
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
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: const Offset(5, 5),
                    blurRadius: 4,
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}

void testAlert(BuildContext context) {
  var alert = Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: Color(0xFFCE6730),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text("Under Development !",
                style: GoogleFonts.belgrano(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
      ));

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
