// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:final_project/accessories/custom_button.dart';
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  static String id = "loginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: const Color(0xFFCE6730),
      body: Stack(
        children: [
          Image.asset(
            "assets/bg.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            colorBlendMode: BlendMode.darken,
          ),
 
          Positioned(
              top: size.height/7,
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width / 3.42, right: size.width / 5),
                child: kAppLogo(context, Colors.white, Colors.white12,50),
              )),
       
          // ignore: prefer_const_constructor
           Positioned(
              bottom: 50, left: size.width/3.7 , 
              child: const Hero(
                tag: 'button',
                child: CustomButton("Get Started"))),
        ],
      ),
    );
  }
}
