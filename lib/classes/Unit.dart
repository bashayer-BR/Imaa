import 'package:flutter/material.dart';
class Unit {
  final String label;
  final IconData icon;
  final List<Color> gradient;
  final double progress;
  final bool isUnlocked;

  const Unit({
    required this.label,
    required this.icon,
    required this.gradient,
    required this.progress,
    required this.isUnlocked,
  });
}