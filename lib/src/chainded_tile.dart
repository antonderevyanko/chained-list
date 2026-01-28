import 'package:chained_list/src/chained_painter.dart';
import 'package:chained_list/src/tile_position.dart';
import 'package:flutter/material.dart';

class ChainedTile extends StatelessWidget {
  const ChainedTile({
    super.key,
    required this.child,
    required this.tileIndex,
    required this.totalCount,
    this.color = Colors.blue,
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
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: double.infinity,
            child: CustomPaint(
              painter: ChainedPainter(
                color: color,
                tilePosition: TilePosition.positionBy(
                  index: tileIndex,
                  length: totalCount,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
