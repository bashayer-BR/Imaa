import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/SmallButton.dart';
import 'package:imaa/widgets/buildArrowRow.dart';
import 'package:imaa/widgets/buildColorPicker.dart';
import 'package:imaa/widgets/buildDivider.dart';
import 'package:imaa/widgets/buildLogoutButton.dart';
import 'package:imaa/widgets/buildSection.dart';
import 'package:imaa/widgets/buildToggleRow.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifyLessons    = true;
  bool _notifyOffers     = false;
  bool _notifyCompetition = true;
  bool _darkMode         = true;

  @override
  Widget build(BuildContext context) {
    final d = AppDim.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: d.hPad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: d.spaceM),

            // ── Header ─────────────────────────────────
            _buildHeader(d),
            SizedBox(height: d.spaceL),

            // ── Profile card ───────────────────────────
            _buildProfileCard(d),
            SizedBox(height: d.spaceL),

            // ── Notifications ──────────────────────────
            buildSection(
              d,
              title: 'تفضيلات التنبيهات',
              icon: Icons.notifications_outlined,
              children: [
                buildToggleRow(d, 'إشعارات الدروس',      _notifyLessons,     (v) => setState(() => _notifyLessons = v)),
                buildSampleDivider(),
                buildToggleRow(d, 'العروض والتحديات',     _notifyOffers,      (v) => setState(() => _notifyOffers = v)),
                buildSampleDivider(),
                buildToggleRow(d, 'المنافسات',            _notifyCompetition, (v) => setState(() => _notifyCompetition = v)),
              ],
            ),
            SizedBox(height: d.spaceM),

            // ── Language ───────────────────────────────
            buildSection(
              d,
              title: 'اللغة والمنطقة',
              icon: Icons.language_rounded,
              children: [
                buildArrowRow(d, Icons.map_outlined, 'اللغة', 'العربية (السعودية)', () {}),
              ],
            ),
            SizedBox(height: d.spaceM),

            // ── Appearance ─────────────────────────────
            buildSection(
              d,
              title: 'المظهر والتصميم',
              icon: Icons.palette_outlined,
              children: [
                buildToggleRow(d, 'الوضع الليلي', _darkMode, (v) => setState(() => _darkMode = v)),
                buildSampleDivider(),
                buildColorPicker(d),
              ],
            ),
            SizedBox(height: d.spaceM),

            // ── Privacy ────────────────────────────────
            buildSection(
              d,
              title: 'الدعم والخصوصية',
              icon: Icons.shield_outlined,
              children: [
                buildArrowRow(d, Icons.lock_outline_rounded,      'الأمان',              '',  () {}),
                buildSampleDivider(),
                buildArrowRow(d, Icons.storage_outlined,          'إدارة البيانات',      '',  () {}),
                buildSampleDivider(),
                buildArrowRow(d, Icons.help_outline_rounded,      'المساعدة',            '',  () {}),
                buildSampleDivider(),
                buildArrowRow(d, Icons.mail_outline_rounded,      'اتصل بنا',            '',  () {}),
                buildSampleDivider(),
                buildArrowRow(d, Icons.privacy_tip_outlined,      'سياسة الخصوصية',     '',  () {}),
                buildSampleDivider(),
                buildArrowRow(d, Icons.info_outline_rounded,      'حول SignTranslate',   '',  () {}),
              ],
            ),
            SizedBox(height: d.spaceL),

            // ── Logout button ──────────────────────────
            buildLogoutButton(d),
            SizedBox(height: d.spaceXL),
          ],
        ),
      ),
    );
  }

  // ── Header ───────────────────────────────────────────────

  Widget _buildHeader(AppDimensions d) {
    return Text(
      'الإعدادات',
      style: TextStyle(
        color: AppColors.textPrimary,
        fontSize: d.fontXL,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  // ── Profile card ─────────────────────────────────────────

  Widget _buildProfileCard(AppDimensions d) {
    return Container(
      padding: EdgeInsets.all(d.spaceM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.15),
            const Color(0xFF0099FF).withOpacity(0.08),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 1.2),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: AppColors.primaryGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.35),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(Icons.person_rounded, color: Colors.white, size: 32),
          ),

          SizedBox(width: d.spaceM),

          // Name + buttons
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مستخدم ضيف',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: d.fontL,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: d.spaceS),
                Row(
                  children: [
                    Expanded(
                      child: SmallButton(
                        label: 'تعديل الملف',
                        icon: Icons.edit_outlined,
                        onTap: () {},
                        d: d,
                      ),
                    ),
                    SizedBox(width: d.spaceS),
                    Expanded(
                      child: SmallButton(
                        label: 'كلمة المرور',
                        icon: Icons.lock_outline_rounded,
                        onTap: () {},
                        d: d,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Section container ─────────────────────────────────────
}


