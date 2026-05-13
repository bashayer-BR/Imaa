import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/app_routes.dart';

import 'package:imaa/widgets/teal_press_button.dart';
 
Widget buildGuestButton(BuildContext context, {required AppDimensions dim}) {
  return TealPressButton(
    onTap: () => AppRoutes.pushReplacementNamed(context, AppRoutes.home),
    height: dim.btnHeightPrimary,
    isGradient: true,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: dim.btnIconSize,
        ),
        Text(
          'استخدام كضيف',
          style: TextStyle(
            color: Colors.white,
            fontSize: dim.btnFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: dim.spaceS),
        
      ],
    ),
  );
}