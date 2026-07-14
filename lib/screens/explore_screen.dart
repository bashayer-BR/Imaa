import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/buildBestSignsRow.dart';
import 'package:imaa/widgets/buildLessonsRow.dart';
import 'package:imaa/widgets/buildReferenceGrid.dart';
import 'package:imaa/widgets/buildSectionLabel.dart';
import 'package:imaa/widgets/cards.dart';

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
            buildLevelCard(d),
            SizedBox(height: d.spaceL),
            buildSectionLabel(d, 'الدروس المتاحة', null),
            SizedBox(height: d.spaceM),
            buildLessonsRow(d),
            SizedBox(height: d.spaceL),
            buildSectionLabel(d, 'مكتبة المراجع السريعة', null),
            SizedBox(height: d.spaceM),
            buildReferenceGrid(d),
            SizedBox(height: d.spaceL),
            buildSectionLabel(d, 'أفضل إشارات المستخدمين', 'اكتشف المزيد'),
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
}





