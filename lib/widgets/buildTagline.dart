import 'package:flutter/material.dart';
import 'package:imaa/core/theme/theme.dart';
 
Widget buildTagline({required double fontSize}) {
  return Text(
    'أهلًا بك في جسر التواصل الإنساني الذكي',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.textSecondary,
      fontSize: fontSize,
      height: 1.6,
    ),
  );
}