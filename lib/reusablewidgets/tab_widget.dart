import 'package:final_project/reusablewidgets/change_color_text.dart';
import 'package:flutter/material.dart';

class RowTabWidget extends StatefulWidget {
  const RowTabWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RowTabWidget> createState() => _RowTabWidgetState();
}

class _RowTabWidgetState extends State<RowTabWidget> {
  int tappedIndex = 0;
  
  List<String> message = [
    "Most Viewed",
    "Popular",
    "Recommended",
    "Best in Nature"
  ];

  List<Widget> functions = []; // notes add new widgets here;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        color: Colors.transparent,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return OnClickTextColorChange(
                  label: index,
                  tappedIndex: tappedIndex,
                  shouldColor: false,
                  message: message[index],
                  onTap: () {
                    print(index);
                    setState(() {
                      tappedIndex = index;
                    });
                  });
            }));
  }
}
