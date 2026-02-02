# chained_list 

Library which simplifies building lists in Flutter with visually connected items

|Circles and IconData	|Custom Icons		|Complex lines		|
|:------------:|:------------:|:-------------:|
|	<img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/case-icons.png?raw=true" height="500"/> | <img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/case-custom-icons.png?raw=true" height="500"/> | <img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/case-complex-lines.png?raw=true" height="500"/> |

Supports different lines\indicator styles.

## Installing

Add the following to your `pubspec.yaml` file:

    dependencies:
      chained_list: any

# Usage

The basic idea is to provide list-tile widget wich helps to draw special leading item, displayed as indicator widget at center with vertical lines. Library provides two main tile-widgets: ChainedTile and DoubleChainedTile. 


## ChainedTile

May be used for the cases where vertical line inside 'chain' widget should has constant style. It can be configured to have different line styles, to have icon indicator and circle decoration if needed.

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

## Styling indicators

Should be used for the cases when a line connection between two tiles should be constant. In this case it is may be needed to set different styles for 'top' and 'bottom' parts of line inside a tile.

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

# Future plans

1. Left/Right setting
2. More styling (?)
