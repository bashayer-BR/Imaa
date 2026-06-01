import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/screens/PlaceholderPage.dart';
import 'package:imaa/screens/challenges_screen.dart';
import 'package:imaa/screens/explore_screen.dart';
import 'package:imaa/screens/profile_screen.dart';
import 'package:imaa/screens/settings_screen.dart';
import 'package:imaa/widgets/buildCameraButton.dart';
import 'package:imaa/widgets/buildDailySignCard.dart';
import 'package:imaa/widgets/buildGrid.dart';
import 'package:imaa/widgets/buildHeader.dart';
import 'package:imaa/widgets/buildProgressCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentTab = 0;
  late final AnimationController _pulseCtrl;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pages = [
      _HomeContent(pulseCtrl: _pulseCtrl),
      const ExploreScreen(),
      const ChallengesScreen(),
      const ProfileScreen(),
      const SettingsScreen(),
    ];
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final d  = AppDim.of(context);
    final mq = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: Container(
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
            child: Column(
              children: [
                Expanded(
                  child: IndexedStack(
                    index: _currentTab,
                    children: _pages,
                  ),
                ),
                _buildBottomNav(d, mq),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav(AppDimensions d, MediaQueryData mq) {
    final tabs = [
      (Icons.home_rounded,         Icons.home_outlined,          'الرئيسية'),
      (Icons.explore_rounded,      Icons.explore_outlined,       'استكشف'),
      (Icons.emoji_events_rounded, Icons.emoji_events_outlined,  'تحديات'),
      (Icons.person_rounded,       Icons.person_outline_rounded, 'البروفايل'),
      (Icons.settings_rounded,     Icons.settings_outlined,      'الإعدادات'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      padding: EdgeInsets.only(
        top: d.spaceS,
        bottom: d.spaceS + mq.padding.bottom,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (i) {
          final (activeIcon, inactiveIcon, label) = tabs[i];
          final isActive = _currentTab == i;
          return GestureDetector(
            onTap: () => setState(() => _currentTab = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(
                horizontal: d.spaceS,
                vertical: d.spaceXS,
              ),
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.primary.withOpacity(0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(d.radiusM),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isActive ? activeIcon : inactiveIcon,
                    color: isActive ? AppColors.primary : AppColors.textHint,
                    size: d.iconS + 2,
                  ),
                  SizedBox(height: d.spaceXS - 2),
                  Text(
                    label,
                    style: TextStyle(
                      color: isActive ? AppColors.primary : AppColors.textHint,
                      fontSize: d.fontXS - 1,
                      fontWeight:
                          isActive ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  _HomeContent
// ══════════════════════════════════════════════════════════════

class _HomeContent extends StatelessWidget {
  final AnimationController pulseCtrl;
  const _HomeContent({required this.pulseCtrl});

  @override
  Widget build(BuildContext context) {
    final d = AppDim.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: d.hPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: d.spaceM),
          // _buildHeader(d),
          buildHeader(d),
          SizedBox(height: d.spaceL),
          buildProgressCard(d),
          SizedBox(height: d.spaceL),
          Text('الأقسام',
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: d.fontL,
                  fontWeight: FontWeight.w800)),
          SizedBox(height: d.spaceM),
          buildGrid(d ,context),
          SizedBox(height: d.spaceL),
          Align(
            alignment: AlignmentGeometry.center,
            child: buildCameraButton(d, pulseCtrl)),
          SizedBox(height: d.spaceL),
          buildDailySignCard(d),
          SizedBox(height: d.spaceL),
        ],
      ),
    );
  }   
}


