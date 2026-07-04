import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildHandIllustration(AppDimensions d,AnimationController _pulseCtrl) {
    return AnimatedBuilder(
      animation: _pulseCtrl,
      builder: (_, __) {
        final glow = 0.4 + 0.6 * _pulseCtrl.value;
        return Container(
          width: d.illustSize,
          height: d.illustSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.18 * glow),
                blurRadius: 50,
                spreadRadius: 15,
              ),
              BoxShadow(
                color: const Color(0xFF0099FF).withOpacity(0.10 * glow),
                blurRadius: 30,
                spreadRadius: 8,
              ),
            ],
          ),
          // هنا في مشكلة في لصورة راجعيها
          child: ClipRRect(
            borderRadius: BorderRadius.circular(d.illustSize * 0.15),
            child: Image.asset(
              'assets/images/imaa_logoo.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        );
      },
    );
  }  