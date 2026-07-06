import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/widgets/Buttons.dart';
Widget buildLogoutButton(AppDimensions d) {
    return TealPressButton(
      onTap: () {},
      height: d.btnHeightPrimary,
      bgColor: const Color(0xFFE74C3C).withOpacity(0.12),
      borderColor: const Color(0xFFE74C3C).withOpacity(0.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.logout_rounded, color: Color(0xFFE74C3C), size: 20),
          SizedBox(width: d.spaceS),
          Text(
            'تسجيل الخروج',
            style: TextStyle(
              color: const Color(0xFFE74C3C),
              fontSize: d.btnFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }