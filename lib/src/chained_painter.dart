import 'package:chained_list/src/tile_position.dart';
import 'package:flutter/material.dart';

class ChainedPainter extends CustomPainter {
  ChainedPainter({
    required this.color,
    required this.backgroundColor,
    required this.tilePosition,
    required this.strokeWidth,
    required this.iconSize,
  });

  final Color color;
  final Color backgroundColor;
  final TilePosition tilePosition;
  final double? iconSize;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    switch (tilePosition) {
      case TilePosition.first:
        canvas.drawLine(
          Offset(centerX, centerY),
          Offset(centerX, size.height),
          paint,
        );
      case TilePosition.last:
        canvas.drawLine(
          Offset(centerX, 0),
          Offset(centerX, centerY),
          paint,
        );
      case TilePosition.middle:
        canvas.drawLine(
          Offset(centerX, 0),
          Offset(centerX, size.height),
          paint,
        );
      case TilePosition.theOnly:
    }

    final outerRadius = iconSize;
    if (outerRadius != null) {
      // outer circle
      final circlePaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(centerX, centerY), outerRadius / 2, circlePaint);

      final innerRadius = outerRadius - strokeWidth * 2;
      // drawing white circle over colored because inner backgroundColor may be
      // semi-transparent and thus mixed with outer circle color
      canvas.drawCircle(
        Offset(centerX, centerY),
        innerRadius / 2,
        Paint()..color = Colors.white,
      );
      canvas.drawCircle(
        Offset(centerX, centerY),
        innerRadius / 2,
        Paint()..color = backgroundColor,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
