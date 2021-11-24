// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

final TextStyle kHeadingText = GoogleFonts.lobster(
  fontSize: 30,
  color: Colors.black,
);

final TextStyle kParagraphText = GoogleFonts.vidaloka(
  fontSize: 15,
  color: Colors.black,
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
    secondaryColor: second.withOpacity(0.5),
    duration: const Duration(seconds: 2),
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
    color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500);

final TextStyle kMainScreenDarkText = GoogleFonts.belgrano(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 33,
);

final TextStyle kMainTextField = GoogleFonts.belgrano(
    color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);

const Color kbackGroundColor = Color(0xFFCE6730);

enum buttonType {
  simpleText,
  passwordText,
}

final TextStyle welcomeText = GoogleFonts.pacifico(
  fontSize: 40,
  color: Colors.grey.shade700,
);

enum UserType {
  newUser,
  oldUser,
}

List<BoxShadow> kBoxShadows = [
  BoxShadow(
      color: Colors.black.withOpacity(0.19),
      offset: const Offset(0.5, 4),
      spreadRadius: 1,
      blurRadius: 8),
  BoxShadow(
      color: Colors.white.withOpacity(0.4),
      offset: const Offset(-3, -4),
      spreadRadius: -2,
      blurRadius: 20),
];

final TextStyle kBlackText = GoogleFonts.belgrano(
    color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);

final TextStyle kOrangeText = GoogleFonts.belgrano(
    color: Color(0xFFCE6730), fontSize: 20, fontWeight: FontWeight.w500);    

enum selectTab { popular, mostViewed, recommended, bestInNature }    

final TextStyle kBlackSmallText = GoogleFonts.belgrano(
    color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);

final TextStyle kBlackVerySmallText = GoogleFonts.belgrano(
    color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500);
