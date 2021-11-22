// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({Key? key}) : super(key: key);
  static String id = "favouriteScreen";

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text("this is Favourite Screen"),
        ),
      ),
    );
  }
}
