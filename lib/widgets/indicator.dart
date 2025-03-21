import 'package:flutter/material.dart';

class TriangleBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0); // Top-left corner
    path.lineTo(size.width, 0); // Top-right corner
    path.lineTo(size.width, size.height - size.height * 0.2); // Bottom-right before triangle
    path.lineTo(size.width / 2, size.height); // Bottom triangle tip (sharp)
    path.lineTo(0, size.height - size.height * 0.2); // Bottom-left before triangle
    path.close(); // Complete the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
