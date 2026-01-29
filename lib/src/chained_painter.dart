import 'package:chained_list/chained_list.dart';
import 'package:chained_list/src/tile_position.dart';
import 'package:flutter/material.dart';

class ChainedPainter extends CustomPainter {
  ChainedPainter({
    required this.lineStyle,
    required this.backgroundColor,
    required this.tilePosition,
    required this.iconSize,
  });

  final ChainLineStyle lineStyle;
  final Color backgroundColor;
  final TilePosition tilePosition;
  final double? iconSize;

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
          Offset(centerX, centerY + 10),
          Offset(centerX, size.height),
          paint,
        );
      case TilePosition.last:
        canvas.drawLine(
          Offset(centerX, centerY - 10),
          Offset(centerX, 0),
          paint,
        );
      case TilePosition.middle:
        canvas.drawLine(
          Offset(centerX, 0),
          Offset(centerX, centerY - 10),
          paint,
        );
        canvas.drawLine(
          Offset(centerX, centerY + 10),
          Offset(centerX, size.height),
          paint,
        );
      case TilePosition.theOnly:
    }

    final outerRadius = iconSize;
    if (outerRadius != null) {
      final circlePaint = Paint()
        ..color = lineStyle.color
        ..strokeWidth = lineStyle.strokeWidth
        ..style = PaintingStyle.stroke;

      canvas.drawCircle(Offset(centerX, centerY), outerRadius / 2, circlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
