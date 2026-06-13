import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/app_routes.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildCameraButton(AppDimensions d,AnimationController pulseCtrl, BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: pulseCtrl,
          builder: (_, __) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary
                      .withOpacity(0.35 + 0.25 * pulseCtrl.value),
                  blurRadius: 20 + 10 * pulseCtrl.value,
                  spreadRadius: 2 + 3 * pulseCtrl.value,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                 Navigator.pushNamed(context, AppRoutes.camera);
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: AppColors.primaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(Icons.camera_alt_rounded,
                    color: Colors.white, size: 30),
              ),
            ),
          ),
        ),
        SizedBox(height: d.spaceS),
        Text('ترجمة فورية (إشارة)',
            style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: d.fontS,
                fontWeight: FontWeight.w600)),
      ],
    );
  }