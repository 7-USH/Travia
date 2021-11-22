import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class CustomClipath extends StatelessWidget {
  CustomClipath({Key? key, required this.widget}) : super(key: key);

  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
       ClipPath(
         child: Container(
           color: Colors.transparent.withOpacity(0.2),
           height: 460,
         ).shimmer(
           primaryColor: const Color(0xFFCE6730),
           secondaryColor: Colors.white,
           duration: const Duration(seconds: 10),
         ),
         clipper: MyClipper(),
       ),
      ClipPath(
        child: widget,
        clipper: MyClipper(),
      ),
    ]);
  }
}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    var controlPoint = Offset(50, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
