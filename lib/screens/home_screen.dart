// ============================================================
//  home_screen.dart  –  SignTranslate AI  –  Home (Placeholder)
// ============================================================

import 'package:flutter/material.dart';
import 'package:imaa/core/theme/app_colors.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: AppColors.primaryGradient,
          ).createShader(bounds),
          child: const Text(
            'SignTranslate AI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'الشاشة الرئيسية 🤟',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
