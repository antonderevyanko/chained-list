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
    required this.iconSize,
    required super.color,
    this.iconData,
    this.iconWidget,
  }) : assert(
         !(iconData != null && iconWidget != null),
         'Only one of iconData or iconWidget may be not null',
       ),
       assert(
         !(iconData == null && iconWidget == null),
         'At least one of iconData or iconWidget should be not null',
       );

  final IconData? iconData;
  final Widget? iconWidget;
  final double iconSize;
}
