import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';

Widget buildHeader(AppDimensions d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('أهلاً بك، ضيفنا العزيز! 👋',
                style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: d.fontL,
                    fontWeight: FontWeight.w900)),
            SizedBox(height: d.spaceXS),
            ShaderMask(
              shaderCallback: (b) => const LinearGradient(
                colors: AppColors.primaryGradient,
              ).createShader(b),
              child: Text('SignTranslate AI',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: d.fontS,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.bgSurface,
                borderRadius: BorderRadius.circular(d.radiusM),
                border: Border.all(color: AppColors.divider),
              ),
              child: const Icon(Icons.notifications_outlined,
                  color: AppColors.textSecondary, size: 22),
            ),
            Positioned(
              top: -2,
              left: -2,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ],
    );
  }