import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';

class ChallengeCard extends StatelessWidget {
  final AppDimensions d;
  final List<Color> gradient;
  final Color borderColor;
  final Widget child;

  const ChallengeCard({
    required this.d,
    required this.gradient,
    required this.borderColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(d.spaceM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(color: borderColor, width: 1.2),
      ),
      child: child,
    );
  }
}
