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
    required this.indicatorStyle,
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
  final double indicatorWidth = 50.0;
  final ChainLineStyle lineStyle;
  final ChainIndicatorStyle indicatorStyle;

  @override
  Widget build(BuildContext context) {
    final currentIndicatorStyle = indicatorStyle;
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
                indicatorStyle: currentIndicatorStyle,
                centerPadding: switch (currentIndicatorStyle) {
                  CircleIndicatorStyle() => currentIndicatorStyle.radius / 2,
                  IconIndicatorStyle() => currentIndicatorStyle.iconSize,
                },
                tilePosition: TilePosition.positionBy(
                  index: tileIndex,
                  length: totalCount,
                ),
              ),
            ),
          ),
        ),

        switch (currentIndicatorStyle) {
          CircleIndicatorStyle() => Positioned.fill(
            left: 0,
            right: null,
            child: SizedBox(
              width: indicatorWidth,
              child: CustomPaint(
                painter: CirclePainter(
                  indicatorStyle: currentIndicatorStyle,
                  tilePosition: TilePosition.positionBy(
                    index: tileIndex,
                    length: totalCount,
                  ),
                ),
              ),
            ),
          ),
          IconIndicatorStyle() => Positioned.fill(
            left: 0,
            right: null,
            child: SizedBox(
              width: indicatorWidth,
              child: Center(
                child: SizedBox(
                  child: Icon(
                    currentIndicatorStyle.icon,
                    color: lineStyle.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        },

        Padding(
          padding: EdgeInsets.only(left: indicatorWidth),
          child: Container(
            constraints: const BoxConstraints(minHeight: 60),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: child,
          ),
        ),
      ],
    );
  }
}
