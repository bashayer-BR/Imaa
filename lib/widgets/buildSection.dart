import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildSection(
    AppDimensions d, {
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Row(
          children: [
            Icon(icon, color: AppColors.primary, size: d.iconS),
            SizedBox(width: d.spaceS),
            Text(
              title,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: d.fontM,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(height: d.spaceS),

        // Content card
        Container(
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(d.radiusL),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }