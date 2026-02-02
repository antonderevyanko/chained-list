import 'package:chained_list/chained_list.dart';
import 'package:example/data/order_mock_data.dart';
import 'package:flutter/material.dart';

class CaseIcons extends StatelessWidget {
  const CaseIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Tracking (Icons)')),
      body: ListView.builder(
        itemCount: orderDataIcons.length,
        itemBuilder: (context, index) {
          return ChainedTile(
            tileIndex: index,
            totalCount: orderDataIcons.length,
            lineStyle: ChainLineStyle(
              color: index < 5 ? Colors.green : Colors.blue,
              strokeWidth: 4,
            ),
            iconStyle: index != 0
                ? IconIndicatorStyle(
                    iconData: orderDataIcons[index].icon,
                    iconSize: index < 5 ? 25 : 20,
                    color: index < 5 ? Colors.green : Colors.blue,
                  )
                : null,
            circleStyle: index >= 5
                ? CircleIndicatorStyle(
                    paintingStyle: PaintingStyle.stroke,
                    strokeWidth: 3,
                    radius: 25,
                    color: Colors.blue,
                  )
                : null,
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
          );
        },
      ),
    );
  }
}
