import 'package:flutter/material.dart';
import 'package:imaa/classes/GridItem.dart';
import 'package:imaa/classes/Reference.dart';
import 'package:imaa/classes/Unit.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/app_routes.dart';
import 'package:imaa/widgets/cards.dart';
Widget buildUnitsGrid(AppDimensions d) {
    final units = [
      Unit(
        label: 'الحروف',
        icon: Icons.abc_rounded,
        gradient: [const Color(0xFF0099FF), const Color(0xFF005BB5)],
        progress: 0.25,
        isUnlocked: true,
      ),
      Unit(
        label: 'الأرقام',
        icon: Icons.tag_rounded,
        gradient: [const Color(0xFF1DB954), const Color(0xFF0D7A37)],
        progress: 0.0,
        isUnlocked: true,
      ),
      Unit(
        label: 'التحيات',
        icon: Icons.waving_hand_rounded,
        gradient: [const Color(0xFF00D4C8), const Color(0xFF0099CC)],
        progress: 0.0,
        isUnlocked: false,
      ),
      Unit(
        label: 'العائلة',
        icon: Icons.family_restroom_rounded,
        gradient: [const Color(0xFFFF8C00), const Color(0xFFCC5500)],
        progress: 0.0,
        isUnlocked: false,
      ),
      Unit(
        label: 'المشاعر',
        icon: Icons.emoji_emotions_outlined,
        gradient: [const Color(0xFF9B59B6), const Color(0xFF6C3483)],
        progress: 0.0,
        isUnlocked: false,
      ),
      Unit(
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
      itemBuilder: (_, i) => buildUnitCard(units[i], d),
    );
  }
  // refrence grid
  Widget buildReferenceGrid(AppDimensions d) {
    final refs = [
      Reference('تراكيب القواعد',     Icons.account_tree_rounded,  [const Color(0xFF1DB954), const Color(0xFF0D7A37)]),
      Reference('المفردات التخصصية', Icons.library_books_rounded,  [const Color(0xFF0099FF), const Color(0xFF005BB5)]),
    ];

    return Row(
      children: List.generate(refs.length, (i) {
        final r = refs[i];
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i == 0 ? 0 : d.spaceM / 2, left: i == 1 ? 0 : d.spaceM / 2),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: (d.screenH * 0.14).clamp(100.0, 125.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: r.gradient, begin: Alignment.topRight, end: Alignment.bottomLeft),
                  borderRadius: BorderRadius.circular(d.radiusL),
                  boxShadow: [BoxShadow(color: r.gradient.first.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Padding(
                  padding: EdgeInsets.all(d.spaceM),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(d.radiusS)),
                        child: Icon(r.icon, color: Colors.white, size: d.iconM),
                      ),
                      Text(r.label, style: TextStyle(color: Colors.white, fontSize: d.fontS, fontWeight: FontWeight.w800, height: 1.3)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
  // build Crid 
  Widget buildGrid(AppDimensions d ,BuildContext context ) {
    final items = [
      GridItem(Icons.translate_rounded,    'ترجمة',  'إشارة ← نص',
          [const Color(0xFF00D4C8), const Color(0xFF0099CC)],onTap: (){AppRoutes.pushNamed(context, AppRoutes.translate );}),
      GridItem(Icons.emoji_events_rounded, 'تحديات', 'اختبر نفسك',
          [const Color(0xFF1DB954), const Color(0xFF0D7A37)],onTap: (){AppRoutes.pushNamed(context, AppRoutes.challenges);}),
      GridItem(Icons.sign_language_rounded,'قاموس',  'الإشارات',
          [const Color(0xFF0099FF), const Color(0xFF005BB5)],onTap: (){AppRoutes.pushNamed(context, '/dictionary');}),
      GridItem(Icons.menu_book_rounded,    'تعلّم',  'دروس يومية',
          [const Color(0xFFFF8C00), const Color(0xFFCC5500)],onTap: (){AppRoutes.pushNamed(context, AppRoutes.learn);}),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: d.spaceM,
      mainAxisSpacing: d.spaceM,
      childAspectRatio: 1.23,
      children: items.map((item) => buildGridCard(item, d,context)).toList(),
    );
  }

  Widget buildGridCard(GridItem item, AppDimensions d , BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: item.gradient,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(d.radiusL),
          boxShadow: [
            BoxShadow(
              color: item.gradient.first.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(d.spaceM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(d.radiusS),
                ),
                child: Icon(item.icon, color: Colors.white, size: d.iconM),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.label,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: d.fontM,
                          fontWeight: FontWeight.w800)),
                  Text(item.sublabel,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: d.fontXS)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }