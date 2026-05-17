import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';

Widget buildAvatar(AppDimensions d) {
    final size = (d.screenW * 0.28).clamp(90.0, 120.0);
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        // Circle with teal gradient border
        Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: AppColors.primaryGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.bgSurface,
            ),
            child: Icon(
              Icons.person_outline_rounded,
              color: AppColors.textHint,
              size: size * 0.48,
            ),
          ),
        ),
        // Guest badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary, width: 1),
          ),
          child: Text(
            'زائر',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: d.fontXS,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }