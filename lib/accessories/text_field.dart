// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, await_only_futures, unnecessary_null_comparison

import 'package:final_project/Screens/default_page.dart';
import 'package:final_project/Screens/destination_screen.dart';
import 'package:final_project/Screens/main_screen.dart';
import 'package:final_project/Screens/searchfield.dart';
import 'package:final_project/accessories/circular_background.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/networking/firestore_getinfo.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  MyTextField({Key? key}) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String getPlace(String value) {
    setState(() {});
    return value;
  }

  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String search = "";

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
        height: size.height / 16,
        child: TextFormField(
          onChanged: (value) async {
            if (value == "") {
              search = "Tushar";
            } else {
              search = await value;
            }
          },
          controller: textController,
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
            onPressed: () async {
              var data = await FirestorInfo.dataStream(search);
              textController.clear();
              search = "";
              if (data != null) {
                await Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DestinationPage(
                    subtitle: data['subTitle'].toString(),
                    latitude: data['latitude'],
                    longitude: data['longitude'],
                    about: data['about'].toString(),
                    rating: data['rating'].toString(),
                    title: data['title'].toString(),
                    child: Image.network(
                      data['imageUrl'].toString(),
                      fit: BoxFit.cover,
                    ),
                  );
                }));
              } else {
                Navigator.pushNamed(context, DefaultPage.id);
              }
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
