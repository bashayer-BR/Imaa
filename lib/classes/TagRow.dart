import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
class TagRow extends StatelessWidget {
  final AppDimensions d;
  final List<String> tags;

  const TagRow({required this.d, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: d.spaceXS,
      runSpacing: d.spaceXS,
      children: tags
          .map(
            (t) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: d.spaceS,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: AppColors.bgSurface,
                borderRadius: BorderRadius.circular(d.radiusXL),
                border: Border.all(color: AppColors.divider),
              ),
              child: Text(
                t,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: d.fontXS,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}