# chained_list 

Library which simplifies building lists in Flutter with visually connected items

<img src="https://github.com/ketanchoyal/custom_radio_grouped_button/raw/dev/ScreenShots/GroupButton.gif" alt="Grouped Button"/>

Supports different lines\indicator styles

## Installing

Add the following to your `pubspec.yaml` file:

    dependencies:
      chained_list: any

# Styling lines

    class ChainLineStyle {
        ChainLineStyle({
            required this.color,
            this.strokeWidth = 2,
        });
    }

# Styling indicators

Indicators can be made by simple circles or by custom widgets:    
    
    class CircleIndicatorStyle extends ChainIndicatorStyle {
        CircleIndicatorStyle({
            required this.paintingStyle,
            required this.radius,
            required super.color,
            this.strokeWidth = 2,
        });
    }

    class IconIndicatorStyle extends ChainIndicatorStyle {
        IconIndicatorStyle({
            required this.iconSize,
            required super.color,
            this.iconData,
            this.iconWidget,
    })
}
