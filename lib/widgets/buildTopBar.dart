import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';

Widget buildTopBar(BuildContext context, AppDimensions d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الملف الشخصي',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: d.fontL,
            fontWeight: FontWeight.w800,
          ),
        ),
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.bgSurface,
            borderRadius: BorderRadius.circular(d.radiusM),
            border: Border.all(color: AppColors.divider),
          ),
          child: const Icon(
            Icons.settings_outlined,
            color: AppColors.textSecondary,
            size: 20,
          ),
        ),
      ],
    );
  }