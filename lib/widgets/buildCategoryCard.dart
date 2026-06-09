import 'package:flutter/material.dart';
import 'package:imaa/classes/Category.dart';
import 'package:imaa/core/AppDim.dart';

Widget buildCategoryCard(Dicategory cat, AppDimensions d) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: cat.gradient,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(d.radiusL),
          boxShadow: [
            BoxShadow(
              color: cat.gradient.first.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: d.spaceM,
            vertical: d.spaceS,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  cat.label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: d.fontM,
                    fontWeight: FontWeight.w800,
                    height: 1.3,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(cat.icon, color: Colors.white, size: d.iconS + 2),
              ),
            ],
          ),
        ),
      ),
    );
  }