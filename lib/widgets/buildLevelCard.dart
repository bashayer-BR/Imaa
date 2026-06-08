import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';

Widget buildLevelCard(AppDimensions d) {
    return Container(
      padding: EdgeInsets.all(d.spaceM),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.primary.withOpacity(0.18), const Color(0xFF0099FF).withOpacity(0.10)], begin: Alignment.topRight, end: Alignment.bottomLeft),
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 1.2),
      ),
      child: Row(
        children: [
          Container(
            width: 60, height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(colors: AppColors.primaryGradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
              boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 10)],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('2', style: TextStyle(color: Colors.white, fontSize: d.fontL, fontWeight: FontWeight.w900)),
                Text('مستوى', style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: d.fontXS - 1)),
              ],
            ),
          ),
          SizedBox(width: d.spaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('مستوى 2: التعبيرات المعقدة', style: TextStyle(color: AppColors.textPrimary, fontSize: d.fontM, fontWeight: FontWeight.w800)),
                SizedBox(height: d.spaceS),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(d.radiusXL),
                        child: LinearProgressIndicator(value: 0.65, minHeight: 7, backgroundColor: AppColors.bgSurface, valueColor: const AlwaysStoppedAnimation(AppColors.primary)),
                      ),
                    ),
                    SizedBox(width: d.spaceS),
                    Text('65%', style: TextStyle(color: AppColors.primary, fontSize: d.fontS, fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }