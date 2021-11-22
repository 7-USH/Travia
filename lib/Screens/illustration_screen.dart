// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:final_project/Screens/login_screen.dart';
import 'package:final_project/accessories/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';

class ConcentricTransistion extends StatefulWidget {
  static String id = "concentricTransistion";
  ConcentricTransistion({Key? key}) : super(key: key);

  @override
  _ConcentricTransistionState createState() => _ConcentricTransistionState();
}

class _ConcentricTransistionState extends State<ConcentricTransistion> {
  List<dynamic> pages = [
    {
      'image':
          'https://ouch-cdn2.icons8.com/-kIsOFl-X2Z9Z_3QoZzShn42inOadDvCboLGIPaW7g4/rs:fit:196:157/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMzEv/ZDE1YjIwOTMtYWEw/Ni00MzI1LWFkZTgt/ZWIxYmM0YjU3ZTg1/LnN2Zw.png',
    },
    {
      'image':
          'https://ouch-cdn2.icons8.com/E7yHR4iXpIsluuKIxqcyBENUGxNrBmfcp-kFRt0yWrI/rs:fit:196:147/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMjY1/L2VhZGM5ZGYyLWI2/OGUtNDkyZi05NmQ1/LTVhZmIzYTQ1OTBh/OS5wbmc.png'
    },
    {
      'image':
          'https://ouch-cdn2.icons8.com/z0fjtrvD_Wui5a4epLMUUwgAYS1wwo_XVpyZzDKZ_O8/rs:fit:196:196/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNDIv/ZWY2MDg3NWUtYWI2/MS00ZGI5LTgzNmEt/MzY2OGJiNjlkYjY2/LnN2Zw.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        onFinish: () {
          Navigator.pushNamed(context, LoginScreen.id);
        },
        radius: 30,
        verticalPosition: 0.85,
        colors: [const Color(0xFFCE6730), Colors.white, const Color(0xFFCE6730).withOpacity(0.3)],
        itemBuilder: (index, value) {
          int pageIndex = (index % pages.length);
          // ignore: avoid_unnecessary_containers
          return Container(
            child: Center(
              child: Stack(
                children: [
                  Image.network(
                    pages[pageIndex]['image'],
                    width: 300,
                  ),
                ],
              ),
              
            ),
          );
        },
      ),
    );
  }
}
