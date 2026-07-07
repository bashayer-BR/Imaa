import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/app_routes.dart';
import 'package:imaa/core/theme/app_colors.dart';
import 'package:imaa/screens/home_screen.dart';
import 'package:imaa/screens/profile_screen.dart';
import 'package:imaa/screens/welcome_screen.dart';
 
class TealPressButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color bgColor;
  final Color borderColor;
  final bool isGradient;
  final double height;
 
  const TealPressButton({
    super.key,
    required this.onTap,
    required this.child,
    this.bgColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.isGradient = false,
    this.height = 52,
  });
 
  @override
  State<TealPressButton> createState() => _TealPressButtonState();
}
 
class _TealPressButtonState extends State<TealPressButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _ring;
  late final Animation<double> _scale;
 
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 160),
    );
    _ring = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _scale = Tween<double>(begin: 1.0, end: 0.97)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }
 
  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }
 
  void _onDown(_)  => _ctrl.forward();
  void _onUp(_)    { _ctrl.reverse(); widget.onTap(); }
  void _onCancel() => _ctrl.reverse();
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown:   _onDown,
      onTapUp:     _onUp,
      onTapCancel: _onCancel,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, child) => Transform.scale(
          scale: _scale.value,
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.55 * _ring.value),
                  blurRadius: 0,
                  spreadRadius: 2.5 * _ring.value,
                ),
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.22 * _ring.value),
                  blurRadius: 14 * _ring.value,
                  spreadRadius: 1.0 * _ring.value,
                ),
              ],
              gradient: widget.isGradient
                  ? const LinearGradient(
                      colors: AppColors.primaryGradient,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    )
                  : null,
              color: widget.isGradient ? null : widget.bgColor,
              border: Border.all(
                color: _ring.value > 0.05
                    ? Color.lerp(
                        widget.borderColor, AppColors.primary, _ring.value)!
                    : widget.borderColor,
                width: 1.5 + _ring.value,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: child,
          ),
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}

// buildBottomNav
class buildBottomNav extends StatefulWidget {
  const buildBottomNav({super.key});
  

  @override
  State<buildBottomNav> createState() => _buildBottomNavState();
}

class _buildBottomNavState extends State<buildBottomNav> {
  
  @override
  Widget build(BuildContext context) {
    final d  = AppDim.of(context);
    int _currentTab = 0;
    final tabs = [
      (Icons.home_rounded,        Icons.home_outlined,         'الرئيسية'),
      // (Icons.explore_rounded,     Icons.explore_outlined,      'استكشف'),
      // (Icons.emoji_events_rounded,Icons.emoji_events_outlined, 'تحديات'),
      (Icons.person_rounded,      Icons.person_outline_rounded,'البروفايل'),
      (Icons.settings_rounded,    Icons.settings_outlined,     'الإعدادات'),
    ];
    // final pages =[HomeScreen(),ProfileScreen(),WelcomeScreen()];
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        border: Border(
          top: BorderSide(color: AppColors.divider, width: 1),
        ),
      ),
      padding: EdgeInsets.only(
        top: d.spaceS,
        bottom: d.spaceS + MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (i) {
          final (activeIcon, inactiveIcon, label) = tabs[i];
          final isActive = _currentTab == i;
          return GestureDetector(
            onTap: (){
              setState(() {_currentTab = i; });
              // print(i);
              },
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
                    color: isActive
                        ? AppColors.primary
                        : AppColors.textHint,
                    size: d.iconS + 2,
                  ),
                  SizedBox(height: d.spaceXS - 2),
                  Text(
                    label,
                    style: TextStyle(
                      color: isActive
                          ? AppColors.primary
                          : AppColors.textHint,
                      fontSize:d.fontXS - 1,
                      fontWeight: isActive
                          ? FontWeight.w700
                          : FontWeight.w400,
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
// camera button 
Widget buildCameraButton(AppDimensions d,AnimationController pulseCtrl, BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: pulseCtrl,
          builder: (_, __) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary
                      .withOpacity(0.35 + 0.25 * pulseCtrl.value),
                  blurRadius: 20 + 10 * pulseCtrl.value,
                  spreadRadius: 2 + 3 * pulseCtrl.value,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                 Navigator.pushNamed(context, AppRoutes.camera);
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: AppColors.primaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(Icons.camera_alt_rounded,
                    color: Colors.white, size: 30),
              ),
            ),
          ),
        ),
        SizedBox(height: d.spaceS),
        Text('ترجمة فورية (إشارة)',
            style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: d.fontS,
                fontWeight: FontWeight.w600)),
      ],
    );
  }