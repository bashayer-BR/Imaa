import 'package:flutter/material.dart';
import 'package:imaa/classes/BestSign.dart';
import 'package:imaa/classes/Lesson.dart';
import 'package:imaa/classes/Reference.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/buildBestSignsRow.dart';

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
            _buildLessonsRow(d),
            SizedBox(height: d.spaceL),
            _buildSectionLabel(d, 'مكتبة المراجع السريعة', null),
            SizedBox(height: d.spaceM),
            _buildReferenceGrid(d),
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

  Widget _buildLessonsRow(AppDimensions d) {
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

  Widget _buildReferenceGrid(AppDimensions d) {
    final refs = [
      Reference('تراكيب القواعد',     Icons.account_tree_rounded,  [const Color(0xFF1DB954), const Color(0xFF0D7A37)]),
      Reference('المفردات التخصصية', Icons.library_books_rounded,  [const Color(0xFF0099FF), const Color(0xFF005BB5)]),
    ];

    return Row(
      children: List.generate(refs.length, (i) {
        final r = refs[i];
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i == 0 ? 0 : d.spaceM / 2, left: i == 1 ? 0 : d.spaceM / 2),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: (d.screenH * 0.14).clamp(100.0, 125.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: r.gradient, begin: Alignment.topRight, end: Alignment.bottomLeft),
                  borderRadius: BorderRadius.circular(d.radiusL),
                  boxShadow: [BoxShadow(color: r.gradient.first.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Padding(
                  padding: EdgeInsets.all(d.spaceM),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(d.radiusS)),
                        child: Icon(r.icon, color: Colors.white, size: d.iconM),
                      ),
                      Text(r.label, style: TextStyle(color: Colors.white, fontSize: d.fontS, fontWeight: FontWeight.w800, height: 1.3)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  
}





