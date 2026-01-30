import 'package:chained_list/chained_list.dart';
import 'package:flutter/material.dart';

class TimelineScreenIcons extends StatelessWidget {
  const TimelineScreenIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _ItemData('Ordered', Icons.check_circle),
      _ItemData('Waiting for payment', Icons.check_circle),
      _ItemData('Payed', Icons.check_circle),
      _ItemData('Processed', Icons.check_circle),
      _ItemData('Shipped to local carrier', Icons.check_circle),
      _ItemData('Arrived to logistic center', Icons.arrow_forward_rounded),
      _ItemData('Out for delivery', Icons.arrow_forward_rounded),
      _ItemData('Delivered', Icons.question_mark_rounded),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Order Tracking (Icons)')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ChainedTile(
            tileIndex: index,
            totalCount: items.length,
            lineStyle: ChainLineStyle(
              color: index < 5 ? Colors.green : Colors.blue,
              strokeWidth: 4,
            ),
            iconStyle: index != 0
                ? IconIndicatorStyle(
                    iconData: items[index].icon,
                    iconSize: 24,
                    color: index < 5 ? Colors.green : Colors.blue,
                  )
                : null,
            circleStyle: index >= 5
                ? CircleIndicatorStyle(
                    paintingStyle: PaintingStyle.stroke,
                    strokeWidth: 4,
                    radius: 28,
                    color: Colors.blue,
                  )
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index].text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  'Update received at ${12 + index}:00 PM',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ItemData {
  final String text;
  final IconData icon;

  _ItemData(this.text, this.icon);
}
