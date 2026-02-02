import 'dart:math';

import 'package:chained_list/chained_list.dart';
import 'package:chained_list/src/painter/chained_painter.dart';
import 'package:chained_list/src/painter/circe_painter.dart';
import 'package:chained_list/src/tile_position.dart';
import 'package:flutter/material.dart';

class ChainedTile extends StatelessWidget {
  const ChainedTile({
    super.key,
    required this.child,
    required this.tileIndex,
    required this.totalCount,
    required this.lineStyle,
    this.indicatorWidth = 50.0,
    this.circleStyle,
    this.iconStyle,
  }) : assert(
         tileIndex >= 0 && totalCount >= 0,
         'Total count of items and index should be greater or equals zero',
       ),
       assert(
         totalCount >= tileIndex,
         'Tile index shlould not be greater total count',
       );

  final Widget child;
  final int tileIndex;
  final int totalCount;
  final double indicatorWidth;
  final ChainLineStyle lineStyle;
  final CircleIndicatorStyle? circleStyle;
  final IconIndicatorStyle? iconStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          left: 0,
          right: null,
          child: SizedBox(
            width: indicatorWidth,
            child: CustomPaint(
              painter: ChainedPainter(
                lineStyle: lineStyle,
                centerPadding: _getCenterPadding(),
                tilePosition: TilePosition.positionBy(
                  index: tileIndex,
                  length: totalCount,
                ),
              ),
            ),
          ),
        ),

        if (iconStyle != null)
          Positioned.fill(
            left: 0,
            right: null,
            child: SizedBox(
              width: indicatorWidth,
              child: Center(
                child: iconStyle!.iconData != null
                    ? Icon(
                        size: iconStyle!.iconSize,
                        iconStyle!.iconData,
                        color: iconStyle!.color,
                        fontWeight: FontWeight.bold,
                      )
                    : iconStyle!.iconWidget!,
              ),
            ),
          ),

        if (circleStyle != null)
          Positioned.fill(
            left: 0,
            right: null,
            child: SizedBox(
              width: indicatorWidth,
              child: CustomPaint(
                painter: CirclePainter(
                  indicatorStyle: circleStyle!,
                ),
              ),
            ),
          ),

        Padding(
          padding: EdgeInsets.only(left: indicatorWidth),
          child: Container(
            constraints: const BoxConstraints(minHeight: 60),
            child: child,
          ),
        ),
      ],
    );
  }

  double _getCenterPadding() {
    if (circleStyle == null && iconStyle == null) return 0;
    final circlePadding = circleStyle != null ? circleStyle!.radius / 2 : 0.0;
    final iconPadding = iconStyle != null ? iconStyle!.iconSize / 2 : 0.0;
    return max(circlePadding, iconPadding);
  }
}
