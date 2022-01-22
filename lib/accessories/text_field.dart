// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, await_only_futures, unnecessary_null_comparison, prefer_collection_literals

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Screens/default_page.dart';
import 'package:final_project/Screens/destination_screen.dart';
import 'package:final_project/Screens/main_screen.dart';
import 'package:final_project/Screens/searchfield.dart';
import 'package:final_project/accessories/circular_background.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/networking/firestore_getinfo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  MyTextField({Key? key}) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  List places = [];
  var firestore = FirebaseFirestore.instance;

  String getPlace(String value) {
    setState(() {});
    return value;
  }

  void getAllPlaces() async {
    final CollectionReference collectionReference =
        await firestore.collection('Destination');
    await collectionReference.get().then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        places.add(element.data());
      }
    });
    setState(() {});
    print(places);
  }

  search(String search) async {
    print("Value" + search);
    String firstLetter = search.substring(0, 1).toUpperCase();
    String afteLetter = search.substring(1).toLowerCase();
    String searchValue = firstLetter + afteLetter;

    for (var data in places) {
      if (data['title'] == searchValue) {
        return data;
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    getAllPlaces();
  }

  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String searchKey = "";

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
          onChanged: (value) {
            if (value == "") {
              searchKey = "Tushar";
            } else {
              searchKey = value;
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
              var data = await search(textController.text);
              textController.clear();
              searchKey = "";
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
