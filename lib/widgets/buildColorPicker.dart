import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildColorPicker(AppDimensions d) {
    final colors = [
      AppColors.primary,
      const Color(0xFF0099FF),
      const Color(0xFF9B59B6),
      const Color(0xFF1DB954),
      const Color(0xFFFF8C00),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: d.spaceM, vertical: d.spaceM),
      child: Row(
        children: [
          Text(
            'لون التطبيق',
            style: TextStyle(color: AppColors.textSecondary, fontSize: d.fontM),
          ),
          SizedBox(width: d.spaceM),
          Row(
            children: colors.map((c) {
              final isSelected = c == AppColors.primary;
              return Padding(
                padding: EdgeInsets.only(left: d.spaceXS),
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: c,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: Colors.white, width: 2)
                        : null,
                    boxShadow: isSelected
                        ? [BoxShadow(color: c.withOpacity(0.5), blurRadius: 6)]
                        : [],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }