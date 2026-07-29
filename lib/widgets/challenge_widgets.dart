import 'package:flutter/material.dart';
import 'package:imaa/classes/Avatar.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
import 'package:imaa/widgets/Buttons.dart';
import 'package:imaa/widgets/cards.dart';
Widget buildSpeedChallenge(AppDimensions d) {
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
  // Group challange
  Widget buildGroupChallenge(AppDimensions d) {
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
