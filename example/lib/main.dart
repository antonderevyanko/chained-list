import 'package:chained_list/chained_list.dart';
import 'package:example/data/order_mock_data.dart';
import 'package:example/data/startup_mock_data.dart';
import 'package:example/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chained list example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

class CaseCircles extends StatelessWidget {
  const CaseCircles({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Order Tracking (Circles)')),
    body: ListView.builder(
      itemCount: orderItems.length,
      itemBuilder: (context, index) {
        return ChainedTile(
          tileIndex: index,
          totalCount: orderItems.length,
          indicatorWidth: 40,
          lineStyle: ChainLineStyle(
            color: index < 5 ? Colors.green : Colors.blue,
            strokeWidth: 4,
          ),
          circleStyle: CircleIndicatorStyle(
            paintingStyle: index < 5
                ? PaintingStyle.fill
                : PaintingStyle.stroke,
            radius: 22,
            color: index < 5 ? Colors.green : Colors.blue,
            strokeWidth: 4,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderItems[index],
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

class DoubleChainedUsage extends StatelessWidget {
  const DoubleChainedUsage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
