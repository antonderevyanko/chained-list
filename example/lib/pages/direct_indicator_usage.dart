import 'package:chained_list/chained_list.dart';
import 'package:flutter/material.dart';

class DirectChainIndicatorUsage extends StatelessWidget {
  const DirectChainIndicatorUsage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Custom ChainIndicator example')),
    body: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Example of custom item usage',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 100,
                child: ChainedIndicator(
                  indicatorWidth: 25,
                  bottomLineStyle: ChainLineStyle(color: Colors.amber),
                  iconStyle: IconIndicatorStyle(
                    iconData: Icons.catching_pokemon,
                    iconSize: 25,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'indicator can be placed in any widge. It\'s now your responsibility to keep it size and paddings consistent',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 190,
                child: ChainedIndicator(
                  indicatorWidth: 25,
                  topLineStyle: ChainLineStyle(color: Colors.amber),
                  iconStyle: IconIndicatorStyle(
                    iconData: Icons.catching_pokemon,
                    iconSize: 25,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
