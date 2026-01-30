import 'package:chained_list/chained_list.dart';
import 'package:flutter/material.dart';

extension DottedLineX on Canvas {
  void drawSyncedLine(
    Offset start,
    Offset end,
    double localStartY,
    ChainLineStyle lineStyle,
  ) {
    final paint = Paint()
      ..color = lineStyle.color
      ..strokeWidth = lineStyle.strokeWidth
      ..style = PaintingStyle.stroke;

    if (lineStyle.dashParams == null) {
      drawLine(start, end, paint);
    } else {
      double dashHeight = lineStyle.dashParams!.dashHeight;
      double dashGap = lineStyle.dashParams!.dashGap;
      double totalPattern = dashHeight + dashGap;

      // calculate where in the pattern we are based on global position
      double currentY = start.dy;
      double globalY = localStartY;

      // Adjust the first dash so it aligns with the global grid
      double firstDashOffset = globalY % totalPattern;
      if (firstDashOffset != 0) {
        currentY -= firstDashOffset;
      }

      while (currentY < end.dy) {
        double dashTop = currentY;
        double dashBottom = currentY + dashHeight;

        // Only draw if the dash is within the actual line segment bounds
        if (dashBottom > start.dy && dashTop < end.dy) {
          drawLine(
            Offset(start.dx, dashTop.clamp(start.dy, end.dy)),
            Offset(start.dx, dashBottom.clamp(start.dy, end.dy)),
            paint,
          );
        }
        currentY += totalPattern;
      }
    }
  }
}
