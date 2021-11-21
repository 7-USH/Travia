// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:final_project/Screens/login_screen.dart';
import 'package:final_project/Screens/signin_screen.dart';
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class CustomButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomButton(this.message);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // ignore: avoid_pri
              Navigator.push(
                context,
                PageTransition(
                  child: SignInScreen(),
                  childCurrent: LoginScreen(),
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 800),
                  reverseDuration: const Duration(milliseconds: 800),
                ));
          
        },
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
           borderRadius: BorderRadius.all(Radius.circular(20)),
           boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(4, 4),
            ),
          ]),
          child: Center(
            child: Text(
              message,
              style: kButtonText,
            ),
          ),
        ),
      ),
    );
  }
}
