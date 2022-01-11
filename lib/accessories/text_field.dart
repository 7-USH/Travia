// ignore_for_file: prefer_const_constructors
import 'package:final_project/accessories/circular_background.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/services/dataservices.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  // ignore: non_constant_identifier_names
  String tush="";
  

  String getPlace(String value) {
    setState(() {
      // ignore: avoid_print
      print(value);
    });
    return value;
  }
  final _citycontrol=TextEditingController();
  final _dataService=dataservice();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: [
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
            ]),
        width: size.width / 1.16,
        height: 50,
        child: TextField(
          //controller: _citycontrol,
          onChanged: (String value) {
            tush=getPlace(value);
          },
          cursorColor: Colors.grey.shade700,
          style: kMainTextField,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: "Search For Places...",
            contentPadding: const EdgeInsets.only(left: 30),
          ),
        ),
      ),
      Positioned(
          left: size.width / 1.36,
          child: CircleBackground(
            onPressed: (){
              print("gvgvgvvg");
              _dataService.getWeather(_citycontrol.text);
              // TODO: search and sort places

            },
            widget: Icon(Icons.search),
            height1: 50,
            height2: 40,
            width1: 50,
            width2: 40,
          ))
    ]);
    
  }


}
