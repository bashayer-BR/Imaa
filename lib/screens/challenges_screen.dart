import 'package:flutter/material.dart';
import 'package:imaa/classes/Avatar.dart';
import 'package:imaa/classes/TagRow.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/ChallengeCard.dart';
import 'package:imaa/widgets/teal_press_button.dart';

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
              _buildDailyChallenge(d),
              SizedBox(height: d.spaceM),
      
              // ── Speed challenge ────────────────────────
              _buildSpeedChallenge(d),
              SizedBox(height: d.spaceM),
      
              // ── Sign quiz ──────────────────────────────
              _buildSignQuiz(d),
              SizedBox(height: d.spaceM),
      
              // ── Group challenge ────────────────────────
              _buildGroupChallenge(d),
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

  // ── Daily challenge ───────────────────────────────────────

  Widget _buildDailyChallenge(AppDimensions d) {
    return ChallengeCard(
      d: d,
      gradient: [
        AppColors.primary.withOpacity(0.15),
        const Color(0xFF0099FF).withOpacity(0.08),
      ],
      borderColor: AppColors.primary.withOpacity(0.35),
      child: Row(
        children: [
          // Circular progress
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 72,
                  height: 72,
                  child: CircularProgressIndicator(
                    value: 0.6,
                    strokeWidth: 6,
                    backgroundColor: AppColors.bgSurface,
                    valueColor:
                        const AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
                Text(
                  '60%',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: d.fontM,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: d.spaceM),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تحدي الإشارات اليومي',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: d.fontM,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: d.spaceXS),
                TagRow(d: d, tags: ['تعلم 5 إشارات عائلية', 'صداقة']),
                SizedBox(height: d.spaceM),
                TealPressButton(
                  onTap: () {},
                  isGradient: true,
                  height: d.btnHeightSecond,
                  child: Text(
                    'ابدأ التحدي',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: d.btnFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Speed challenge ───────────────────────────────────────

  Widget _buildSpeedChallenge(AppDimensions d) {
    return ChallengeCard(
      d: d,
      gradient: [
        const Color(0xFF1DB954).withOpacity(0.12),
        const Color(0xFF0D7A37).withOpacity(0.06),
      ],
      borderColor: const Color(0xFF1DB954).withOpacity(0.3),
      child: Row(
        children: [
          // Icon
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1DB954), Color(0xFF0D7A37)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(d.radiusL),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1DB954).withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const Icon(
              Icons.speed_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),

          SizedBox(width: d.spaceM),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'سرعة الرد',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: d.fontM,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: d.spaceXS),
                Text(
                  'تعرف على 300 صورة في الفقرة',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: d.fontS,
                  ),
                ),
                SizedBox(height: d.spaceM),
                TealPressButton(
                  onTap: () {},
                  height: d.btnHeightSecond,
                  bgColor: const Color(0xFF1DB954).withOpacity(0.15),
                  borderColor: const Color(0xFF1DB954).withOpacity(0.4),
                  child: Text(
                    'ابدأ التحدي',
                    style: TextStyle(
                      color: const Color(0xFF1DB954),
                      fontSize: d.btnFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Sign quiz ─────────────────────────────────────────────

  Widget _buildSignQuiz(AppDimensions d) {
    return ChallengeCard(
      d: d,
      gradient: [
        const Color(0xFF9B59B6).withOpacity(0.12),
        const Color(0xFF6C3483).withOpacity(0.06),
      ],
      borderColor: const Color(0xFF9B59B6).withOpacity(0.3),
      child: Row(
        children: [
          // Icon
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF9B59B6), Color(0xFF6C3483)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(d.radiusL),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF9B59B6).withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const Icon(
              Icons.sign_language_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),

          SizedBox(width: d.spaceM),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تخمين الإشارة',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: d.fontM,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: d.spaceXS),
                TagRow(d: d, tags: ['سهل', 'متوسط', 'محال']),
                SizedBox(height: d.spaceM),
                TealPressButton(
                  onTap: () {},
                  height: d.btnHeightSecond,
                  bgColor: const Color(0xFF9B59B6).withOpacity(0.15),
                  borderColor: const Color(0xFF9B59B6).withOpacity(0.4),
                  child: Text(
                    'ابدأ التحدي',
                    style: TextStyle(
                      color: const Color(0xFF9B59B6),
                      fontSize: d.btnFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Group challenge ───────────────────────────────────────

  Widget _buildGroupChallenge(AppDimensions d) {
    return ChallengeCard(
      d: d,
      gradient: [
        const Color(0xFFFF8C00).withOpacity(0.12),
        const Color(0xFFCC5500).withOpacity(0.06),
      ],
      borderColor: const Color(0xFFFF8C00).withOpacity(0.3),
      child: Row(
        children: [
          // Avatars stack
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              children: [
                Avatar(color: const Color(0xFF00D4C8), top: 0,  left: 0),
                Avatar(color: const Color(0xFF0099FF), top: 0,  left: 20),
                Avatar(color: const Color(0xFFFF8C00), top: 20, left: 10),
                // count badge
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF8C00),
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.bgCard, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        '+5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: d.fontXS - 1,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: d.spaceM),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تحدي المجموعة',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: d.fontM,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: d.spaceXS),
                Text(
                  'هدف: الإشارات المتشاركة',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: d.fontS,
                  ),
                ),
                SizedBox(height: d.spaceM),
                TealPressButton(
                  onTap: () {},
                  height: d.btnHeightSecond,
                  bgColor: const Color(0xFFFF8C00).withOpacity(0.15),
                  borderColor: const Color(0xFFFF8C00).withOpacity(0.4),
                  child: Text(
                    'ابدأ التحدي',
                    style: TextStyle(
                      color: const Color(0xFFFF8C00),
                      fontSize: d.btnFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  _ChallengeCard
// ══════════════════════════════════════════════════════════════


