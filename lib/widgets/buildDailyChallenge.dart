import 'package:flutter/material.dart';
import 'package:imaa/classes/TagRow.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
import 'package:imaa/widgets/ChallengeCard.dart';
import 'package:imaa/widgets/Teal_press_button.dart';
Widget buildDailyChallenge(AppDimensions d) {
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