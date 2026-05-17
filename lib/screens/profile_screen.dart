import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/buildAvatar.dart';
import 'package:imaa/widgets/buildDivider.dart';
import 'package:imaa/widgets/buildFeaturesList.dart';
import 'package:imaa/widgets/buildSocialAuthButtons.dart';
import 'package:imaa/widgets/buildTopBar.dart';
 
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
                    buildTopBar(context, d), 
                    SizedBox(height: d.spaceXL),
 
                    // ── Avatar placeholder ────────────────
                    buildAvatar(d),
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
                   
                    buildDivider(d, 'سجّل دخولك عبر'),
 
                    SizedBox(height: d.spaceL),
 
                    // ── Google button ─────────────────────
                    BuildSocialButton(
                      onTap: () {},
                      label: 'تسجيل الدخول باستخدام Google',
                      icon: Icon(Icons.g_mobiledata_outlined),
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
                    buildFeaturesList(d),
 
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
}
 

 

 
 