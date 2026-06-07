import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';

Widget buildSectionLabel(AppDimensions d, String title, String? action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: AppColors.textPrimary, fontSize: d.fontL, fontWeight: FontWeight.w800)),
        if (action != null)
          GestureDetector(
            onTap: () {},
            child: Text(action, style: TextStyle(color: AppColors.primary, fontSize: d.fontS, fontWeight: FontWeight.w600)),
          ),
      ],
    );
  }