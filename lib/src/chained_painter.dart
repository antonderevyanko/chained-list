import 'package:chained_list/src/tile_position.dart';
import 'package:flutter/material.dart';

class ChainedPainter extends CustomPainter {
  ChainedPainter({
    required this.color,
    required this.backgroundColor,
    required this.tilePosition,
    this.iconSize = 16,
  });

  final Color color;
  final Color backgroundColor;
  final TilePosition tilePosition;
  final double iconSize;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    switch (tilePosition) {
      case TilePosition.first:
        canvas.drawLine(
          Offset(centerX, centerY + (iconSize / 2)),
          Offset(centerX, size.height),
          paint,
        );
      case TilePosition.last:
        canvas.drawLine(
          Offset(centerX, 0),
          Offset(centerX, centerY - (iconSize / 2)),
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

    // 3. Draw the center circle
    final circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(centerX, centerY), iconSize / 2, circlePaint);

    // drawing white circle over colored because inner backgroundColor may be 
    // semi-transparent and thus mixed with outer circle color
    canvas.drawCircle(
      Offset(centerX, centerY),
      iconSize / 4,
      Paint()..color = Colors.white,
    );
    canvas.drawCircle(
      Offset(centerX, centerY),
      iconSize / 4,
      Paint()..color = backgroundColor,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
