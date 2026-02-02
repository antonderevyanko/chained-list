import 'package:flutter/material.dart';

final orderItems = [
  'Ordered',
  'Waiting for payment',
  'Payed',
  'Processed',
  'Shipped to local carrier',
  'Arrived to logistic center',
  'Out for delivery',
  'Delivered',
];

class ItemData {
  final String text;
  final IconData icon;

  ItemData(this.text, this.icon);
}

final orderDataIcons = [
  ItemData('Ordered', Icons.check_circle),
  ItemData('Waiting for payment', Icons.check_circle),
  ItemData('Payed', Icons.check_circle),
  ItemData('Processed', Icons.check_circle),
  ItemData('Shipped to local carrier', Icons.check_circle),
  ItemData('Arrived to logistic center', Icons.arrow_forward_rounded),
  ItemData('Out for delivery', Icons.arrow_forward_rounded),
  ItemData('Delivered', Icons.question_mark_rounded),
];
