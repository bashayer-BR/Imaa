import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
 Widget buildTranslationInfo(AppDimensions d , TextEditingController _textCtrl) {
    return Container(
      padding: EdgeInsets.all(d.spaceM),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Arabic text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'النص',
                style: TextStyle(
                  color: AppColors.textHint,
                  fontSize: d.fontXS,
                ),
              ),
              SizedBox(height: d.spaceXS),
              Text(
                _textCtrl.text.isNotEmpty
                    ? _textCtrl.text
                    : '—',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: d.fontM,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          // Arrow
          Icon(
            Icons.arrow_back_rounded,
            color: AppColors.primary,
            size: d.iconM,
          ),

          // Sign label
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'إشارة',
                style: TextStyle(
                  color: AppColors.textHint,
                  fontSize: d.fontXS,
                ),
              ),
              SizedBox(height: d.spaceXS),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: d.spaceS,
                  vertical: d.spaceXS,
                ),
                decoration: BoxDecoration(
                  color: AppColors.glowTeal,
                  borderRadius: BorderRadius.circular(d.radiusS),
                ),
                child: Text(
                  'لغة الإشارة',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: d.fontXS,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }