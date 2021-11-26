// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestorInfo extends ChangeNotifier {
  static var firestore = FirebaseFirestore.instance;
  // ignore: prefer_typing_uninitialized_variables
  static void dataStream() async {
    await for (var snapShots
        in firestore.collection('Destination').snapshots()) {
      for (var getData in snapShots.docs) {
        print(getData['title']);
      }
    }
  }
}
