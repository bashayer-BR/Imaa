import 'package:flutter/material.dart';

class GridItem {
  final IconData icon;
  final String label;
  final String sublabel;
  final List<Color> gradient;
  final void Function()? onTap;
  const GridItem(this.icon, this.label, this.sublabel, this.gradient, {required this.onTap});
}