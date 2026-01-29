import 'package:flutter/material.dart';

extension DottedLineX on Canvas {
  void drawDashedLine(
    Offset p1,
    Offset p2,
    Paint paint, {
    required double dashWidth,
    required double dashSpace,
  }) {
    double distance = (p2 - p1).distance;
    double currentDistance = 0;

    Offset direction = (p2 - p1) / distance;

    while (currentDistance < distance) {
      double nextDistance = currentDistance + dashWidth;
      if (nextDistance > distance) nextDistance = distance;
      drawLine(
        p1 + direction * currentDistance,
        p1 + direction * nextDistance,
        paint,
      );
      currentDistance += dashWidth + dashSpace;
    }
  }
}
