import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/buildCurrentLesson.dart';
import 'package:imaa/widgets/grids.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final d = AppDim.of(context);

    return Scaffold(
      body: Directionality(
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
              buildCurrentLesson(d),
              SizedBox(height: d.spaceL),
              Text(
                'الوحدات',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: d.fontL,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: d.spaceM),
              buildUnitsGrid(d),
              SizedBox(height: d.spaceXL),
            ],
          ),
        ),
      ),
    );
  }

  // ── Header ───────────────────────────────────────────────

  Widget _buildHeader(AppDimensions d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تعلّم',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: d.fontXL,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: d.spaceXS),
            Text(
              'دروس يومية خطوة بخطوة',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: d.fontS,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: d.spaceM,
            vertical: d.spaceXS,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF8C00), Color(0xFFCC5500)],
            ),
            borderRadius: BorderRadius.circular(d.radiusXL),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF8C00).withOpacity(0.3),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.local_fire_department_rounded,
                  color: Colors.white, size: 16),
              SizedBox(width: d.spaceXS),
              Text(
                '7 أيام',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: d.fontS,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



