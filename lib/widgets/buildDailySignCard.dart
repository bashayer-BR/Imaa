import 'package:imaa/core/AppDim.dart';
import 'package:flutter/material.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildDailySignCard(AppDimensions d) {
    return Container(
      padding: EdgeInsets.all(d.spaceM),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.glowTeal,
              borderRadius: BorderRadius.circular(d.radiusM),
            ),
            child: const Icon(Icons.sign_language_rounded,
                color: AppColors.primary, size: 26),
          ),
          SizedBox(width: d.spaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('تعلم إشارة اليوم:',
                    style: TextStyle(
                        color: AppColors.textHint, fontSize: d.fontXS)),
                SizedBox(height: d.spaceXS),
                Text('كيف حالك؟ 🤟',
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: d.fontM,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.primary, size: 16),
        ],
      ),
    );
  }