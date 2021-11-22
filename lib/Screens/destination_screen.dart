// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class DestinationPage extends StatefulWidget {
  DestinationPage({Key? key}) : super(key: key);

  static String id = 'destinationScreen';


  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("this is destination page")),
    );
  }
}
