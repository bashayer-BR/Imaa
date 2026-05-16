import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';

Widget buildProgressCard(AppDimensions d) {
    return Container(
      padding: EdgeInsets.all(d.spaceM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.18),
            const Color(0xFF0099FF).withOpacity(0.10),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(d.radiusL),
        border:
            Border.all(color: AppColors.primary.withOpacity(0.3), width: 1.2),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 64,
                  height: 64,
                  child: CircularProgressIndicator(
                    value: 9 / 10,
                    strokeWidth: 5,
                    backgroundColor: AppColors.bgSurface,
                    valueColor:
                        const AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
                Text('9/10',
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: d.fontS,
                        fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          SizedBox(width: d.spaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('تقدمك اليومي',
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: d.fontM,
                        fontWeight: FontWeight.w800)),
                SizedBox(height: d.spaceXS),
                Text('المستوى: مبتدئ (ضيف)',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: d.fontS,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: d.spaceXS),
                Text('تعلمت 4 إشارات اليوم، كمّل!',
                    style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: d.fontXS)),
              ],
            ),
          ),
        ],
      ),
    );
  }