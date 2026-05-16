// ============================================================
//  welcome_screen.dart 
// ============================================================

import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/app_routes.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/buildDivider.dart';
import 'package:imaa/widgets/buildLoginLink.dart';
import 'package:imaa/widgets/buildSocialAuthButtons.dart';
import 'package:imaa/widgets/buildTagline.dart';
 
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
 
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
 
class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _pulseCtrl;
  late final AnimationController _fadeCtrl;
  late final Animation<double> _fadeAnim;
 
  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
 
    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
 
    _fadeAnim = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut);
  }
 
  @override
  void dispose() {
    _pulseCtrl.dispose();
    _fadeCtrl.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    final d  = AppDim.of(context);
    final mq = MediaQuery.of(context);
 
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: FadeTransition(
        opacity: _fadeAnim,
        child: Container(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: d.spaceL),
 
                      // ── Logo & title ──────────────────
                      _buildHeader(d),
                      SizedBox(height: d.spaceL),
 
                      // ── Hand image ────────────────────
                      _buildHandIllustration(d),
                      SizedBox(height: d.spaceL),
 
                      // ── Tagline ───────────────────────
                      buildTagline(fontSize: d.fontM),
                      SizedBox(height: d.spaceXL),
 
                      // ── Guest button ──────────────────
                      // buildGuestButton(context, dim: d),
                      BuildSocialButton(
                        onTap: (){
                          AppRoutes.pushNamed(context, '/home');
                        }, 
                        label: "ابدأ كضيف", 
                        icon: Icon(Icons.arrow_back_ios_new),
                         borderColor: AppColors.googleBorder, 
                         bgColor: AppColors.googleBtn, 
                         d: d),
                      SizedBox(height: d.spaceM),
 
                      // ── Divider ───────────────────────
                      buildDivider(d),
                  
 
                      // _buildAuthRow(d),
                      // ── Google + Apple (side by side) ─
                      
                      SizedBox(height: d.spaceM),

                       BuildSocialButton(
                        onTap: (){}, 
                        label: "Google", 
                        icon: Icon(Icons.g_mobiledata_sharp),
                         borderColor: AppColors.googleBorder, 
                         bgColor: AppColors.googleBtn, 
                         d: d),
                      SizedBox(height: d.spaceM),
                      BuildSocialButton(
                        onTap: (){}, 
                        label: "Apple", 
                        icon: Icon(Icons.apple),
                         borderColor: AppColors.googleBorder, 
                         bgColor: AppColors.googleBtn, 
                         d: d),
                      SizedBox(height: d.spaceL),
                      
 
                      // ── Login link ────────────────────
                      buildLoginLink(context, fontSize: d.fontS),
 
                      SizedBox(height: d.spaceL),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
 
  // ── Header ───────────────────────────────────────────────
 
  Widget _buildHeader(AppDimensions d) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _pulseCtrl,
          builder: (_, __) => Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.wifi,
                color: AppColors.primary
                    .withOpacity(0.6 + 0.4 * _pulseCtrl.value),
                size: d.iconM,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'AI',
                  style: TextStyle(
                    color: AppColors.bgDark,
                    fontSize: d.fontXS - 1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: d.spaceS),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: AppColors.primaryGradient,
          ).createShader(bounds),
          child: Text(
            'SignTranslate AI',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: d.fontXL,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }
 
  // ── Hand illustration ─────────────────────────────────────
 
  Widget _buildHandIllustration(AppDimensions d) {
    return AnimatedBuilder(
      animation: _pulseCtrl,
      builder: (_, __) {
        final glow = 0.4 + 0.6 * _pulseCtrl.value;
        return Container(
          width: d.illustSize,
          height: d.illustSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.18 * glow),
                blurRadius: 50,
                spreadRadius: 15,
              ),
              BoxShadow(
                color: const Color(0xFF0099FF).withOpacity(0.10 * glow),
                blurRadius: 30,
                spreadRadius: 8,
              ),
            ],
          ),
          // هنا في مشكلة في لصورة راجعيها
          child: ClipRRect(
            borderRadius: BorderRadius.circular(d.illustSize * 0.15),
            child: Image.asset(
              'assets/images/imaa_logoo.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        );
      },
    );
  }  
}
 
