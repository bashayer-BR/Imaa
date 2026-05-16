import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
import 'package:imaa/screens/home_screen.dart';
import 'package:imaa/screens/profile_screen.dart';
import 'package:imaa/screens/welcome_screen.dart';
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
    final pages =[HomeScreen(),ProfileScreen(),WelcomeScreen()];
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
