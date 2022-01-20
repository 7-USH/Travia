import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/networking/firestore_getinfo.dart';

class SearchService {
  static var firestore = FirebaseFirestore.instance;
  static searchByName(String searchField) {
    return firestore.collection("Destination").where('title',
        isEqualTo: searchField).get();
  }
}
