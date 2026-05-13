import 'package:flutter/material.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildLoginLink(BuildContext context , {required double fontSize}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'هل تملك حسابًا بالفعل؟ ',
            style: TextStyle(color: AppColors.textHint, fontSize: fontSize),
          ),
          GestureDetector(
            onTap: () {},
            child:  Text(
              'تسجيل الدخول',
              style: TextStyle(
                color: AppColors.textLink,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.textLink,
              ),
            ),
          ),
        ],
      ),
    );
  }
