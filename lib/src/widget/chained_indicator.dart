import 'dart:math';

import 'package:chained_list/chained_list.dart';
import 'package:chained_list/src/painter/circe_painter.dart';
import 'package:chained_list/src/painter/double_chained_painter.dart';
import 'package:flutter/material.dart';

class ChainedIndicator extends StatelessWidget {
  const ChainedIndicator({
    this.topLineStyle,
    this.bottomLineStyle,
    this.indicatorWidth = 50.0,
    this.circleStyle,
    this.iconStyle,
    this.verticalOffset = 0,
    super.key,
  });

  /// Horizontal size of the indicator widget
  final double indicatorWidth;

  /// The top part of connection line
  final ChainLineStyle? topLineStyle;

  /// The bottom part of connection line
  final ChainLineStyle? bottomLineStyle;

  /// If set - defines circle indicator drawing style
  final CircleIndicatorStyle? circleStyle;

  /// If set - defines custom icon style
  final IconIndicatorStyle? iconStyle;

  /// This value is used for syncronization of connection point between two neighbor
  /// cells. Should be used only in the case of dashed lines when dash pattern
  /// should ne smoothly connect two tiles: 
  /// 
  /// (0) = = = = (1)
  /// 
  ///          ^ this point should be syncronized event for different (0) and (1)
  ///            items height 
  /// 
  /// See [DoubleChainedTile] for the implementation example.
  final double verticalOffset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: indicatorWidth,
      child: Stack(
        children: [
          Positioned.fill(
            left: 0,
            right: null,
            child: SizedBox(
              width: indicatorWidth,
              child: CustomPaint(
                painter: DoubleChainedPainter(
                  topLineStyle: topLineStyle,
                  bottomLineStyle: bottomLineStyle,
                  verticalOffset: verticalOffset,
                  centerIconOffset: _getCenterPadding(),
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
        ],
      ),
    );
  }

  double _getCenterPadding() {
    if (circleStyle == null && iconStyle == null) return 0;
    final circlePadding = circleStyle != null ? circleStyle!.radius / 2 : 0.0;
    final iconPadding = iconStyle != null ? iconStyle!.iconSize / 2 : 0.0;
    return max(circlePadding, iconPadding);
  }
}
