import 'package:flutter/material.dart';
import 'package:imaa/classes/Reference.dart';
import 'package:imaa/core/AppDim.dart';

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