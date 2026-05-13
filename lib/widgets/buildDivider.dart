import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';

Widget buildDivider(AppDimensions d) {
    return Row(
      children: [
        const Expanded(
            child: Divider(color: AppColors.divider, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: d.spaceS),
          child: Text(
            'أو تابع مع',
            style: TextStyle(
              color: AppColors.textHint,
              fontSize: d.fontS,
            ),
          ),
        ),
        const Expanded(
            child: Divider(color: AppColors.divider, thickness: 1)),
      ],
    );
  }