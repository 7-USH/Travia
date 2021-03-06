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
    final size = MediaQuery.of(context).size;
    return Material(
      key: widget.key,
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Continue",
                  style: GoogleFonts.lobster(fontSize: 30, color: Colors.white),
                )
              ],
            ),
          ),
          height: size.height/15,
          width: size.width/2.7,
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
