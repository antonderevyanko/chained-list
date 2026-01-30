import 'package:chained_list/chained_list.dart';
import 'package:chained_list/src/extensions/dotted_line_x.dart';
import 'package:flutter/material.dart';

class DoubleChainedPainter extends CustomPainter {
  DoubleChainedPainter({
    required this.centerIconOffset,
    required this.verticalOffset,
    this.topLineStyle,
    this.bottomLineStyle,
  });

  final ChainLineStyle? topLineStyle;
  final ChainLineStyle? bottomLineStyle;
  final double centerIconOffset;
  final double verticalOffset;

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    if (topLineStyle != null) {
      canvas.drawSyncedLine(
        Offset(centerX, 0),
        Offset(centerX, centerY - centerIconOffset),
        verticalOffset,
        topLineStyle!,
      );
    }

    if (bottomLineStyle != null) {
      canvas.drawSyncedLine(
        Offset(centerX, centerY + centerIconOffset),
        Offset(centerX, size.height),
        centerY + centerIconOffset + verticalOffset,
        bottomLineStyle!,
      );
    }
  }

  @override
  bool shouldRepaint(covariant DoubleChainedPainter oldDelegate) =>
      oldDelegate.verticalOffset != verticalOffset ||
      oldDelegate.topLineStyle != topLineStyle ||
      oldDelegate.bottomLineStyle != bottomLineStyle;
}
