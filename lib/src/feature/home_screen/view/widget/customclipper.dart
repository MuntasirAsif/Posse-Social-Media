import 'dart:ui';

import 'package:flutter/material.dart';

class WavyTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double curveDepth = -20.0;
    const double curveWidth = -60.0;

    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo((size.width - curveWidth) / 2, 0);

    path.cubicTo(
      size.width / 2 - curveWidth / 3, 0,
      size.width / 2 - curveWidth / 4, curveDepth * 2,
      size.width / 2, curveDepth * 2,
    );

    path.cubicTo(
      size.width / 2 + curveWidth / 4, curveDepth * 2,
      size.width / 2 + curveWidth / 4, 0,
      (size.width + curveWidth) / 2, 0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
