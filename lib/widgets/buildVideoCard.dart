import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';

Widget buildVideoCard(AppDimensions d,bool isPlaying,AnimationController pulseCtrl,void Function()? onPlay) {
    final cardH = d.screenW * 0.55;
    return Container(
      width: double.infinity,
      height: cardH,
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(color: AppColors.divider),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(d.radiusL),
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.08),
                  const Color(0xFF0099FF).withOpacity(0.06),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),

          // Avatar placeholder
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: cardH * 0.55,
                height: cardH * 0.55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bgSurface,
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.sign_language_rounded,
                  color: AppColors.primary.withOpacity(0.5),
                  size: cardH * 0.22,
                ),
              ),
            ],
          ),

          // Play button
          AnimatedBuilder(
            animation: pulseCtrl,
            builder: (_, __) => GestureDetector(
              onTap: onPlay,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: AppColors.primaryGradient,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(
                          0.4 + 0.3 * pulseCtrl.value),
                      blurRadius: 14 + 6 * pulseCtrl.value,
                      spreadRadius: 1 + 2 * pulseCtrl.value,
                    ),
                  ],
                ),
                child: Icon(
                  isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),

          // Speed control
          Positioned(
            bottom: d.spaceM,
            left: d.spaceM,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: d.spaceS,
                  vertical: d.spaceXS,
                ),
                decoration: BoxDecoration(
                  color: AppColors.bgDark.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(d.radiusXL),
                  border: Border.all(
                      color: AppColors.primary.withOpacity(0.4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.speed_rounded,
                        color: AppColors.primary, size: 14),
                    SizedBox(width: d.spaceXS),
                    Text(
                      '1x',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: d.fontXS,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Repeat button
          Positioned(
            bottom: d.spaceM,
            right: d.spaceM,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.bgDark.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(d.radiusS),
                  border: Border.all(
                      color: AppColors.divider),
                ),
                child: Icon(
                  Icons.replay_rounded,
                  color: AppColors.textSecondary,
                  size: d.iconS,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }