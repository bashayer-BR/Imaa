import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/screens/challenges_screen.dart';
import 'package:imaa/screens/explore_screen.dart';
import 'package:imaa/screens/profile_screen.dart';
import 'package:imaa/screens/settings_screen.dart';
import 'package:imaa/widgets/Buttons.dart';
import 'package:imaa/widgets/buildBottomNav.dart';
import 'package:imaa/widgets/buildHeader.dart';
import 'package:imaa/widgets/cards.dart';
import 'package:imaa/widgets/grids.dart';

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
                // buildBottomNav(),
                buildBottomNav(),
                CustomBottomNav(currentTab: _currentTab,onTabChange: (index){
                  setState(() {
                    _currentTab=index;
                  });
                },)
              ],
            ),
          ),
        ),
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
            child: buildCameraButton(d, pulseCtrl,context)),
          SizedBox(height: d.spaceL),
          buildDailySignCard(d),
          SizedBox(height: d.spaceL),
        ],
      ),
    );
  }   
}


