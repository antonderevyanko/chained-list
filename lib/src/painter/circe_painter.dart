import 'package:chained_list/chained_list.dart';
import 'package:chained_list/src/tile_position.dart';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  CirclePainter({
    required this.indicatorStyle,
    required this.tilePosition,
  });

  final CircleIndicatorStyle indicatorStyle;
  final TilePosition tilePosition;

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final outerRadius = indicatorStyle.radius;
    final circlePaint = Paint()
      ..color = indicatorStyle.color
      ..strokeWidth = indicatorStyle.strokeWidth
      ..style = indicatorStyle.paintingStyle;

    canvas.drawCircle(
      Offset(centerX, centerY),
      outerRadius / 2,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
