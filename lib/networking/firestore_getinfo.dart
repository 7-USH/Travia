// ignore_for_file: avoid_print, unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestorInfo extends ChangeNotifier {
  static var firestore = FirebaseFirestore.instance;
  // ignore: prefer_typing_uninitialized_variables
  static dataStream(String search) async {
    String firstLetter = search.substring(0, 1).toUpperCase();
    String afteLetter = search.substring(1).toLowerCase();
    String searchValue = firstLetter + afteLetter;

    await for (var snapShots
        in firestore.collection('Destination').snapshots()) {
      for (var getData in snapShots.docs) {
        if (getData['title'].toString() == searchValue) {
          return getData.data() as Map<String, dynamic>;
        }
      }
      return null;
    }
  }
}
