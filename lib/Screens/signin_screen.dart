// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors
import 'package:final_project/accessories/animated_text.dart';
import 'package:final_project/accessories/loginbutton.dart';
import 'package:final_project/accessories/wavewidget.dart';
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';



class SignInScreen extends StatelessWidget {
  static String id = 'signinScreen';
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(height: double.infinity,
      child: Stack(
        children: [
          WaveWidget(Colors.white, size, size.height/3),
          Positioned(
            top:50,
            left: size.height/6.7,
            child: Column(
              children: [
                Hero(
                  tag: 'logo',
                  child: kAppLogo(context,Colors.white,Colors.white24,50)),
                  const SizedBox(
                    height: 180,
                  ),
                  myAnimeText(),
                  // ignore: prefer_const_constructo
                ], )),
            // ignore:
            Positioned(
              right: size.width/3,
              bottom: size.height/6,
              child: Hero(
                tag:'button',
                child: LoginButton())),      
               ],
      ),
    ));
  }
}



