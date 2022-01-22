// ignore_for_file: avoid_print, unnecessary_cast, await_only_futures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestorInfo extends ChangeNotifier {
  static var firestore = FirebaseFirestore.instance;
  static Map<String, dynamic> places = new Map();
  // ignore: prefer_typing_uninitialized_variables

  static void getAllPlaces() async {
    await for (var snapShots
        in firestore.collection('Destination').snapshots()) {
      for (var getData in snapShots.docs) {
        var data = await getData.data() as Map<String, dynamic>;
        places.addAll(data);
      }
    }
    print(places);
  }

  static search(String search) async {
    String firstLetter = search.substring(0, 1).toUpperCase();
    String afteLetter = search.substring(1).toLowerCase();
    String searchValue = firstLetter + afteLetter;

    var data = await firestore
        .collection('Destination')
        .where('title', isEqualTo: searchValue)
        .get();
    print(data);
  }

  static dataStream(String search) async {
    print("Value " + search);
    String firstLetter = search.substring(0, 1).toUpperCase();
    String afteLetter = search.substring(1).toLowerCase();
    String searchValue = firstLetter + afteLetter;

    await for (var snapShots
        in firestore.collection('Destination').snapshots()) {
      for (var getData in snapShots.docs) {
        if (getData['title'].toString() == searchValue) {
          print(getData.data() as Map<String, dynamic>);
          return getData.data() as Map<String, dynamic>;
        }
      }
      return null;
    }
  }
}
