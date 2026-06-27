import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildArrowRow(
    AppDimensions d,
    IconData icon,
    String label,
    String subtitle,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: d.spaceM, vertical: d.spaceM),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.glowTeal,
                borderRadius: BorderRadius.circular(d.radiusS),
              ),
              child: Icon(icon, color: AppColors.primary, size: d.iconS),
            ),
            SizedBox(width: d.spaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: d.fontM,
                    ),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: d.fontXS,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
            const Icon(Icons.arrow_back_ios_new_rounded,
                color: AppColors.textHint, size: 14),
          ],
        ),
      ),
    );
  }