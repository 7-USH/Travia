// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, list_remove_unrelated_type
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Screens/main_screen.dart';
import 'package:final_project/accessories/favorite_card.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/networking/firestore_getinfo.dart';
import 'package:final_project/provider/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({Key? key}) : super(key: key);
  static String id = "favouriteScreen";

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  Widget middleText(BuildContext context) {
    return Center(
      child: Text("Nothing to Show here"),
    );
  }

  Future _deleteData(String uid, String title, List<Widget> array,int index) async {
    
    DocumentReference docs =
        FirebaseFirestore.instance.collection("Users").doc(uid);

    DocumentSnapshot<Map<String, dynamic>> userData =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    var data = userData.data();
    print(title);

    data!['favs'] = data['favs'].where((item) {
      return item['title'] != title;
    }).toList();
    await docs.update(data);
    // array.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leadingWidth: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, MainScreen.id,
                          ModalRoute.withName(FavouriteScreen.id));
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                      size: 30,
                    )),
                SizedBox(
                  width: size.width / 6,
                ),
                kAppLogo(context, kbackGroundColor, Colors.orange, 50),
              ],
            )),
        body: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                color: Color(0xFFF7F7F7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height / 50,
                ),
                SizedBox(
                  height: size.height / 30,
                  child: FittedBox(
                    child: Text(
                      "Your Favourite's",
                      style: kBlackText,
                    ),
                  ),
                ),
                SizedBox(
                    height: size.height / 1.32,
                    child: StreamBuilder<DocumentSnapshot>(
                      stream: FirestorInfo.firestore
                          .collection('Users')
                          .doc(Provider.of<Data>(context, listen: false)
                              .getUserUid())
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                            ),
                          );
                        } else {
                          final data = snapshot.data!['favs'];
                          List<Favourite_Card> newItems = [];
                          for (var item in data) {
                            newItems.add(Favourite_Card(
                              imageUrl: item['image'],
                              subtitle: item['subtitle'],
                              title: item['title'],
                              rating: item['rating'],
                            ));
                          }

                          if (newItems.isEmpty) {
                            return middleText(context);
                          }

                          return ListView.builder(
                              itemCount: newItems.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  background: Container(
                                    height: 20,
                                    width: 20,
                                    color: kbackGroundColor,
                                  ),
                                  key: UniqueKey(),
                                  child: newItems[index],
                                  onDismissed: (direction) {
                                    _deleteData(
                                        Provider.of<Data>(context,
                                                listen: false)
                                            .getUserUid()!,
                                        newItems[index].title,
                                        newItems,
                                        index);                                   
                                  },
                                );
                              });
                        }
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
