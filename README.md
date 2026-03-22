# Chained List: Timelines and Step-by-Step Lists in Flutter

[![pub package](https://img.shields.io/pub/v/chained_list.svg)](https://pub.dev/packages/chained_list)

A Flutter library that simplifies building vertical lists with visually connected items, such as timelines, process trackers, or step-by-step guides.

|Circles and IconData	|Custom Icons		|Complex lines		|
|:------------:|:------------:|:-------------:|
|	<img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/case-icons.png?raw=true" height="500"/> | <img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/case-custom-icons.png?raw=true" height="500"/> | <img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/case-complex-lines.png?raw=true" height="500"/> |

Supports different lines\indicator styles.

## Installing

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  chained_list: ^<latest_version>
```

Then run `flutter pub get`.

# Usage

The library provides a specialized "leading" widget that renders an indicator (circle/icon) with vertical connection lines.

There are two ways to implement this:
1) __High-Level Tiles__: Use `ChainedTile` or `DoubleChainedTile` for automatic layout.
2) __Low-Level Indicator__: Use `ChainedIndicator` directly if you need full control over placement (requires manual sizing).


## ChainedTile

Use this when the line style above and below the indicator is the same. It automatically handles the top and bottom lines for the first and last items.

```dart
const ChainedTile(
    final Widget child;                        // main list item content
    final int tileIndex;                       // used to draw properly the first
    final int totalCount;                      // and the last items lines
    final ChainLineStyle lineStyle;            // line styling
    final CircleIndicatorStyle? circleStyle;   // circle decoration property
    final IconIndicatorStyle? iconStyle;       // custom icon can be IconData or Widget
    this.indicatorWidth = 50.0,                // width of the leading item
);
```

## DoubleChainedTile

Use this when you need __different styles__ for the top and bottom lines within a single tile (e.g., a "completed" step connecting to an "in-progress" step).

```dart
class DoubleChainedTile extends StatefulWidget {
    final Widget child;                        // main list item content
    final ChainLineStyle? topLineStyle;        // separate styles for top
    final ChainLineStyle? bottomLineStyle;     // and bottom lines
    final CircleIndicatorStyle? circleStyle;   // circle decoration property
    final IconIndicatorStyle? iconStyle;       // custom icon can be IconData or Widget
    this.indicatorWidth = 50.0,                // width of the leading item
}
```

### ChainedIndicator

Direct usage of `ChainedIndicator` gives more control of indicator placement and sizing. But this widget should be placed in parent widget with concrete height and width sizes. 

```dart
class ChainedIndicator extends StatelessWidget {
  final double indicatorWidth;              // Horizontal size of the indicator widget
  final ChainLineStyle? topLineStyle;       // The top part of connection line
  final ChainLineStyle? bottomLineStyle;    // The bottom part of connection line
  final CircleIndicatorStyle? circleStyle;  // If set - defines circle indicator drawing style
  final IconIndicatorStyle? iconStyle;      // If set - defines custom icon style
  final double verticalOffset;              // Used for dash-pattern synchronization
}
```

#### Pro-Tip: Vertical Synchronization

The verticalOffset property is crucial for __dashed lines__. Since list items often have different heights, the dash pattern might "break" between tiles. Passing the cumulative height/offset ensures the dashes connect smoothly from one tile to the next.

## Future plans

1. Left/Right setting
2. More styling (?)

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue on the [GitHub repository](https://github.com/antonderevyanko/chained-list).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
