import 'package:flutter/material.dart';

class ClipperWidget extends CustomClipper<Path> {
  final List<Offset> waveList;

  // ignore: invalid_required_positional_param
  ClipperWidget(@required this.waveList);

  @override
  getClip(Size size) {
    final Path path = Path();
    path.addPolygon(waveList, false);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
