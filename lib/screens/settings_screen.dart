import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/SmallButton.dart';
import 'package:imaa/widgets/buildDivider.dart';
import 'package:imaa/widgets/buildLogoutButton.dart';

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
            _buildSection(
              d,
              title: 'تفضيلات التنبيهات',
              icon: Icons.notifications_outlined,
              children: [
                _buildToggleRow(d, 'إشعارات الدروس',      _notifyLessons,     (v) => setState(() => _notifyLessons = v)),
                buildSampleDivider(),
                _buildToggleRow(d, 'العروض والتحديات',     _notifyOffers,      (v) => setState(() => _notifyOffers = v)),
                buildSampleDivider(),
                _buildToggleRow(d, 'المنافسات',            _notifyCompetition, (v) => setState(() => _notifyCompetition = v)),
              ],
            ),
            SizedBox(height: d.spaceM),

            // ── Language ───────────────────────────────
            _buildSection(
              d,
              title: 'اللغة والمنطقة',
              icon: Icons.language_rounded,
              children: [
                _buildArrowRow(d, Icons.map_outlined, 'اللغة', 'العربية (السعودية)', () {}),
              ],
            ),
            SizedBox(height: d.spaceM),

            // ── Appearance ─────────────────────────────
            _buildSection(
              d,
              title: 'المظهر والتصميم',
              icon: Icons.palette_outlined,
              children: [
                _buildToggleRow(d, 'الوضع الليلي', _darkMode, (v) => setState(() => _darkMode = v)),
                buildSampleDivider(),
                _buildColorPicker(d),
              ],
            ),
            SizedBox(height: d.spaceM),

            // ── Privacy ────────────────────────────────
            _buildSection(
              d,
              title: 'الدعم والخصوصية',
              icon: Icons.shield_outlined,
              children: [
                _buildArrowRow(d, Icons.lock_outline_rounded,      'الأمان',              '',  () {}),
                buildSampleDivider(),
                _buildArrowRow(d, Icons.storage_outlined,          'إدارة البيانات',      '',  () {}),
                buildSampleDivider(),
                _buildArrowRow(d, Icons.help_outline_rounded,      'المساعدة',            '',  () {}),
                buildSampleDivider(),
                _buildArrowRow(d, Icons.mail_outline_rounded,      'اتصل بنا',            '',  () {}),
                buildSampleDivider(),
                _buildArrowRow(d, Icons.privacy_tip_outlined,      'سياسة الخصوصية',     '',  () {}),
                buildSampleDivider(),
                _buildArrowRow(d, Icons.info_outline_rounded,      'حول SignTranslate',   '',  () {}),
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

  Widget _buildSection(
    AppDimensions d, {
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Row(
          children: [
            Icon(icon, color: AppColors.primary, size: d.iconS),
            SizedBox(width: d.spaceS),
            Text(
              title,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: d.fontM,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(height: d.spaceS),

        // Content card
        Container(
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(d.radiusL),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  // ── Toggle row ────────────────────────────────────────────

  Widget _buildToggleRow(
    AppDimensions d,
    String label,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: d.spaceM, vertical: d.spaceS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: AppColors.textSecondary, fontSize: d.fontM),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
            activeTrackColor: AppColors.primary.withOpacity(0.3),
            inactiveThumbColor: AppColors.textHint,
            inactiveTrackColor: AppColors.bgSurface,
          ),
        ],
      ),
    );
  }

  // ── Arrow row ─────────────────────────────────────────────

  Widget _buildArrowRow(
    AppDimensions d,
    IconData icon,
    String label,
    String subtitle,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: d.spaceM, vertical: d.spaceM),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.glowTeal,
                borderRadius: BorderRadius.circular(d.radiusS),
              ),
              child: Icon(icon, color: AppColors.primary, size: d.iconS),
            ),
            SizedBox(width: d.spaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: d.fontM,
                    ),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: d.fontXS,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
            const Icon(Icons.arrow_back_ios_new_rounded,
                color: AppColors.textHint, size: 14),
          ],
        ),
      ),
    );
  }

  // ── Color picker ──────────────────────────────────────────

  Widget _buildColorPicker(AppDimensions d) {
    final colors = [
      AppColors.primary,
      const Color(0xFF0099FF),
      const Color(0xFF9B59B6),
      const Color(0xFF1DB954),
      const Color(0xFFFF8C00),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: d.spaceM, vertical: d.spaceM),
      child: Row(
        children: [
          Text(
            'لون التطبيق',
            style: TextStyle(color: AppColors.textSecondary, fontSize: d.fontM),
          ),
          SizedBox(width: d.spaceM),
          Row(
            children: colors.map((c) {
              final isSelected = c == AppColors.primary;
              return Padding(
                padding: EdgeInsets.only(left: d.spaceXS),
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: c,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: Colors.white, width: 2)
                        : null,
                    boxShadow: isSelected
                        ? [BoxShadow(color: c.withOpacity(0.5), blurRadius: 6)]
                        : [],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  

  
}


