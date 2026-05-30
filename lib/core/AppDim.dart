// ============================================================
//  app_dimensions.dart  –  SignTranslate AI
//  استخدم AppDim.of(context) في أي ويدجت للحصول على الأحجام
// ============================================================

import 'package:flutter/material.dart';

class AppDim {
  AppDim._();

  // ── Factory ───────────────────────────────────────────────
  static AppDimensions of(BuildContext context) {
    final mq = MediaQuery.of(context);
    return AppDimensions(
      screenW: mq.size.width,
      screenH: mq.size.height,
    );
  }
}

class AppDimensions {
  final double screenW;
  final double screenH;

  AppDimensions({required this.screenW, required this.screenH});

  // ── Screen breakpoints ────────────────────────────────────
  bool get isSmallPhone  => screenH < 680;
  bool get isMedPhone    => screenH >= 680 && screenH < 812;
  bool get isLargePhone  => screenH >= 812;

  // ── Spacing ───────────────────────────────────────────────
  double get spaceXS  => screenH * 0.008;   // ~6-8px
  double get spaceS   => screenH * 0.014;   // ~10-14px
  double get spaceM   => screenH * 0.022;   // ~16-22px
  double get spaceL   => screenH * 0.034;   // ~24-34px
  double get spaceXL  => screenH * 0.048;   // ~32-48px

  // ── Horizontal padding ────────────────────────────────────
  double get hPad     => screenW * 0.06;    // 6% من عرض الشاشة

  // ── Image / illustration ──────────────────────────────────
  double get illustSize => (screenW * 0.65).clamp(160.0, 280.0);

  // ── Font sizes ────────────────────────────────────────────
  double get fontXS   => (screenW * 0.030).clamp(11.0, 13.0);
  double get fontS    => (screenW * 0.034).clamp(12.0, 14.0);
  double get fontM    => (screenW * 0.038).clamp(13.0, 16.0);
  double get fontL    => (screenW * 0.046).clamp(16.0, 20.0);
  double get fontXL   => (screenW * 0.058).clamp(20.0, 26.0);
  double get fontXXL  => (screenW * 0.072).clamp(24.0, 32.0);

  // ── Button sizes ──────────────────────────────────────────
  double get btnHeightPrimary => (screenH * 0.068).clamp(48.0, 58.0);
  double get btnHeightSecond  => (screenH * 0.060).clamp(44.0, 54.0);
  double get btnHeightSmall => (screenH * 0.042).clamp(32.0, 40.0);
  double get btnRadius        => 30.0;
  double get btnFontSize      => fontM;
  double get btnIconSize      => (screenW * 0.050).clamp(16.0, 22.0);

  // ── Border radius ─────────────────────────────────────────
  double get radiusS  => 8.0;
  double get radiusM  => 16.0;
  double get radiusL  => 24.0;
  double get radiusXL => 30.0;

  // ── Icon sizes ────────────────────────────────────────────
  double get iconS    => (screenW * 0.050).clamp(16.0, 20.0);
  double get iconM    => (screenW * 0.060).clamp(20.0, 26.0);
  double get iconL    => (screenW * 0.075).clamp(24.0, 32.0);
}