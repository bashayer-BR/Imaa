import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/buildEmptyState.dart';
import 'package:imaa/widgets/buildInputCard.dart';
import 'package:imaa/widgets/buildResultLabel.dart';
import 'package:imaa/widgets/buildTranslationInfo.dart';
import 'package:imaa/widgets/buildVideoCard.dart';
import 'package:imaa/widgets/teal_press_button.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textCtrl = TextEditingController();
  bool _hasResult = false;
  bool _isPlaying = false;
  late final AnimationController _pulseCtrl;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _textCtrl.dispose();
    _pulseCtrl.dispose();
    super.dispose();
  }

  void _onTranslate() {
    if (_textCtrl.text.trim().isEmpty) return;
    FocusScope.of(context).unfocus();
    setState(() => _hasResult = true);
  }

  void _onPlay() => setState(() => _isPlaying = !_isPlaying);

  @override
  Widget build(BuildContext context) {
    final d  = AppDim.of(context);
    final mq = MediaQuery.of(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: d.hPad),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: mq.size.height - mq.padding.vertical - 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: d.spaceM),
      
                  // ── Header ─────────────────────────────
                  _buildHeader(d),
                  SizedBox(height: d.spaceL),
      
                  // ── Input card ─────────────────────────
                  buildInputCard(d,_textCtrl,(_) => setState(() {})),
                  SizedBox(height: d.spaceM),
      
                  // ── Translate button ───────────────────
                  TealPressButton(
                    onTap: _onTranslate,
                    isGradient: true,
                    height: d.btnHeightPrimary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.translate_rounded,
                            color: Colors.white, size: 20),
                        SizedBox(width: d.spaceS),
                        Text(
                          'ترجمة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: d.btnFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
      
                  SizedBox(height: d.spaceL),
      
                  // ── Result section ─────────────────────
                  if (_hasResult) ...[
                    buildResultLabel(d),
                    SizedBox(height: d.spaceM),
                    buildVideoCard(d, _isPlaying,_pulseCtrl,_onPlay),
                    SizedBox(height: d.spaceM),
                    buildTranslationInfo(d,_textCtrl),
                  ] else
                    buildEmptyState(d),
      
                  SizedBox(height: d.spaceXL),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Header ───────────────────────────────────────────────

  Widget _buildHeader(AppDimensions d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ترجمة',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: d.fontXL,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: d.spaceXS),
            ShaderMask(
              shaderCallback: (b) => const LinearGradient(
                colors: AppColors.primaryGradient,
              ).createShader(b),
              child: Text(
                'نص  ←  إشارة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: d.fontS,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        // Clear button
        if (_hasResult)
          GestureDetector(
            onTap: () {
              _textCtrl.clear();
              setState(() {
                _hasResult = false;
                _isPlaying = false;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: d.spaceM,
                vertical: d.spaceXS,
              ),
              decoration: BoxDecoration(
                color: AppColors.bgSurface,
                borderRadius: BorderRadius.circular(d.radiusXL),
                border: Border.all(color: AppColors.divider),
              ),
              child: Text(
                'مسح',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: d.fontS,
                ),
              ),
            ),
          ),
      ],
    );
  }

  // ── Input card ───────────────────────────────────────────

  
}