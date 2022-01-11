import 'package:flutter/material.dart';
import'package:google_fonts/google_fonts.dart';
class Weatherpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('weather'),
        ),
        body: Container(
          child: Stack(
            children: [
              Image.asset('assets/night.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,)

            ],),),
    );
     
    throw UnimplementedError();
  }
  
}