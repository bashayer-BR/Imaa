import 'package:flutter/material.dart';
import 'package:imaa/classes/TagRow.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
import 'package:imaa/widgets/Buttons.dart';
import 'package:imaa/widgets/ChallengeCard.dart';
Widget buildSignQuiz(AppDimensions d) {
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