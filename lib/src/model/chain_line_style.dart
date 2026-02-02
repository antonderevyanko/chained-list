import 'package:chained_list/src/model/dash_params.dart';
import 'package:flutter/material.dart';

class ChainLineStyle {
  ChainLineStyle({
    required this.color,
    this.strokeWidth = 2,
    this.dashParams,
  });

  /// Color of the line
  final Color color;

  /// Line width
  final double strokeWidth;

  /// Can be null. If set - defines line dashing style
  final DashParams? dashParams;
}
