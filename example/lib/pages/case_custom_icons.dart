import 'package:chained_list/chained_list.dart';
import 'package:example/data/order_mock_data.dart';
import 'package:flutter/material.dart';

class CaseCustomIcons extends StatelessWidget {
  const CaseCustomIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Tracking (Custom Icons)')),
      body: ListView.builder(
        itemCount: orderDataIcons.length,
        itemBuilder: (context, index) {
          return ChainedTile(
            tileIndex: index,
            totalCount: orderDataIcons.length,
            lineStyle: ChainLineStyle(
              color: index < 5 ? Colors.green : Colors.blue,
              strokeWidth: 3,
            ),
            iconStyle: IconIndicatorStyle(
              iconWidget: Text(
                '${index + 1}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: index < 5 ? Colors.green : Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              iconSize: 20,
              color: index < 5 ? Colors.green : Colors.blue,
            ),
            circleStyle: CircleIndicatorStyle(
              paintingStyle: PaintingStyle.stroke,
              radius: 25,
              color: index < 5 ? Colors.green : Colors.blue,
              strokeWidth: 3,
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderDataIcons[index].text,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    'Update received at ${12 + index}:00 PM',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
