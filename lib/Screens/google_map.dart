// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields, unused_element, unused_local_variable, prefer_typing_uninitialized_variables, must_be_immutable, prefer_collection_literals, unused_field, avoid_function_literals_in_foreach_calls, avoid_print, unnecessary_string_interpolations
import 'dart:async';

import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const double pinInvisible = -200;
const double pinVisible = 20;

class GoogleScreen extends StatefulWidget {
  double desLat;
  double desLon;
  double souLat;
  double souLon;
  String place;

  static String id = "googlemap";
  GoogleScreen(
      {Key? key,
      required this.place,
     this.souLat=0.0,
     this.souLon=0.0,
      required this.desLat,
      required this.desLon})
      : super(key: key);

  @override
  _GoogleScreenState createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
  Set<Marker> _markers = Set<Marker>();
  late BitmapDescriptor sourceMarker;
  late BitmapDescriptor destinationMarker;
  Completer<GoogleMapController> _controller = Completer();

  String apiKey = "AIzaSyBky7ng4jQQPBk5OlH8EiMDURaxseThQw4";

  void setCustomMarker() async {
    sourceMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), "assets/smallmarker.png");
    destinationMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), "assets/greenmarker.png");
  }

  bool isTap = true;
  bool mapTap = false;
  bool pillTap = false;

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polyLineCoordinates = [];
  late PolylinePoints polylinePoints;

  @override
  void initState() {
    super.initState();
    polylinePoints = PolylinePoints();
    setCustomMarker();
    print(widget.souLat);
    print(widget.souLon);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(widget.souLat, widget.souLon),
      zoom: 15,
      tilt: 80,
      bearing: 30,
    );

    String place = widget.place;

    return Scaffold(
      body: Stack(alignment: AlignmentDirectional.topCenter, children: [
        GoogleMap(
          polylines: _polylines,
          mapType: MapType.normal,
          compassEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            showPinsOnMap();
            setPolyLines();
          },
          onTap: (LatLng loc) {
            setState(() {
              mapTap = false;
            });
          },
          markers: _markers,
          initialCameraPosition: initialCameraPosition,
        ),
        SafeArea(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 70,
            width: size.width / 1.2,
            decoration: BoxDecoration(
                color: isTap
                    ? Colors.white.withOpacity(0.7)
                    : kbackGroundColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(50),
                boxShadow: kBoxShadows),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  size: 45,
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  "My Location",
                  style: kBlackText,
                ),
                Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.circle),
                  child: Image.asset(
                    "assets/smallmarker.png",
                    height: 30,
                  ),
                )
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          bottom: mapTap ? pinVisible : pinInvisible,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 70,
            width: size.width / 1.2,
            decoration: BoxDecoration(
                color: pillTap
                    ? Colors.green.withOpacity(0.7)
                    : Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(50),
                boxShadow: kBoxShadows),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.travel_explore,
                  size: 45,
                ),
                Text(
                  place,
                  style: kBlackText,
                ),
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Image.asset(
                    "assets/greenmarker.png",
                    height: 30,
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId("source-1"),
          position: LatLng(widget.souLat, widget.souLon),
          icon: sourceMarker,
          onTap: () {
            isTap = !isTap;
            setState(() {});
          }));

      _markers.add(Marker(
          markerId: MarkerId("destination-1"),
          position: LatLng(widget.desLat, widget.desLon),
          icon: destinationMarker,
          onTap: () {
            setState(() {
              mapTap = true;
              pillTap = true;
              isTap = true;
            });
          }));
    });
  }

  void setPolyLines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        apiKey,
        PointLatLng(widget.souLat, widget.souLon),
        PointLatLng(widget.desLat, widget.desLon));
    print(result.status);
    if (result.status == "OK") {
      result.points.forEach((PointLatLng point) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(Polyline(
            polylineId: PolylineId("polyline"),
            width: 10,
            points: polyLineCoordinates,
            color: Colors.blue));
      });
    }
  }
}
