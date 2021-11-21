import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  Color selectedBackgroundColor = Colors.white.withOpacity(0.3);
  Color simpleColor = Colors.black;
  Color effectColor = const Color(0xFFCE6730);

  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildNewSingleNavbar(Icons.home_outlined, 0),
            buildNewSingleNavbar(Icons.favorite_outline, 1),
            buildNewSingleNavbar(Icons.travel_explore, 2),
            buildNewSingleNavbar(Icons.settings_outlined, 3),
          ],
        ),
      ),
    );
  }

  Widget buildNewSingleNavbar(
    IconData icon,
    int label,
  ) {
    return GestureDetector(
      onTap: () {
            setState(() {
              _selectedIndex = label;
            });},
            
      child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color:
                label == _selectedIndex ? Colors.white : selectedBackgroundColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: label==_selectedIndex ? kBoxShadows : null,
          ),
          // ignore: prefer_const_constructors
          child: Icon(
            icon,
            size: 35,
            color: label == _selectedIndex ? effectColor : simpleColor,
          )),
    );
  }
}
