import 'package:flutter/material.dart';
import 'package:imaa/classes/BestSign.dart';
import 'package:imaa/classes/Lesson.dart';
import 'package:imaa/classes/Reference.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/buildBestSignsRow.dart';
import 'package:imaa/widgets/buildLessonsRow.dart';
import 'package:imaa/widgets/buildReferenceGrid.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final d  = AppDim.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: d.hPad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: d.spaceM),
            _buildHeader(d),
            SizedBox(height: d.spaceL),
            _buildLevelCard(d),
            SizedBox(height: d.spaceL),
            _buildSectionLabel(d, 'الدروس المتاحة', null),
            SizedBox(height: d.spaceM),
            buildLessonsRow(d),
            SizedBox(height: d.spaceL),
            _buildSectionLabel(d, 'مكتبة المراجع السريعة', null),
            SizedBox(height: d.spaceM),
            buildReferenceGrid(d),
            SizedBox(height: d.spaceL),
            _buildSectionLabel(d, 'أفضل إشارات المستخدمين', 'اكتشف المزيد'),
            SizedBox(height: d.spaceM),
            buildBestSignsRow(d),
            SizedBox(height: d.spaceXL),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AppDimensions d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('استكشف', style: TextStyle(color: AppColors.textPrimary, fontSize: d.fontXL, fontWeight: FontWeight.w900)),
            SizedBox(height: d.spaceXS),
            Text('تعلّم وتطور يومياً', style: TextStyle(color: AppColors.textSecondary, fontSize: d.fontS)),
          ],
        ),
        Container(
          width: 42, height: 42,
          decoration: BoxDecoration(color: AppColors.bgSurface, borderRadius: BorderRadius.circular(d.radiusM), border: Border.all(color: AppColors.divider)),
          child: const Icon(Icons.search_rounded, color: AppColors.textSecondary, size: 20),
        ),
      ],
    );
  }

  Widget _buildLevelCard(AppDimensions d) {
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

  Widget _buildSectionLabel(AppDimensions d, String title, String? action) {
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
}





