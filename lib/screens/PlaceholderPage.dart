import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
class PlaceholderPage extends StatelessWidget {
  final String label;
  final IconData icon;
  const PlaceholderPage({super.key, required this.label, required this.icon});
  @override
  Widget build(BuildContext context) {
    final d = AppDim.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primary, size: 52),
          SizedBox(height: d.spaceM),
          Text(label,
              style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: d.fontL,
                  fontWeight: FontWeight.w700)),
          SizedBox(height: d.spaceS),
          Text('قريباً...',
              style: TextStyle(
                  color: AppColors.textHint, fontSize: d.fontM)),
        ],
      ),
    );
  }
}