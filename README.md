# chained_list 

Library which simplifies building lists in Flutter with visually connected items

<img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/case-circles.png?raw=true" height="500"/>

<img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/case-icons.png?raw=true" height="500"/>

<img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/case-custom-icons.png?raw=true" height="500"/>

<img src="https://github.com/antonderevyanko/chained-list/blob/main/screenshot/case-complex-lines.png?raw=true" height="500"/>

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

Indicators can be made by simple circles:    
    
    class CircleIndicatorStyle extends ChainIndicatorStyle {
        CircleIndicatorStyle({
            required this.paintingStyle,
            required this.radius,
            required super.color,
            this.strokeWidth = 2,
        });
    }

Or by custom widgets:    

    class IconIndicatorStyle extends ChainIndicatorStyle {
        IconIndicatorStyle({
            required this.iconSize,
            required super.color,
            this.iconData,
            this.iconWidget,
        })
    }
