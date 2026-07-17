import 'package:flutter/material.dart';
import 'package:imaa/classes/Category.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/widgets/cards.dart';

Widget buildCategoriesGrid(AppDimensions d) {
    final categories = [
      Dicategory(
        label: 'الأرقام',
        icon: Icons.tag_rounded,
        gradient: [const Color(0xFF00D4C8), const Color(0xFF0099CC)],
      ),
      Dicategory(
        label: 'العائلة',
        icon: Icons.family_restroom_rounded,
        gradient: [const Color(0xFF1DB954), const Color(0xFF0D7A37)],
      ),
      Dicategory(
        label: 'الحروف',
        icon: Icons.abc_rounded,
        gradient: [const Color(0xFF0099FF), const Color(0xFF005BB5)],
      ),
      Dicategory(
        label: 'العبارات اليومية',
        icon: Icons.chat_bubble_outline_rounded,
        gradient: [const Color(0xFF9B59B6), const Color(0xFF6C3483)],
      ),
      Dicategory(
        label: 'المشاعر',
        icon: Icons.emoji_emotions_outlined,
        gradient: [const Color(0xFFFF8C00), const Color(0xFFCC5500)],
      ),
      Dicategory(
        label: 'التعارف',
        icon: Icons.waving_hand_rounded,
        gradient: [const Color(0xFFE74C3C), const Color(0xFF922B21)],
      ),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: d.spaceM,
      mainAxisSpacing: d.spaceM,
      childAspectRatio: 1.6,
      children: categories.map((c) => buildCategoryCard(c, d)).toList(),
    );
  }