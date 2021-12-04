import 'package:final_project/provider/data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class MyLocation {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      // print(latitude);
    } catch (e) {
      print(e);
    }
  }

  Future<double> getLatitude() async {
    try {
      return latitude;
    } catch (e) {
      print(e);
    }
    return 0;
  }

   Future<double> getLongitude() async {
    try {
      return longitude;
    } catch (e) {
      print(e);
    }
    return 0;
  }
}
