// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

final TextStyle kHeadingText = GoogleFonts.lobster(
  fontSize: 30,
  color: Colors.white,
);

final TextStyle kParagraphText = GoogleFonts.vidaloka(
  fontSize: 15,
  color: Colors.white,
);

final TextStyle kParagraphDarkText = GoogleFonts.vidaloka(
  fontSize: 20,
  color: Colors.grey.shade900,
);

final TextStyle kParagraphOrangeText = GoogleFonts.vidaloka(
  fontSize: 20,
  color: Color(0xFFCE6730),
);

final TextStyle kButtonText = GoogleFonts.vidaloka(
  fontSize: 20,
  color: Colors.black,
);

// ignore: non_constant_identifier_names
Widget kAppLogo(context, Color prime, Color second, double size) {
  final TextStyle kLogoText = GoogleFonts.pacifico(
    fontSize: size,
    decoration: TextDecoration.overline,
    decorationThickness: 0.0,
  );

  return Text(
    "Travia",
    style: kLogoText,
  ).shimmer(
    primaryColor: prime,
    secondaryColor: second.withOpacity(1),
    duration: const Duration(seconds: 3),
  );
}

final ThemeData kBackgroundTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFCE6730),
    primaryTextTheme: TextTheme(
        headline1: GoogleFonts.lobster(fontSize: 20, color: Colors.black)));

final Color primaryColor = Color(0xFFAA3C34);
final Color secondaryColor = Color(0xFF4B131E).withOpacity(0.5);

final Icon googleIcon = Icon(Icons.verified_user);

final TextStyle kMainScreenText = GoogleFonts.belgrano(
  color: Colors.black,
  fontSize: 15,
  fontWeight: FontWeight.w500
);


final TextStyle kMainScreenDarkText = GoogleFonts.belgrano(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 33,
);

final TextStyle kMainTextField = GoogleFonts.belgrano(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.bold
);
