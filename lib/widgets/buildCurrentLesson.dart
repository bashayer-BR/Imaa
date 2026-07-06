import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
import 'package:imaa/widgets/Buttons.dart';
 Widget buildCurrentLesson(AppDimensions d) {
    return Container(
      padding: EdgeInsets.all(d.spaceM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.18),
            const Color(0xFF0099FF).withOpacity(0.10),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.35),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: BorderRadius.circular(d.radiusL),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.sign_language_rounded,
                    color: AppColors.primary, size: 40),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'أ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
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
                  'الدرس الحالي',
                  style: TextStyle(
                      color: AppColors.textHint, fontSize: d.fontXS),
                ),
                SizedBox(height: d.spaceXS),
                Text(
                  'الحروف الأبجدية - الدرس 1',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: d.fontM,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: d.spaceS),
                ClipRRect(
                  borderRadius: BorderRadius.circular(d.radiusXL),
                  child: LinearProgressIndicator(
                    value: 0.25,
                    minHeight: 6,
                    backgroundColor: AppColors.bgSurface,
                    valueColor:
                        const AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
                SizedBox(height: d.spaceXS),
                Text(
                  '25%',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: d.fontXS,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: d.spaceS),
                TealPressButton(
                  onTap: () {},
                  isGradient: true,
                  height: d.btnHeightSecond,
                  child: Text(
                    'متابعة الدرس',
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