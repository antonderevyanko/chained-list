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

  /// Can be PaintingStyle.fill or PaintingStyle.stroke
  final PaintingStyle paintingStyle;

  /// Circle indicator radius
  final double radius;

  /// If [paintingStyle] is set to stroke - defines line width
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

  /// If set - will set as Icon. Cannot be set if [iconWidget] is not null
  final IconData? iconData;

  /// Custom indicator widget. . Cannot be set if [iconData] is not null
  final Widget? iconWidget;

  /// Icon size
  final double iconSize;
}
