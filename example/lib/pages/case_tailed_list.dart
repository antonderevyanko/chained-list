import 'package:chained_list/chained_list.dart';
import 'package:example/data/order_mock_data.dart';
import 'package:example/data/tailed_mock_data.dart';
import 'package:flutter/material.dart';

class CaseTailedList extends StatelessWidget {
  const CaseTailedList({super.key});

  @override
  Widget build(BuildContext context) {
    List<DoubleChainedTile?> resultList = [];
    for (var i = 0; i < tailedItems.length; i++) {
      final item = tailedItems[i];
      resultList.add(
        item.convertToTiles(
          index: i,
          allTails: tailedItems,
          child: getByIndex(i),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Icons + tailed list')),
      body: ListView(children: resultList.nonNulls.toList()),
    );
  }

  Widget getByIndex(int index) => Column(
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
  );
}
