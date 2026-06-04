import 'package:flutter/material.dart';
import 'package:imaa/classes/BestSign.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildBestSignsRow(AppDimensions d) {
    final signs = [
      BestSign('أفهم عميق', 'إشارة التفاهم'),
      BestSign('تحدي جديد', 'إشارة التحدي'),
      BestSign('فهم عميق',  'إشارة الفهم'),
    ];

    final cardW = (d.screenW * 0.32).clamp(105.0, 140.0);
    final cardH = (d.screenH * 0.20).clamp(135.0, 165.0);

    return SizedBox(
      height: cardH,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: signs.length,
        separatorBuilder: (_, __) => SizedBox(width: d.spaceM),
        itemBuilder: (_, i) {
          final s = signs[i];
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: cardW,
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                borderRadius: BorderRadius.circular(d.radiusL),
                border: Border.all(color: AppColors.divider),
              ),
              child: Padding(
                padding: EdgeInsets.all(d.spaceS),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: AppColors.bgSurface, borderRadius: BorderRadius.circular(d.radiusM)),
                        child: Center(child: Icon(Icons.sign_language_rounded, color: AppColors.primary, size: d.iconL)),
                      ),
                    ),
                    SizedBox(height: d.spaceXS),
                    Text(s.label, textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.textPrimary, fontSize: d.fontXS, fontWeight: FontWeight.w700)),
                    Text(s.sublabel, textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.textHint, fontSize: d.fontXS - 1)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }