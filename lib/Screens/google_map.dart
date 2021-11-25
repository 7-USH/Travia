//flutter run --no-sound-null-safetyflutter run --no-sound-null-safety
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleScreen extends StatefulWidget {
  static String id="google screen";
  const GoogleScreen({ Key? key }) : super(key: key);

  @override
  _GoogleScreenState createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
  Set<Marker> _markers={};
  void _onMapCreated(GoogleMapController controller)
  {
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId("id -1"),position:LatLng(27.1751,78.0421),
        infoWindow: InfoWindow(
          title: "Taj Mahal",
          snippet: " Seven monuments of world",
        ),
         ),
      );
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(target: LatLng(27.1751,78.0421),
  
        zoom: 15,


        ),
      ),
      
    );
  }
}