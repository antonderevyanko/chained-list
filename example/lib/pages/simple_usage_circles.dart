import 'package:chained_list/chained_list.dart';
import 'package:flutter/material.dart';

class TimelineScreenCircles extends StatelessWidget {
  const TimelineScreenCircles({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'Ordered',
      'Waiting for payment',
      'Payed',
      'Processed',
      'Shipped to local carrier',
      'Arrived to logistic center',
      'Out for delivery',
      'Delivered',
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Order Tracking')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ChainedTile(
            tileIndex: index,
            totalCount: items.length,
            lineStyle: ChainLineStyle(
              color: index < 5 ? Colors.green : Colors.blue,
              strokeWidth: 5,
            ),
            circleStyle: CircleIndicatorStyle(
              paintingStyle: index < 5 ? PaintingStyle.fill : PaintingStyle.stroke,
              radius: 25,
              color: index < 5 ? Colors.green : Colors.blue,
              strokeWidth: 5
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index],
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
