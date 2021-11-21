// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors
import 'package:final_project/accessories/animated_text.dart';
import 'package:final_project/accessories/loginbutton.dart';
import 'package:final_project/accessories/sigin_button.dart';
import 'package:final_project/accessories/wavewidget.dart';
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe


class SignInScreen extends StatefulWidget {
  static String id = 'signinScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          WaveWidget(Colors.white, size, size.height / 3),
          Positioned(
              top: size.height/7,
              child: Padding(
                padding: EdgeInsets.only(left: size.width/3.6,right: size.width/5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                        tag: 'logo',
                        child: kAppLogo(
                            context, Colors.white, Colors.white24, 50)),
                    SizedBox(
                      height: size.height / 7,
                    ),
                    myAnimeText(),
                    // ignore: prefer_const_constructo
                  ],
                ),
              )),
          // ignore:
          Positioned(
            bottom: size.height/3,
            child: Padding(
              padding: EdgeInsets.only(left:size.width/3.9),
              child: LoginButton(
                text: "Register",
              ),
            ),
          ),

          Positioned(
              bottom: size.height / 5,
              child: Padding(
                padding: EdgeInsets.only(left: size.width/3.9),
                child: Hero(
                  tag: 'button',
                  child: SignInButton(
                    text: "SignIn",
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
