import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/teal_press_button.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final d = AppDim.of(context);

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: d.hPad),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: d.spaceM),
              _buildHeader(d),
              SizedBox(height: d.spaceL),
              _buildCurrentLesson(d),
              SizedBox(height: d.spaceL),
              Text(
                'الوحدات',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: d.fontL,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: d.spaceM),
              _buildUnitsGrid(d),
              SizedBox(height: d.spaceXL),
            ],
          ),
        ),
      ),
    );
  }

  // ── Header ───────────────────────────────────────────────

  Widget _buildHeader(AppDimensions d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تعلّم',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: d.fontXL,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: d.spaceXS),
            Text(
              'دروس يومية خطوة بخطوة',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: d.fontS,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: d.spaceM,
            vertical: d.spaceXS,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF8C00), Color(0xFFCC5500)],
            ),
            borderRadius: BorderRadius.circular(d.radiusXL),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF8C00).withOpacity(0.3),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.local_fire_department_rounded,
                  color: Colors.white, size: 16),
              SizedBox(width: d.spaceXS),
              Text(
                '7 أيام',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: d.fontS,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Current lesson ────────────────────────────────────────

  Widget _buildCurrentLesson(AppDimensions d) {
    return Container(
      padding: EdgeInsets.all(d.spaceM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.18),
            const Color(0xFF0099FF).withOpacity(0.10),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.35),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: BorderRadius.circular(d.radiusL),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.sign_language_rounded,
                    color: AppColors.primary, size: 40),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'أ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: d.spaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الدرس الحالي',
                  style: TextStyle(
                      color: AppColors.textHint, fontSize: d.fontXS),
                ),
                SizedBox(height: d.spaceXS),
                Text(
                  'الحروف الأبجدية - الدرس 1',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: d.fontM,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: d.spaceS),
                ClipRRect(
                  borderRadius: BorderRadius.circular(d.radiusXL),
                  child: LinearProgressIndicator(
                    value: 0.25,
                    minHeight: 6,
                    backgroundColor: AppColors.bgSurface,
                    valueColor:
                        const AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
                SizedBox(height: d.spaceXS),
                Text(
                  '25%',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: d.fontXS,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: d.spaceS),
                TealPressButton(
                  onTap: () {},
                  isGradient: true,
                  height: d.btnHeightSecond,
                  child: Text(
                    'متابعة الدرس',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: d.btnFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Units grid ────────────────────────────────────────────

  Widget _buildUnitsGrid(AppDimensions d) {
    final units = [
      _Unit(
        label: 'الحروف',
        icon: Icons.abc_rounded,
        gradient: [const Color(0xFF0099FF), const Color(0xFF005BB5)],
        progress: 0.25,
        isUnlocked: true,
      ),
      _Unit(
        label: 'الأرقام',
        icon: Icons.tag_rounded,
        gradient: [const Color(0xFF1DB954), const Color(0xFF0D7A37)],
        progress: 0.0,
        isUnlocked: true,
      ),
      _Unit(
        label: 'التحيات',
        icon: Icons.waving_hand_rounded,
        gradient: [const Color(0xFF00D4C8), const Color(0xFF0099CC)],
        progress: 0.0,
        isUnlocked: false,
      ),
      _Unit(
        label: 'العائلة',
        icon: Icons.family_restroom_rounded,
        gradient: [const Color(0xFFFF8C00), const Color(0xFFCC5500)],
        progress: 0.0,
        isUnlocked: false,
      ),
      _Unit(
        label: 'المشاعر',
        icon: Icons.emoji_emotions_outlined,
        gradient: [const Color(0xFF9B59B6), const Color(0xFF6C3483)],
        progress: 0.0,
        isUnlocked: false,
      ),
      _Unit(
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
      itemBuilder: (_, i) => _buildUnitCard(units[i], d),
    );
  }

  Widget _buildUnitCard(_Unit unit, AppDimensions d) {
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
}

// ── Unit model ────────────────────────────────────────────────

class _Unit {
  final String label;
  final IconData icon;
  final List<Color> gradient;
  final double progress;
  final bool isUnlocked;

  const _Unit({
    required this.label,
    required this.icon,
    required this.gradient,
    required this.progress,
    required this.isUnlocked,
  });
}