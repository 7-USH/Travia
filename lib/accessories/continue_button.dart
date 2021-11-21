import 'package:final_project/provider/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ContinueButton extends StatefulWidget {
  ContinueButton({Key? key, required this.onPressed}) : super(key: key);

  Function onPressed;

  @override
  _ContinueButtonState createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  Color buttonColor = const Color(0xFFCE6730);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () async {
           await widget.onPressed();
          Provider.of<Data>(context, listen: false).emailtextController.clear();
          Provider.of<Data>(context, listen: false).passtextController.clear();
        },
        onTapDown: (TapDownDetails details) {
          setState(() {
            buttonColor = Colors.orangeAccent.shade700;
          });
        },
        onTapUp: (TapUpDetails details) {
          setState(() {
            buttonColor = const Color(0xFFCE6730);
          });
        },
        child: Container(
          child: Row(
            children: [
              const SizedBox(
                width: 28,
              ),
              Text(
                "Continue",
                style: GoogleFonts.lobster(fontSize: 30, color: Colors.white),
              )
            ],
          ),
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(5, 5),
                  blurRadius: 4,
                ),
              ]),
        ),
      ),
    );
  }
}
