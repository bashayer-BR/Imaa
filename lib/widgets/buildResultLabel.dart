import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildResultLabel(AppDimensions d) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: d.spaceS),
        Text(
          'نتيجة الترجمة',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: d.fontL,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }