import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/buildDailyChallenge.dart';
import 'package:imaa/widgets/buildGroupChallenge.dart';
import 'package:imaa/widgets/buildSignQuiz.dart';
import 'package:imaa/widgets/buildSpeedChallenge.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final d  = AppDim.of(context);
    final mq = MediaQuery.of(context);

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
      
              // ── Header ─────────────────────────────────
              _buildHeader(d),
              SizedBox(height: d.spaceL),
      
              // ── Daily challenge ────────────────────────
              buildDailyChallenge(d),
              SizedBox(height: d.spaceM),
      
              // ── Speed challenge ────────────────────────
              buildSpeedChallenge(d),
              SizedBox(height: d.spaceM),
      
              // ── Sign quiz ──────────────────────────────
              buildSignQuiz(d),
              SizedBox(height: d.spaceM),
      
              // ── Group challenge ────────────────────────
              buildGroupChallenge(d),
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
              'تحديات',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: d.fontXL,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: d.spaceXS),
            Text(
              'اختبر مهاراتك يومياً',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: d.fontS,
              ),
            ),
          ],
        ),
        // Trophy icon
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFFD700), Color(0xFFFF8C00)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(d.radiusM),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFD700).withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: const Icon(
            Icons.emoji_events_rounded,
            color: Colors.white,
            size: 22,
          ),
        ),
      ],
    );
  }


}

