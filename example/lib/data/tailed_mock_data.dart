import 'package:chained_list/chained_list.dart';
import 'package:flutter/material.dart';

final tailedItems = [
  TailData(
    iconStyle: IconIndicatorStyle(
      iconSize: 30,
      color: Colors.brown,
      iconData: Icons.add_circle_outline,
    ),
    lineStyle: ChainLineStyle(color: Colors.brown),
    indicatorWidth: 50,
  ),
  TailData(
    iconStyle: IconIndicatorStyle(
      iconSize: 30,
      color: Colors.blueGrey,
      iconData: Icons.flag_circle,
    ),
    lineStyle: ChainLineStyle(color: Colors.blueGrey),
    indicatorWidth: 50,
  ),
  TailData(
    iconStyle: IconIndicatorStyle(
      iconSize: 30,
      color: Colors.blueGrey,
      iconData: Icons.add_circle,
    ),
    lineStyle: ChainLineStyle(color: Colors.blueGrey),
    indicatorWidth: 50,
  ),
  TailData(
    iconStyle: IconIndicatorStyle(
      iconSize: 30,
      color: Colors.green,
      iconData: Icons.circle_notifications,
    ),
    lineStyle: ChainLineStyle(color: Colors.green),
    indicatorWidth: 50,
  ),
  TailData(
    iconStyle: IconIndicatorStyle(
      iconSize: 30,
      color: Colors.purple,
      iconData: Icons.stop_circle_sharp,
    ),
    lineStyle: ChainLineStyle(color: Colors.purple),
    indicatorWidth: 50,
  ),
];