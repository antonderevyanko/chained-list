import 'package:chained_list/src/model/dash_params.dart';
import 'package:flutter/material.dart';

class ChainLineStyle {
  ChainLineStyle({
    required this.color,
    this.strokeWidth = 2,
    this.dashParams,
  });

  final Color color;
  final double strokeWidth;
  final DashParams? dashParams;
}
