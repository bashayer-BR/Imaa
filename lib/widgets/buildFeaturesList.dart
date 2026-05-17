import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildFeaturesList(AppDimensions d) {
    final features = [
      (Icons.history_rounded,        'سجل الترجمات السابقة'),
      (Icons.bookmark_outline_rounded,'حفظ الإشارات المفضلة'),
      (Icons.sync_rounded,           'مزامنة البيانات عبر الأجهزة'),
      (Icons.insights_rounded,       'إحصائيات الاستخدام'),
    ];
 
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: List.generate(features.length, (i) {
          final (icon, label) = features[i];
          final isLast = i == features.length - 1;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: d.spaceM,
                  vertical: d.spaceS + 2,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.glowTeal,
                        borderRadius: BorderRadius.circular(d.radiusS),
                      ),
                      child: Icon(icon, color: AppColors.primary, size: 18),
                    ),
                    SizedBox(width: d.spaceM),
                    Expanded(
                      child: Text(
                        label,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: d.fontM,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.textHint,
                      size: 16,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                const Divider(
                  color: AppColors.divider,
                  thickness: 1,
                  height: 1,
                ),
            ],
          );
        }),
      ),
    );
}
