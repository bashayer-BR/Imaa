import 'package:flutter/material.dart';
import 'package:imaa/classes/Unit.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/widgets/buildUnitCard.dart';
Widget buildUnitsGrid(AppDimensions d) {
    final units = [
      Unit(
        label: 'الحروف',
        icon: Icons.abc_rounded,
        gradient: [const Color(0xFF0099FF), const Color(0xFF005BB5)],
        progress: 0.25,
        isUnlocked: true,
      ),
      Unit(
        label: 'الأرقام',
        icon: Icons.tag_rounded,
        gradient: [const Color(0xFF1DB954), const Color(0xFF0D7A37)],
        progress: 0.0,
        isUnlocked: true,
      ),
      Unit(
        label: 'التحيات',
        icon: Icons.waving_hand_rounded,
        gradient: [const Color(0xFF00D4C8), const Color(0xFF0099CC)],
        progress: 0.0,
        isUnlocked: false,
      ),
      Unit(
        label: 'العائلة',
        icon: Icons.family_restroom_rounded,
        gradient: [const Color(0xFFFF8C00), const Color(0xFFCC5500)],
        progress: 0.0,
        isUnlocked: false,
      ),
      Unit(
        label: 'المشاعر',
        icon: Icons.emoji_emotions_outlined,
        gradient: [const Color(0xFF9B59B6), const Color(0xFF6C3483)],
        progress: 0.0,
        isUnlocked: false,
      ),
      Unit(
        label: 'الألوان',
        icon: Icons.palette_outlined,
        gradient: [const Color(0xFFE74C3C), const Color(0xFF922B21)],
        progress: 0.0,
        isUnlocked: false,
      ),
    ];

    final cardHeight = (d.screenW * 0.5).clamp(160.0, 210.0);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: d.spaceM,
        mainAxisSpacing: d.spaceM,
        mainAxisExtent: cardHeight,
      ),
      itemCount: units.length,
      itemBuilder: (_, i) => buildUnitCard(units[i], d),
    );
  }