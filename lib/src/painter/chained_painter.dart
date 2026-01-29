import 'package:chained_list/chained_list.dart';
import 'package:chained_list/src/tile_position.dart';
import 'package:flutter/material.dart';

class ChainedPainter extends CustomPainter {
  ChainedPainter({
    required this.lineStyle,
    required this.tilePosition,
    required this.centerPadding,
  });


  final ChainLineStyle lineStyle;
  final TilePosition tilePosition;
  final double centerPadding;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineStyle.color
      ..strokeWidth = lineStyle.strokeWidth;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    switch (tilePosition) {
      case TilePosition.first:
        canvas.drawLine(
          Offset(centerX, centerY + centerPadding),
          Offset(centerX, size.height),
          paint,
        );
      case TilePosition.last:
        canvas.drawLine(
          Offset(centerX, centerY - centerPadding),
          Offset(centerX, 0),
          paint,
        );
      case TilePosition.middle:
        canvas.drawLine(
          Offset(centerX, 0),
          Offset(centerX, centerY - centerPadding),
          paint,
        );
        canvas.drawLine(
          Offset(centerX, centerY + centerPadding),
          Offset(centerX, size.height),
          paint,
        );
      case TilePosition.theOnly:
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
