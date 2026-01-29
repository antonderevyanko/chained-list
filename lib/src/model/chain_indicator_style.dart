import 'package:flutter/material.dart';

sealed class ChainIndicatorStyle {
  ChainIndicatorStyle({required this.color});

  final Color color;
}

class CircleIndicatorStyle extends ChainIndicatorStyle {
  CircleIndicatorStyle({
    required this.paintingStyle,
    required this.radius,
    required super.color,
    this.strokeWidth = 2,
  });

  final PaintingStyle paintingStyle;
  final double radius;
  final double strokeWidth;
}

class IconIndicatorStyle extends ChainIndicatorStyle {
  IconIndicatorStyle({
    required this.icon,
    required this.iconSize,
    required super.color,
  });

  final IconData icon;
  final double iconSize;
}
