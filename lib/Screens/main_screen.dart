// ignore_for_file: prefer_const_constructors
import 'package:final_project/accessories/circular_background.dart';
import 'package:final_project/accessories/list_card.dart';
import 'package:final_project/accessories/logout_button.dart';
import 'package:final_project/accessories/text_field.dart';
import 'package:final_project/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MainScreen extends StatefulWidget {
  static String id = 'mainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CircleBackground(
                        onPressed: () {},
                        widget: Icon(
                          Icons.person,
                          color: Color(0xFFCE6730),
                        ),
                        height1: 50,
                        height2: 40,
                        width1: 50,
                        width2: 40,
                      ),
                    ),
                    SizedBox(
                      width: size.width / 20,
                    ),
                    Text(
                      "Hello, There!",
                      style: kMainScreenText,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: LogOutBackground(
                    auth: _auth,
                    widget: Icon(
                      Icons.settings_outlined,
                      color: Color(0xFFCE6730),
                    ),
                    height1: 50,
                    height2: 40,
                    width1: 50,
                    width2: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: RichText(
                  text: TextSpan(
                    text: "What's next \non your",
                    style: kMainScreenDarkText,
                    children: const <TextSpan>[
                      TextSpan(
                          text: " wishlist",
                          style: TextStyle(color: Color(0xFFCE6730))),
                      TextSpan(
                        text: " ?",
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            Center(child: MyTextField()),
            SizedBox(
              height: 150,
            ),
            ListCard(),
          ],
        ),
      ),
    );
  }
}


