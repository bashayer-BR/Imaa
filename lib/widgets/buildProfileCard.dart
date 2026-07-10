import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
import 'package:imaa/widgets/Buttons.dart';
Widget buildProfileCard(AppDimensions d) {
    return Container(
      padding: EdgeInsets.all(d.spaceM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.15),
            const Color(0xFF0099FF).withOpacity(0.08),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 1.2),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: AppColors.primaryGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.35),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(Icons.person_rounded, color: Colors.white, size: 32),
          ),

          SizedBox(width: d.spaceM),

          // Name + buttons
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مستخدم ضيف',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: d.fontL,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: d.spaceS),
                Row(
                  children: [
                    Expanded(
                      child: SmallButton(
                        label: 'تعديل الملف',
                        icon: Icons.edit_outlined,
                        onTap: () {},
                        d: d,
                      ),
                    ),
                    SizedBox(width: d.spaceS),
                    Expanded(
                      child: SmallButton(
                        label: 'كلمة المرور',
                        icon: Icons.lock_outline_rounded,
                        onTap: () {},
                        d: d,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }