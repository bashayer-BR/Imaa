import 'package:flutter/material.dart';
import 'package:imaa/classes/Unit.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
 Widget buildUnitCard(Unit unit, AppDimensions d) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: unit.isUnlocked
              ? unit.gradient
              : [AppColors.bgCard, AppColors.bgSurface],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(
          color: unit.isUnlocked
              ? unit.gradient.first.withOpacity(0.3)
              : AppColors.divider,
        ),
        boxShadow: unit.isUnlocked
            ? [
                BoxShadow(
                  color: unit.gradient.first.withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Padding(
        padding: EdgeInsets.all(d.spaceM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Icon + lock ──────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: unit.isUnlocked
                        ? Colors.white.withOpacity(0.2)
                        : AppColors.bgDark.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(d.radiusS),
                  ),
                  child: Icon(
                    unit.icon,
                    color:
                        unit.isUnlocked ? Colors.white : AppColors.textHint,
                    size: d.iconM,
                  ),
                ),
                if (!unit.isUnlocked)
                  Icon(Icons.lock_outline_rounded,
                      color: AppColors.textHint, size: d.iconS),
              ],
            ),

            const Spacer(),

            // ── Label ────────────────────────────────
            Text(
              unit.label,
              style: TextStyle(
                color: unit.isUnlocked ? Colors.white : AppColors.textHint,
                fontSize: d.fontM,
                fontWeight: FontWeight.w800,
              ),
            ),

            // ── Progress bar ─────────────────────────
            if (unit.isUnlocked && unit.progress > 0) ...[
              SizedBox(height: d.spaceXS),
              ClipRRect(
                borderRadius: BorderRadius.circular(d.radiusXL),
                child: LinearProgressIndicator(
                  value: unit.progress,
                  minHeight: 4,
                  backgroundColor: Colors.white.withOpacity(0.25),
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                ),
              ),
            ],

            SizedBox(height: d.spaceS),

            // ── Button ───────────────────────────────
            GestureDetector(
              onTap: unit.isUnlocked ? () {} : null,
              child: Container(
                width: double.infinity,
                height: d.btnHeightSmall,
                decoration: BoxDecoration(
                  color: unit.isUnlocked
                      ? Colors.white.withOpacity(0.2)
                      : AppColors.bgSurface,
                  borderRadius: BorderRadius.circular(d.radiusXL),
                  border: Border.all(
                    color: unit.isUnlocked
                        ? Colors.white.withOpacity(0.4)
                        : AppColors.divider,
                  ),
                ),
                child: Center(
                  child: Text(
                    unit.isUnlocked ? 'ابدأ الوحدة' : 'مقفل',
                    style: TextStyle(
                      color: unit.isUnlocked
                          ? Colors.white
                          : AppColors.textHint,
                      fontSize: d.fontXS,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }