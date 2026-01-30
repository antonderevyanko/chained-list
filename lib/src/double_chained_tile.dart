import 'dart:math';

import 'package:chained_list/chained_list.dart';
import 'package:chained_list/src/painter/circe_painter.dart';
import 'package:chained_list/src/painter/double_chained_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DoubleChainedTile extends StatefulWidget {
  const DoubleChainedTile({
    super.key,
    required this.child,
    this.topLineStyle,
    this.bottomLineStyle,
    this.circleStyle,
    this.iconStyle,
  });

  final Widget child;
  final ChainLineStyle? topLineStyle;
  final ChainLineStyle? bottomLineStyle;
  final CircleIndicatorStyle? circleStyle;
  final IconIndicatorStyle? iconStyle;

  @override
  State<DoubleChainedTile> createState() => _DoubleChainedTileState();
}

class _DoubleChainedTileState extends State<DoubleChainedTile> {
  final double indicatorWidth = 50.0;

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

    return Stack(
      children: [
        Positioned.fill(
          left: 0,
          right: null,
          child: SizedBox(
            width: indicatorWidth,
            child: CustomPaint(
              painter: DoubleChainedPainter(
                centerIconOffset: _getCenterPadding(),
                topLineStyle: widget.topLineStyle,
                bottomLineStyle: widget.bottomLineStyle,
                verticalOffset: _verticalOffset,
              ),
            ),
          ),
        ),

        if (widget.iconStyle != null)
          Positioned.fill(
            left: 0,
            right: null,
            child: SizedBox(
              width: indicatorWidth,
              child: Center(
                child: widget.iconStyle!.iconData != null
                    ? Icon(
                        size: widget.iconStyle!.iconSize,
                        widget.iconStyle!.iconData,
                        color: widget.iconStyle!.color,
                        fontWeight: FontWeight.bold,
                      )
                    : widget.iconStyle!.iconWidget!,
              ),
            ),
          ),

        if (widget.circleStyle != null)
          Positioned.fill(
            left: 0,
            right: null,
            child: SizedBox(
              width: indicatorWidth,
              child: CustomPaint(
                painter: CirclePainter(
                  indicatorStyle: widget.circleStyle!,
                ),
              ),
            ),
          ),

        Padding(
          padding: EdgeInsets.only(left: indicatorWidth),
          child: Container(
            constraints: const BoxConstraints(minHeight: 60),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: widget.child,
          ),
        ),
      ],
    );
  }

  double _getCenterPadding() {
    if (widget.circleStyle == null && widget.iconStyle == null) return 0;
    final circlePadding = widget.circleStyle != null
        ? widget.circleStyle!.radius / 2
        : 0.0;
    final iconPadding = widget.iconStyle != null
        ? widget.iconStyle!.iconSize / 2
        : 0.0;
    return max(circlePadding, iconPadding);
  }
}
