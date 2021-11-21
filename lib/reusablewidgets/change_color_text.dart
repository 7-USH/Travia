import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class OnClickTextColorChange extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  OnClickTextColorChange(
      {Key? key,
      required this.tappedIndex,
      required this.label,
      required this.message,
      required this.onTap,
      required this.shouldColor})
      : super(key: key);
  Function onTap;
  String message;
  bool shouldColor;
  int label;
  int tappedIndex;

  @override
  _OnClickTextColorChangeState createState() => _OnClickTextColorChangeState();
}

class _OnClickTextColorChangeState extends State<OnClickTextColorChange> {
  Color transColor = Colors.transparent;
  TextStyle style = kBlackText;
  Color orangeColor = const Color(0xFFCE6730);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            child: Text(
              widget.message,
              style: widget.label==widget.tappedIndex ? kOrangeText : style,
            ),
            onPressed: () {
              widget.onTap();
            },
          ),
        ),
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            color: widget.label == widget.tappedIndex ? orangeColor : Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
        )
      ],
    );
  }
}
