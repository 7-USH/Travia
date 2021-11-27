// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields, unused_element, unused_local_variable, prefer_typing_uninitialized_variables, must_be_immutable, prefer_collection_literals, unused_field, avoid_function_literals_in_foreach_calls
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleScreen extends StatefulWidget {
  static String id = "googlemap";
  GoogleScreen({Key? key}) : super(key: key);

  @override
  _GoogleScreenState createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
  Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;
  
  String apiKey = "AIzaSyBky7ng4jQQPBk5OlH8EiMDURaxseThQw4";

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/smallmarker.png");
  }

  @override
  void initState() {
    super.initState();

    setCustomMarker();
    // setCustomMarker();
  }

  void _onMapCreation(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          icon: mapMarker,
          markerId: MarkerId('id-1'),
          position: LatLng(27.1751, 78.0421),
          infoWindow: InfoWindow(title: "Tushar", snippet: "Tushar")));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(27.1751, 78.0421) ,
      zoom: 15,
      tilt: 80,
      bearing: 30,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: size.height - 150,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: kBoxShadows),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GoogleMap(
                onMapCreated: _onMapCreation,
                markers: _markers,
                initialCameraPosition: initialCameraPosition,
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(40)),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            )),
      ]),
    );
  }
}
