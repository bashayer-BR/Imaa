import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentTab;
  final Function(int) onTabChange;

  const CustomBottomNav({
    super.key,
    required this.currentTab,
    required this.onTabChange, 

  });

  @override
  Widget build(BuildContext context) {
    final d = AppDim.of(context);
    final mq = MediaQuery.of(context);
    final tabs = [
      (Icons.home_rounded, Icons.home_outlined, 'الرئيسية'),
      (Icons.explore_rounded, Icons.explore_outlined, 'استكشف'),
      (Icons.emoji_events_rounded, Icons.emoji_events_outlined, 'تحديات'),
      (Icons.person_rounded, Icons.person_outline_rounded, 'البروفايل'),
      (Icons.settings_rounded, Icons.settings_outlined, 'الإعدادات'),
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
          final isActive = currentTab == i;
          return GestureDetector(
            onTap: () => onTabChange(i),
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