import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/buildSocialAuthButtons.dart';
 
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    final d  = AppDim.of(context);
    final mq = MediaQuery.of(context);
 
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: Container(
        width: mq.size.width,
        height: mq.size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.bgGradient,
          ),
        ),
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: d.hPad),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: mq.size.height - mq.padding.vertical,
                ),
                child: Column(
                  children: [
                    SizedBox(height: d.spaceL),
 
                    // ── AppBar row ────────────────────────
                    _buildTopBar(context, d),
 
                    SizedBox(height: d.spaceXL),
 
                    // ── Avatar placeholder ────────────────
                    _buildAvatar(d),
 
                    SizedBox(height: d.spaceM),
 
                    // ── Guest label ───────────────────────
                    Text(
                      'زائر',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: d.fontXL,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
 
                    SizedBox(height: d.spaceXS),
 
                    Text(
                      'سجّل دخولك للوصول إلى جميع الميزات',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: d.fontS,
                        height: 1.5,
                      ),
                    ),
 
                    SizedBox(height: d.spaceXL),
 
                    // ── Divider ───────────────────────────
                    _buildDivider(d),
 
                    SizedBox(height: d.spaceL),
 
                    // ── Google button ─────────────────────
                    BuildSocialButton(
                      onTap: () {},
                      label: 'تسجيل الدخول باستخدام Google',
                      icon: _GoogleIcon(size: d.iconS),
                      borderColor: AppColors.googleBorder,
                      bgColor: AppColors.googleBtn,
                      d: d,
                    ),
 
                    SizedBox(height: d.spaceM),
 
                    // ── Apple button ──────────────────────
                    BuildSocialButton(
                      onTap: () {},
                      label: 'تسجيل الدخول باستخدام Apple',
                      icon: Icon(
                        Icons.apple,
                        color: Colors.white,
                        size: d.iconS + 2,
                      ),
                      borderColor: AppColors.appleBorder,
                      bgColor: AppColors.appleBtn,
                      d: d,
                    ),
 
                    SizedBox(height: d.spaceXL),
 
                    // ── Features list ─────────────────────
                    _buildFeaturesList(d),
 
                    SizedBox(height: d.spaceXL),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
 
  // ── Top bar ───────────────────────────────────────────────
 
  Widget _buildTopBar(BuildContext context, AppDimensions d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الملف الشخصي',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: d.fontL,
            fontWeight: FontWeight.w800,
          ),
        ),
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.bgSurface,
            borderRadius: BorderRadius.circular(d.radiusM),
            border: Border.all(color: AppColors.divider),
          ),
          child: const Icon(
            Icons.settings_outlined,
            color: AppColors.textSecondary,
            size: 20,
          ),
        ),
      ],
    );
  }
 
  // ── Avatar ────────────────────────────────────────────────
 
  Widget _buildAvatar(AppDimensions d) {
    final size = (d.screenW * 0.28).clamp(90.0, 120.0);
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        // Circle with teal gradient border
        Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: AppColors.primaryGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.bgSurface,
            ),
            child: Icon(
              Icons.person_outline_rounded,
              color: AppColors.textHint,
              size: size * 0.48,
            ),
          ),
        ),
        // Guest badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary, width: 1),
          ),
          child: Text(
            'زائر',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: d.fontXS,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
 
  // ── Divider ───────────────────────────────────────────────
 
  Widget _buildDivider(AppDimensions d) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: d.spaceS),
          child: Text(
            'سجّل دخولك عبر',
            style: TextStyle(
              color: AppColors.textHint,
              fontSize: d.fontS,
            ),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
      ],
    );
  }
 
  // ── Features list ─────────────────────────────────────────
 
  Widget _buildFeaturesList(AppDimensions d) {
    final features = [
      (Icons.history_rounded,        'سجل الترجمات السابقة'),
      (Icons.bookmark_outline_rounded,'حفظ الإشارات المفضلة'),
      (Icons.sync_rounded,           'مزامنة البيانات عبر الأجهزة'),
      (Icons.insights_rounded,       'إحصائيات الاستخدام'),
    ];
 
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: List.generate(features.length, (i) {
          final (icon, label) = features[i];
          final isLast = i == features.length - 1;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: d.spaceM,
                  vertical: d.spaceS + 2,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.glowTeal,
                        borderRadius: BorderRadius.circular(d.radiusS),
                      ),
                      child: Icon(icon, color: AppColors.primary, size: 18),
                    ),
                    SizedBox(width: d.spaceM),
                    Expanded(
                      child: Text(
                        label,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: d.fontM,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.textHint,
                      size: 16,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                const Divider(
                  color: AppColors.divider,
                  thickness: 1,
                  height: 1,
                ),
            ],
          );
        }),
      ),
    );
  }
}
 
// ── Google Icon ───────────────────────────────────────────────
 
class _GoogleIcon extends StatelessWidget {
  final double size;
  const _GoogleIcon({required this.size});
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _GooglePainter()),
    );
  }
}
 
class _GooglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size s) {
    final c = Offset(s.width / 2, s.height / 2);
    final r = s.width / 2;
    const colors = [
      Color(0xFF4285F4),
      Color(0xFFEA4335),
      Color(0xFFFBBC05),
      Color(0xFF34A853),
    ];
    double start = -3.14159 / 4;
    for (int i = 0; i < 4; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: c, radius: r),
        start,
        3.14159 / 2,
        false,
        Paint()
          ..color = colors[i]
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      );
      start += 3.14159 / 2;
    }
  }
 
  @override
  bool shouldRepaint(_) => false;
}