import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';

Widget buildDivider(AppDimensions d,String text) {
    return Row(
      children: [
        const Expanded(
            child: Divider(color: AppColors.divider, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: d.spaceS),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.textHint,
              fontSize: d.fontS,
            ),
          ),
        ),
        const Expanded(
            child: Divider(color: AppColors.divider, thickness: 1)),
      ],
    );
  }

  Widget buildSampleDivider() {
    return const Divider(
      color: AppColors.divider,
      height: 1,
      indent: 16,
      endIndent: 16,
    );
  }