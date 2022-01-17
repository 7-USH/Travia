// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'package:final_project/accessories/favorite_card.dart';
import 'package:final_project/constants.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leadingWidth: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    //TODO: pop back;
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            title: Center(
                child: kAppLogo(context, kbackGroundColor, Colors.orange, 50))),
        body: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F7),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
              topRight: Radius.circular(40))
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height/30,
                    child: FittedBox(
                      child: Text(
                        "Your Favourite",
                        style: kBlackText,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Favourite_Card(),
                      Favourite_Card(),
                      Favourite_Card()
                    ],
                  )
                ],
              ),

            ),
          ),
        ));
  }
}
