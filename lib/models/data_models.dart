
import 'package:flutter/material.dart';

class BottomTabs {
  final IconData icon;
  final void Function() action;

  BottomTabs({required this.icon, required this.action});
}

class ShopItem {
  final String name;
  final String price;
  final String category;
  final String image;
  final String description;
  final String tag;

  ShopItem({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
    required this.tag,
  });
}
