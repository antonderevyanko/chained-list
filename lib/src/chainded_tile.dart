import 'package:chained_list/chained_list.dart';
import 'package:chained_list/src/chained_painter.dart';
import 'package:chained_list/src/tile_position.dart';
import 'package:flutter/material.dart';

class ChainedTile extends StatelessWidget {
  const ChainedTile({
    super.key,
    required this.child,
    required this.tileIndex,
    required this.totalCount,
    required this.lineStyle,
    this.backgroundColor = Colors.white,
    this.iconSize,
    this.icon,
  }) : assert(
         tileIndex >= 0 && totalCount >= 0,
         'Total count of items and index should be greater or equals zero',
       ),
       assert(
         totalCount >= tileIndex,
         'Tile index shlould not be greater total count',
       )
      //  ,
      //  assert(
      //    iconSize != null ? (iconSize / 2 - lineStyle.strokeWidth) > 0 : true,
      //    'Stroke width is too small to draw center circle',
      //  )
       ;

  final Widget child;
  final int tileIndex;
  final int totalCount;
  final Color backgroundColor;
  final double indicatorWidth = 50.0;
  final IconData? icon;
  final ChainLineStyle lineStyle;

  /// defines width and height of center circle. if null -> no inner circle will be drawn
  final double? iconSize;

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
                backgroundColor: backgroundColor,
                iconSize: iconSize,
                tilePosition: TilePosition.positionBy(
                  index: tileIndex,
                  length: totalCount,
                ),
              ),
            ),
          ),
        ),

        if (icon != null)
          Positioned.fill(
            left: 0,
            right: null,
            child: SizedBox(
              width: indicatorWidth,
              child: Center(
                child: SizedBox(
                  child: Icon(
                    icon,
                    color: lineStyle.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

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
