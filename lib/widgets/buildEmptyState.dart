import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';

Widget buildEmptyState(AppDimensions d) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(d.spaceXL),
      child: Column(
        children: [
          Icon(
            Icons.sign_language_outlined,
            color: AppColors.textHint.withOpacity(0.4),
            size: 64,
          ),
          SizedBox(height: d.spaceM),
          Text(
            'أدخل نصًا وانقر ترجمة\nلعرض الإشارة المقابلة',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textHint,
              fontSize: d.fontM,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
