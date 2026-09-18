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

<img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/single_style.png?raw=true" width="500"/>

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

<img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/double_style.png?raw=true" width="500"/>

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

## TailData

Also for easier library usage it is possible to take `TailData` helper class.

```dart
TailData {
  final double indicatorWidth;          /// Horizontal size of the indicator widget
  final ChainLineStyle lineStyle;       /// The style of connection line
  final IconIndicatorStyle? iconStyle;  /// If set - defines custom icon style
  }
```

This class is helpful to process items as center icon + bottom line. 

<img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/tailed_chain.png?raw=true" width="500"/>

So, for the first item in the list there will be to upper tail, just lower one. A middle item will have both center icon and tail and the last one will have only center icon without line. As always, `indicatorWidth` represents with of all items and should be bigger then centered icon.

### Usage

As `TailData` is simple data-class, it cannot be directly used in widget tree. There is helper `convertToTiles()` function which converts it to properly configured ChainedIndicator list. 

As real ChainedIndicator item depends on two subsequental items of TailData, to use `convertToTiles` user need to pass all items while mapping one TailData to ChainedIndicator:

```dart
for (var i = 0; i < tailedItems.length; i++) {
      final item = tailedItems[i];
      resultList.add(
        item.convertToTiles(
          index: i,
          allTails: tailedItems,
          child: getByIndex(i),
        ),
      );
    }
```

or use `.mapIndexed()` from the collection library.

#### Pro-Tip: Vertical Synchronization

The verticalOffset property is crucial for __dashed lines__. Since list items often have different heights, the dash pattern might "break" between tiles. Passing the cumulative height/offset ensures the dashes connect smoothly from one tile to the next.

## Future plans

Left/Right setting

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue on the [GitHub repository](https://github.com/antonderevyanko/chained-list).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
