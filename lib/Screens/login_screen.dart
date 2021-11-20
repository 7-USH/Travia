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
      body: Stack(
        children: [
          Image.asset(
            "assets/art.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),

          Positioned(
              top: 100,
              left: size.height/6.7,
              child: Hero(
                  tag: 'logo',
                  child: kAppLogo(context, primaryColor, secondaryColor, 50))),
          // ignore: prefer_const_constructors
          Positioned(
            left: 20,
            bottom: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover,\nworld with us.",
                  style: kHeadingText,
                ),
                Text(
                  """Even the most foreign country or 
faraway places aren’t light years 
away.The journey may appear long 
and intimidating,but when you 
take one step at a time, it’s 
manageable.""",
                  style: kParagraphText,
                ),
              ],
            ),
          ),
           Positioned(
              bottom: 50, left: size.height / 3.8, 
              child: const Hero(
                tag: 'button',
                child: CustomButton("Get Started")))
        ],
      ),
    );
  }
}
