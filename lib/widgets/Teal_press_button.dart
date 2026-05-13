import 'package:flutter/material.dart';
import 'package:imaa/core/theme/app_colors.dart';
 
class TealPressButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color bgColor;
  final Color borderColor;
  final bool isGradient;
  final double height;
 
  const TealPressButton({
    super.key,
    required this.onTap,
    required this.child,
    this.bgColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.isGradient = false,
    this.height = 52,
  });
 
  @override
  State<TealPressButton> createState() => _TealPressButtonState();
}
 
class _TealPressButtonState extends State<TealPressButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _ring;
  late final Animation<double> _scale;
 
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 160),
    );
    _ring = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _scale = Tween<double>(begin: 1.0, end: 0.97)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }
 
  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }
 
  void _onDown(_)  => _ctrl.forward();
  void _onUp(_)    { _ctrl.reverse(); widget.onTap(); }
  void _onCancel() => _ctrl.reverse();
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown:   _onDown,
      onTapUp:     _onUp,
      onTapCancel: _onCancel,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, child) => Transform.scale(
          scale: _scale.value,
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.55 * _ring.value),
                  blurRadius: 0,
                  spreadRadius: 2.5 * _ring.value,
                ),
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.22 * _ring.value),
                  blurRadius: 14 * _ring.value,
                  spreadRadius: 1.0 * _ring.value,
                ),
              ],
              gradient: widget.isGradient
                  ? const LinearGradient(
                      colors: AppColors.primaryGradient,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    )
                  : null,
              color: widget.isGradient ? null : widget.bgColor,
              border: Border.all(
                color: _ring.value > 0.05
                    ? Color.lerp(
                        widget.borderColor, AppColors.primary, _ring.value)!
                    : widget.borderColor,
                width: 1.5 + _ring.value,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: child,
          ),
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}