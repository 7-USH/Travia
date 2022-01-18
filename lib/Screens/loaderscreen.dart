import 'package:flutter/material.dart';

import '../constants.dart';

class LoaderScreen extends StatefulWidget {
  LoaderScreen({Key? key}) : super(key: key);

  @override
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFCE6730) ,
      body: Center(
        child: kAppLogo(context, Colors.white, Colors.white24, 50)
      ),
    );
  }
}