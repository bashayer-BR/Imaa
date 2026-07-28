import 'package:flutter/material.dart';
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