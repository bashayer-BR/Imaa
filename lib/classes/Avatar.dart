import 'package:flutter/material.dart';
import 'package:imaa/core/theme/app_colors.dart';
class Avatar extends StatelessWidget {
  final Color color;
  final double top;
  final double left;

  const Avatar({
    required this.color,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.bgCard, width: 2),
        ),
        child: const Icon(Icons.person, color: Colors.white, size: 16),
      ),
    );
  }}