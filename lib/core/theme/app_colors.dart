// ============================================================
//  app_colors.dart  –  SignTranslate AI  –  Color Palette
// ============================================================

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Primary Brand ──────────────────────────────────────────
  static const Color primary       = Color(0xFF00D4C8);   // Teal accent
  static const Color primaryDark   = Color(0xFF009E94);
  static const Color primaryLight  = Color(0xFF5FFAF3);

  // ── Background ────────────────────────────────────────────
  static const Color bgDark        = Color(0xFF0A0F1E);   // Deep navy
  static const Color bgCard        = Color(0xFF111827);   // Card surface
  static const Color bgSurface     = Color(0xFF1A2235);   // Elevated surface

  // ── Gradient stops ────────────────────────────────────────
  static const List<Color> bgGradient = [
    Color(0xFF060C18),
    Color(0xFF0D1A2E),
    Color(0xFF0A1628),
  ];

  static const List<Color> primaryGradient = [
    Color(0xFF00D4C8),
    Color(0xFF0099FF),
  ];

  static const List<Color> buttonGradient = [
    Color(0xFF1A3A4A),
    Color(0xFF0D2535),
  ];

  // ── Text ──────────────────────────────────────────────────
  static const Color textPrimary   = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color textHint      = Color(0xFF607D8B);
  static const Color textAccent    = Color(0xFF00D4C8);
  static const Color textLink      = Color(0xFF00D4C8);

  // ── Utility ───────────────────────────────────────────────
  static const Color divider       = Color(0xFF1E2D3D);
  static const Color overlay       = Color(0x80000000);
  static const Color glowTeal      = Color(0x4400D4C8);
  static const Color glowBlue      = Color(0x440099FF);

  // ── Social Auth ───────────────────────────────────────────
  static const Color googleBtn     = Color(0xFF131E2E);
  static const Color appleBtn      = Color(0xFF0D1825);
  static const Color googleBorder  = Color(0xFF1E3347);
  static const Color appleBorder   = Color(0xFF1A2E40);
}
