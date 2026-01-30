import 'package:chained_list/chained_list.dart';
import 'package:flutter/material.dart';

class DoubleChainedUsage extends StatelessWidget {
  const DoubleChainedUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Startup (Dual lines)')),
      body: ListView.builder(
        itemCount: _dummyTimelineItems.length,
        itemBuilder: (context, index) {
          return DoubleChainedTile(
            topLineStyle: _dummyTimelineItems[index].topLine,
            bottomLineStyle: _dummyTimelineItems[index].bottonLine,
            circleStyle: CircleIndicatorStyle(
              paintingStyle: PaintingStyle.fill,
              radius: 12,
              color: Colors.amber,
              strokeWidth: 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _dummyTimelineItems[index].text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  _dummyTimelineItems[index].description,
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

class _ExampleItem {
  _ExampleItem({
    required this.text,
    required this.description,
    required this.topLine,
    required this.bottonLine,
  });
  final String text;
  final String description;
  final ChainLineStyle topLine;
  final ChainLineStyle bottonLine;
}

final List<_ExampleItem> _dummyTimelineItems = [
  _ExampleItem(
    text: "The 'Aha!' Moment",
    description:
        "Woke up at 3 AM with an idea for a decentralized cat-sitting app.",
    topLine: ChainLineStyle(color: Colors.transparent),
    bottonLine: ChainLineStyle(color: Colors.green, strokeWidth: 3),
  ),
  _ExampleItem(
    text: "Market Research",
    description:
        "Found out that cats actually don't like strangers. Pivoting to 'Cat Entertainment'.",
    topLine: ChainLineStyle(color: Colors.green, strokeWidth: 3),
    bottonLine: ChainLineStyle(color: Colors.green, strokeWidth: 3),
  ),
  _ExampleItem(
    text: "Founding Team",
    description:
        "Recruited a CTO who works for pizza and a Designer who loves minimalism.",
    topLine: ChainLineStyle(color: Colors.green, strokeWidth: 3),
    bottonLine: ChainLineStyle(
      color: Colors.orange,
      dashParams: DashParams(dashHeight: 6, dashGap: 4),
    ),
  ),
  _ExampleItem(
    text: "MVP Development",
    description:
        "Coding in a garage. The line between coffee and blood is blurring.",
    topLine: ChainLineStyle(
      color: Colors.orange,
      dashParams: DashParams(dashHeight: 6, dashGap: 4),
    ),
    bottonLine: ChainLineStyle(
      color: Colors.orange,
      dashParams: DashParams(dashHeight: 6, dashGap: 4),
    ),
  ),
  _ExampleItem(
    text: "First Alpha Crash",
    description: "The app crashed because a cat stepped on the server. Fixed.",
    topLine: ChainLineStyle(
      color: Colors.orange,
      dashParams: DashParams(dashHeight: 6, dashGap: 4),
    ),
    bottonLine: ChainLineStyle(color: Colors.red, strokeWidth: 3),
  ),
  _ExampleItem(
    text: "Closed Beta",
    description: "100 brave users are testing the laser-pointer feature.",
    topLine: ChainLineStyle(color: Colors.red, strokeWidth: 3),
    bottonLine: ChainLineStyle(color: Colors.blue, strokeWidth: 3),
  ),
  _ExampleItem(
    text: "Seed Round Funding",
    description:
        "Pitching to VCs. Used the word 'Blockchain' 47 times. It worked.",
    topLine: ChainLineStyle(color: Colors.blue, strokeWidth: 3),
    bottonLine: ChainLineStyle(color: Colors.blue, strokeWidth: 3),
  ),
  _ExampleItem(
    text: "Hiring Spree",
    description: "From 3 people to 30. We now have a Chief Happiness Officer.",
    topLine: ChainLineStyle(color: Colors.blue, strokeWidth: 3),
    bottonLine: ChainLineStyle(
      color: Colors.purple,
      dashParams: DashParams(dashHeight: 10, dashGap: 5),
    ),
  ),
  _ExampleItem(
    text: "Global Marketing",
    description: "Billboards in Times Square. Cats everywhere.",
    topLine: ChainLineStyle(
      color: Colors.purple,
      dashParams: DashParams(dashHeight: 10, dashGap: 5),
    ),
    bottonLine: ChainLineStyle(
      color: Colors.purple,
      dashParams: DashParams(dashHeight: 10, dashGap: 5),
    ),
  ),
  _ExampleItem(
    text: "Feature Expansion",
    description:
        "Adding AI to predict when a cat is about to knock a glass off the table.",
    topLine: ChainLineStyle(
      color: Colors.purple,
      dashParams: DashParams(dashHeight: 10, dashGap: 5),
    ),
    bottonLine: ChainLineStyle(color: Colors.deepPurple, strokeWidth: 3),
  ),
  _ExampleItem(
    text: "Series A",
    description: "The big leagues. We have an office with a slide now.",
    topLine: ChainLineStyle(color: Colors.deepPurple, strokeWidth: 3),
    bottonLine: ChainLineStyle(color: Colors.deepPurple, strokeWidth: 3),
  ),
  _ExampleItem(
    text: "Monetization",
    description: "Finally charging for premium cat emojis. Revenue is up!",
    topLine: ChainLineStyle(color: Colors.deepPurple, strokeWidth: 3),
    bottonLine: ChainLineStyle(
      color: Colors.grey,
      dashParams: DashParams(dashHeight: 4, dashGap: 2),
    ),
  ),
  _ExampleItem(
    text: "Regulatory Hurdles",
    description:
        "The government wants to know if cats are 'employees'. Lawyer time.",
    topLine: ChainLineStyle(
      color: Colors.grey,
      dashParams: DashParams(dashHeight: 4, dashGap: 2),
    ),
    bottonLine: ChainLineStyle(color: Colors.amber, strokeWidth: 4),
  ),
  _ExampleItem(
    text: "The IPO",
    description: "Going public. The CEO wore a cat-ear headband to the NYSE.",
    topLine: ChainLineStyle(color: Colors.amber, strokeWidth: 4),
    bottonLine: ChainLineStyle(color: Colors.amber, strokeWidth: 4),
  ),
  _ExampleItem(
    text: "Unicorn Status",
    description: "Valued at \$1 Billion. Our cats are officially legendary.",
    topLine: ChainLineStyle(color: Colors.amber, strokeWidth: 4),
    bottonLine: ChainLineStyle(color: Colors.transparent),
  ),
];
