
import 'package:chained_list/chained_list.dart';
import 'package:chained_list/src/widget/chained_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DoubleChainedTile extends StatefulWidget {
  const DoubleChainedTile({
    super.key,
    required this.child,
    this.indicatorWidth = 50.0,
    this.topLineStyle,
    this.bottomLineStyle,
    this.circleStyle,
    this.iconStyle,
  });

  /// Main list item widget. Will be placed toright of leading indicator widget
  final Widget child;

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

  @override
  State<DoubleChainedTile> createState() => _DoubleChainedTileState();
}

class _DoubleChainedTileState extends State<DoubleChainedTile> {
  double _verticalOffset = 0;

  void _updateOffset() {
    if (!mounted) return;
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      // Get position relative to the nearest scrollable (the ListView)
      final offset = renderBox.localToGlobal(
        Offset.zero,
        ancestor: context
            .findAncestorRenderObjectOfType<RenderAbstractViewport>(),
      );
      if (_verticalOffset != offset.dy) {
        setState(() {
          _verticalOffset = offset.dy;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // We update the offset after the frame renders to ensure accuracy
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateOffset());

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChainedIndicator(
            topLineStyle: widget.topLineStyle,
            bottomLineStyle: widget.bottomLineStyle,
            circleStyle: widget.circleStyle,
            iconStyle: widget.iconStyle,
            indicatorWidth: widget.indicatorWidth,
            verticalOffset: _verticalOffset,
          ),
          Flexible(
            child: Container(
              constraints: const BoxConstraints(minHeight: 60),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
