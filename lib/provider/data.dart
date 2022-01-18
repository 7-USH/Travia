// ignore_for_file: constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  bool isChanged = false;
  final emailtextController = TextEditingController();
  final passtextController = TextEditingController();
  String? userUID;
  Map<String, dynamic> allLocations = {};

  setUserUid(String? uId) {
    userUID = uId;
    notifyListeners();
  }

  setAllLocations(Map<String, dynamic> map) {
    allLocations = map;
    notifyListeners();
  }

  Map getAllLocations() {
    return allLocations;
  }

  String? getUserUid() {
    return userUID;
  }

  double latitude = 0;
  double longitude = 0;

  getLatitudeLongitude(lat, long) {
    latitude = lat;
    longitude = long;
    notifyListeners();
  }

  show() {
    print(latitude);
    print(longitude);
    notifyListeners();
  }
}
