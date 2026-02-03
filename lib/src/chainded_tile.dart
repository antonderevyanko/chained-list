import 'package:chained_list/chained_list.dart';
import 'package:chained_list/src/tile_position.dart';
import 'package:chained_list/src/widget/chained_indicator.dart';
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

  /// Main list item widget. Will be placed toright of leading indicator widget
  final Widget child;

  /// Index of the item. Along with [totalCount] draws properly the first and the last item
  /// (only bottom or top part of connecting line respectively)
  final int tileIndex;

  /// The size of list. Along with [tileIndex] draws properly the first and the last item
  /// (only bottom or top part of connecting line respectively)
  final int totalCount;

  /// Horizontal size of the indicator widget
  final double indicatorWidth;

  /// The style of connection line
  final ChainLineStyle lineStyle;

  /// If set - defines circle indicator drawing style
  final CircleIndicatorStyle? circleStyle;

  /// If set - defines custom icon style
  final IconIndicatorStyle? iconStyle;

  @override
  Widget build(BuildContext context) {
    final tilePosition = TilePosition.positionBy(
      index: tileIndex,
      length: totalCount,
    );
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChainedIndicator(
            topLineStyle: _getTopLineStyle(tilePosition),
            bottomLineStyle: _getBottonLineStyle(tilePosition),
            circleStyle: circleStyle,
            iconStyle: iconStyle,
            indicatorWidth: indicatorWidth,
          ),
          Flexible(
            child: Container(
              constraints: const BoxConstraints(minHeight: 60),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  ChainLineStyle? _getTopLineStyle(TilePosition tilePosition) =>
      switch (tilePosition) {
        TilePosition.first => null,
        TilePosition.last => lineStyle,
        TilePosition.middle => lineStyle,
        TilePosition.theOnly => null,
      };

  ChainLineStyle? _getBottonLineStyle(TilePosition tilePosition) =>
      switch (tilePosition) {
        TilePosition.first => lineStyle,
        TilePosition.last => null,
        TilePosition.middle => lineStyle,
        TilePosition.theOnly => null,
      };
}
