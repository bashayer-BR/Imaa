import 'package:flutter/material.dart';
import 'package:imaa/classes/BestSign.dart';
import 'package:imaa/classes/Lesson.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildToggleRow(
    AppDimensions d,
    String label,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: d.spaceM, vertical: d.spaceS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: AppColors.textSecondary, fontSize: d.fontM),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
            activeTrackColor: AppColors.primary.withOpacity(0.3),
            inactiveThumbColor: AppColors.textHint,
            inactiveTrackColor: AppColors.bgSurface,
          ),
        ],
      ),
    );
  }
  // lesson row
  Widget buildLessonsRow(AppDimensions d) {
    final lessons = [
      Lesson('1', 'إيماءات المشاعر الدقيقة',        Icons.sentiment_satisfied_alt_rounded, [const Color(0xFF00D4C8), const Color(0xFF0099CC)]),
      Lesson('2', 'الإشارات الانطباطية الشائعة',    Icons.sign_language_rounded,           [const Color(0xFF0099FF), const Color(0xFF005BB5)]),
      Lesson('3', 'حكي القصص بالإشارة',              Icons.menu_book_rounded,               [const Color(0xFF9B59B6), const Color(0xFF6C3483)]),
      Lesson('4', 'التعبيرات اليومية',               Icons.wb_sunny_outlined,               [const Color(0xFFFF8C00), const Color(0xFFCC5500)]),
    ];

    final cardW = (d.screenW * 0.36).clamp(120.0, 155.0);
    final cardH = (d.screenH * 0.22).clamp(150.0, 185.0);

    return SizedBox(
      height: cardH,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: lessons.length,
        separatorBuilder: (_, __) => SizedBox(width: d.spaceM),
        itemBuilder: (_, i) {
          final l = lessons[i];
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: cardW,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: l.gradient, begin: Alignment.topRight, end: Alignment.bottomLeft),
                borderRadius: BorderRadius.circular(d.radiusL),
                boxShadow: [BoxShadow(color: l.gradient.first.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Padding(
                padding: EdgeInsets.all(d.spaceM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 28, height: 28,
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.25), borderRadius: BorderRadius.circular(d.radiusS)),
                      child: Center(child: Text(l.number, style: TextStyle(color: Colors.white, fontSize: d.fontS, fontWeight: FontWeight.w900))),
                    ),
                    SizedBox(height: d.spaceS),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(d.radiusM)),
                        child: Icon(l.icon, color: Colors.white, size: d.iconM),
                      ),
                    ),
                    SizedBox(height: d.spaceS),
                    Text(l.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: d.fontXS, fontWeight: FontWeight.w700, height: 1.3)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  //  Best Signs Row
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
  //  arrow row
  Widget buildArrowRow(
    AppDimensions d,
    IconData icon,
    String label,
    String subtitle,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: d.spaceM, vertical: d.spaceM),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.glowTeal,
                borderRadius: BorderRadius.circular(d.radiusS),
              ),
              child: Icon(icon, color: AppColors.primary, size: d.iconS),
            ),
            SizedBox(width: d.spaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: d.fontM,
                    ),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: d.fontXS,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
            const Icon(Icons.arrow_back_ios_new_rounded,
                color: AppColors.textHint, size: 14),
          ],
        ),
      ),
    );
  }