import 'package:chained_list/chained_list.dart';
import 'package:example/data/startup_mock_data.dart';
import 'package:flutter/material.dart';

class DoubleChainedUsage extends StatelessWidget {
  const DoubleChainedUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Startup (Dual lines)')),
      body: ListView.builder(
        itemCount: dummyTimelineItems.length,
        itemBuilder: (context, index) {
          return DoubleChainedTile(
            topLineStyle: dummyTimelineItems[index].topLine,
            bottomLineStyle: dummyTimelineItems[index].bottonLine,
            circleStyle: CircleIndicatorStyle(
              paintingStyle: PaintingStyle.fill,
              radius: 12,
              color: Colors.amber,
              strokeWidth: 2,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dummyTimelineItems[index].text,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    dummyTimelineItems[index].description,
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
