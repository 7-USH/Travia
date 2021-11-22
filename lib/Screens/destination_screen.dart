// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:final_project/reusablewidgets/custom_clippath.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DestinationPage extends StatefulWidget {
  DestinationPage({Key? key,required this.child}) : super(key: key);

  static String id = 'destinationScreen';
  Widget child;

  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: CustomClipath(
        widget: widget.child,
      ),
    );
  }
}
