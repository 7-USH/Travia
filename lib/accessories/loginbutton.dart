// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: (){

        },
        child: Container(
          child: Row(
            children: [
              SizedBox(width: 10,),
              Icon(FontAwesome.google,color: Colors.white,),
              SizedBox(width: 8,),
              Text("SignIn Using Google",
              style: GoogleFonts.lobster(
                color: Colors.white,
                fontSize: 15
              )
              )
            ],
          ),
          height: 50,
          width: 180,
          decoration:
              BoxDecoration(color: const Color(0xFFCE6730), 
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: const Offset(5, 5),
              blurRadius: 4,
            ),
          ]),
        ),
      ),
    );
  }
}
