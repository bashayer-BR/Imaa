import 'package:flutter/material.dart';
import 'package:imaa/classes/GridItem.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/app_routes.dart';

 Widget buildGrid(AppDimensions d ,BuildContext context ) {
    final items = [
      GridItem(Icons.translate_rounded,    'ترجمة',  'إشارة ← نص',
          [const Color(0xFF00D4C8), const Color(0xFF0099CC)],onTap: (){}),
      GridItem(Icons.emoji_events_rounded, 'تحديات', 'اختبر نفسك',
          [const Color(0xFF1DB954), const Color(0xFF0D7A37)],onTap: (){}),
      GridItem(Icons.sign_language_rounded,'قاموس',  'الإشارات',
          [const Color(0xFF0099FF), const Color(0xFF005BB5)],onTap: (){AppRoutes.pushNamed(context, '/dictionary');}),
      GridItem(Icons.menu_book_rounded,    'تعلّم',  'دروس يومية',
          [const Color(0xFFFF8C00), const Color(0xFFCC5500)],onTap: (){}),
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