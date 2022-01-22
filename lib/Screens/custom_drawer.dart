// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCustomDrawer extends StatefulWidget {
  MyCustomDrawer({Key? key}) : super(key: key);

  @override
  _MyCustomDrawerState createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyCustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text("About Us",
            style: GoogleFonts.pacifico(color: kbackGroundColor, fontSize: 40)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: size.height / 1.28,
          width: size.width,
          decoration: BoxDecoration(
              color: kbackGroundColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: kBoxShadows),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(child: kAppLogo(context, Colors.white, Colors.white, 50)),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overview : ",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.belgrano(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    FittedBox(
                      fit: BoxFit.fitHeight,
                      child: SizedBox(
                        height: size.height / 4.3,
                        width: size.width,
                        child: Text(
                          """Travia is an app for Travellers.Being new to the place can be very tiring as we do not have any idea of the place around us. Thus Travia app will provide the location of the desired destination with the help of google maps and also user's current location. Getting details about the destination is feasible while using Travia App, also maintaing the authentication of the user is our prime task. This app covers some of the famous tourist places in India while providing the location of the selected place.""",
                          style: GoogleFonts.belgrano(
                              color: Colors.white, fontSize: 13),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Text("Features :",
                     style: GoogleFonts.belgrano(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("1. Popular Locations in India",
                       style: GoogleFonts.belgrano(
                            color: Colors.white, fontSize: 13),
                        textAlign: TextAlign.justify,
                      ),
                      Text("2. Google Map",
                       style: GoogleFonts.belgrano(
                            color: Colors.white, fontSize: 13),
                        textAlign: TextAlign.justify,
                      ),
                      Text("3. Getting user location",
                       style: GoogleFonts.belgrano(
                            color: Colors.white, fontSize: 13),
                        textAlign: TextAlign.justify,
                      ),
                      Text("4. Adding Destinations to Wishlist",
                       style: GoogleFonts.belgrano(
                            color: Colors.white, fontSize: 13),
                        textAlign: TextAlign.justify,
                      ),
                      Text("5. Description about different places",
                       style: GoogleFonts.belgrano(
                            color: Colors.white, fontSize: 13),
                        textAlign: TextAlign.justify,
                      )
                    ],),
                     SizedBox(
                      height: size.height / 50,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: size.width / 55,
                        ),
                        Text(
                          "Version : 1.0.0",
                          style: GoogleFonts.belgrano(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    Text("Connect with us :",
                        style: GoogleFonts.belgrano(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: size.height / 60,
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: size.width / 55,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              foregroundColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            launch("https://github.com/7-USH/Travia");
                          },
                          child: Text(
                            "Fork/Star us on GitHub",
                            style: GoogleFonts.belgrano(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: size.width / 55,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              foregroundColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            launch("mailto:tush1245@gmail.com");
                          },
                          child: Text(
                            "Contact us using gmail",
                            style: GoogleFonts.belgrano(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Spacer()
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
