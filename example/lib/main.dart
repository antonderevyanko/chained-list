import 'package:chained_list/chained_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TimelineScreen(),
    );
  }
}

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'Ordered',
      'Processed',
      'Shipped',
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
            color: index < 3 ? Colors.green : Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  'Update received at 12:00 PM',
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
