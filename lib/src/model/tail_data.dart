import 'package:chained_list/chained_list.dart';
import 'package:flutter/material.dart';

class TailData {
  const TailData({
    required this.lineStyle,
    required this.iconStyle,
    this.indicatorWidth = 50.0,
  });

  /// Horizontal size of the indicator widget
  final double indicatorWidth;

  /// The style of connection line
  final ChainLineStyle lineStyle;

  /// If set - defines custom icon style
  final IconIndicatorStyle? iconStyle;
}

extension TailedTileX on TailData {
  DoubleChainedTile? convertToTiles({
    required Widget child,
    required int index,
    required List<TailData> allTails,
  }) {
    if (allTails.isEmpty) return null;

    final coreItem = allTails.elementAtOrNull(index);
    if (coreItem == null) return null;

    final topItem = index >= 1 ? allTails.elementAtOrNull(index - 1) : null;

    return DoubleChainedTile(
      iconStyle: coreItem.iconStyle,
      indicatorWidth: coreItem.indicatorWidth,
      bottomLineStyle: index == allTails.length - 1 ? null : coreItem.lineStyle,
      topLineStyle: topItem?.lineStyle,
      child: child,
    );
  }
}
