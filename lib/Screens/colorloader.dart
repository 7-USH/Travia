// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:final_project/constants.dart';
import "package:flutter/material.dart";
import 'dart:math';

class ColorLoader3 extends StatefulWidget {
  final double radius;
  final double dotRadius;

  ColorLoader3({this.radius = 30.0, this.dotRadius = 10.0});

  @override
  _ColorLoader3State createState() => _ColorLoader3State();
}

class _ColorLoader3State extends State<ColorLoader3>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation_rotation;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;
  late AnimationController controller;

  late double radius;
  late double dotRadius;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.dotRadius;

    print(dotRadius);

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    animation_rotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animation_radius_in = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animation_radius_out = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0)
          radius = widget.radius * animation_radius_in.value;
        else if (controller.value >= 0.0 && controller.value <= 0.25)
          radius = widget.radius * animation_radius_out.value;
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCE6730),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ 
            kAppLogo(context, Colors.white, Colors.white24, 50),
            SizedBox(height: 20,),
            Container(
            width: 100.0,
            height: 100.0,
            //color: Colors.black12,
            child: Center(
              child: RotationTransition(
                turns: animation_rotation,
                child: Container(
                  //color: Colors.limeAccent,
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0.0, 0.0),
                          child: Dot(
                            radius: radius,
                            color: Colors.transparent,
                          ),
                        ),
                        Transform.translate(
                          child: Dot(
                            radius: dotRadius,
                            color: Colors.white,
                          ),
                          offset: Offset(
                            radius * cos(0.0),
                            radius * sin(0.0),
                          ),
                        ),
                        Transform.translate(
                          child: Dot(
                            radius: dotRadius,
                            color: Colors.white,
                          ),
                          offset: Offset(
                            radius * cos(0.0 + 1 * pi / 4),
                            radius * sin(0.0 + 1 * pi / 4),
                          ),
                        ),
                        Transform.translate(
                          child: Dot(
                            radius: dotRadius,
                            color: Colors.white,
                          ),
                          offset: Offset(
                            radius * cos(0.0 + 2 * pi / 4),
                            radius * sin(0.0 + 2 * pi / 4),
                          ),
                        ),
                        Transform.translate(
                          child: Dot(
                            radius: dotRadius,
                            color: Colors.white,
                          ),
                          offset: Offset(
                            radius * cos(0.0 + 3 * pi / 4),
                            radius * sin(0.0 + 3 * pi / 4),
                          ),
                        ),
                        Transform.translate(
                          child: Dot(
                            radius: dotRadius,
                            color: Colors.white,
                          ),
                          offset: Offset(
                            radius * cos(0.0 + 4 * pi / 4),
                            radius * sin(0.0 + 4 * pi / 4),
                          ),
                        ),
                        Transform.translate(
                          child: Dot(
                            radius: dotRadius,
                            color: Colors.white,
                          ),
                          offset: Offset(
                            radius * cos(0.0 + 5 * pi / 4),
                            radius * sin(0.0 + 5 * pi / 4),
                          ),
                        ),
                        Transform.translate(
                          child: Dot(
                            radius: dotRadius,
                            color: Colors.white,
                          ),
                          offset: Offset(
                            radius * cos(0.0 + 6 * pi / 4),
                            radius * sin(0.0 + 6 * pi / 4),
                          ),
                        ),
                        Transform.translate(
                          child: Dot(
                            radius: dotRadius,
                            color: Colors.white,
                          ),
                          offset: Offset(
                            radius * cos(0.0 + 7 * pi / 4),
                            radius * sin(0.0 + 7 * pi / 4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ]
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
