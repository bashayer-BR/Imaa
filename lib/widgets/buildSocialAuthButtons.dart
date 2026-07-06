import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/Buttons.dart';

class BuildSocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Widget icon;
  final Color borderColor;
  final Color bgColor;
  final AppDimensions d;

  const BuildSocialButton({
    required this.onTap,
    required this.label,
    required this.icon,
    required this.borderColor,
    required this.bgColor,
    required this.d
  });

  @override
  Widget build(BuildContext context) {
    return   TealPressButton(
            onTap: onTap,
            height: d.btnHeightSecond,
            bgColor:bgColor,
            borderColor: borderColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: d.spaceXS + 4),
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: d.btnFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          
        );
  }
}