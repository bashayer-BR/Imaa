import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/buildEmptyState.dart';
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
                  _buildInputCard(d),
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
                    _buildResultLabel(d),
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

  Widget _buildInputCard(AppDimensions d) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(
          color: _textCtrl.text.isNotEmpty
              ? AppColors.primary.withOpacity(0.5)
              : AppColors.divider,
          width: 1.5,
        ),
        boxShadow: _textCtrl.text.isNotEmpty
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.08),
                  blurRadius: 16,
                  spreadRadius: 1,
                )
              ]
            : [],
      ),
      child: Column(
        children: [
          // Text field
          TextField(
            controller: _textCtrl,
            textDirection: TextDirection.rtl,
            maxLines: 4,
            minLines: 3,
            onChanged: (_) => setState(() {}),
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: d.fontM,
              height: 1.6,
            ),
            decoration: InputDecoration(
              hintText: 'أدخل الكلمة أو العبارة...',
              hintStyle: TextStyle(
                color: AppColors.textHint,
                fontSize: d.fontM,
              ),
              contentPadding: EdgeInsets.all(d.spaceM),
              border: InputBorder.none,
            ),
          ),

          // Bottom bar of card
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: d.spaceM,
              vertical: d.spaceS,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.divider),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_textCtrl.text.length}/200',
                  style: TextStyle(
                    color: AppColors.textHint,
                    fontSize: d.fontXS,
                  ),
                ),
                Row(
                  children: [
                    // Mic icon
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.bgSurface,
                          borderRadius: BorderRadius.circular(d.radiusS),
                        ),
                        child: Icon(
                          Icons.mic_none_rounded,
                          color: AppColors.primary,
                          size: d.iconS,
                        ),
                      ),
                    ),
                    SizedBox(width: d.spaceS),
                    // Copy icon
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.bgSurface,
                          borderRadius: BorderRadius.circular(d.radiusS),
                        ),
                        child: Icon(
                          Icons.copy_rounded,
                          color: AppColors.textHint,
                          size: d.iconS,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Result label ─────────────────────────────────────────

  Widget _buildResultLabel(AppDimensions d) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: d.spaceS),
        Text(
          'نتيجة الترجمة',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: d.fontL,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  // ── Video card ───────────────────────────────────────────

  Widget _buildVideoCard(AppDimensions d) {
    final cardH = d.screenW * 0.55;
    return Container(
      width: double.infinity,
      height: cardH,
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(color: AppColors.divider),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(d.radiusL),
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.08),
                  const Color(0xFF0099FF).withOpacity(0.06),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),

          // Avatar placeholder
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: cardH * 0.55,
                height: cardH * 0.55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bgSurface,
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.sign_language_rounded,
                  color: AppColors.primary.withOpacity(0.5),
                  size: cardH * 0.22,
                ),
              ),
            ],
          ),

          // Play button
          AnimatedBuilder(
            animation: _pulseCtrl,
            builder: (_, __) => GestureDetector(
              onTap: _onPlay,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: AppColors.primaryGradient,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(
                          0.4 + 0.3 * _pulseCtrl.value),
                      blurRadius: 14 + 6 * _pulseCtrl.value,
                      spreadRadius: 1 + 2 * _pulseCtrl.value,
                    ),
                  ],
                ),
                child: Icon(
                  _isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),

          // Speed control
          Positioned(
            bottom: d.spaceM,
            left: d.spaceM,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: d.spaceS,
                  vertical: d.spaceXS,
                ),
                decoration: BoxDecoration(
                  color: AppColors.bgDark.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(d.radiusXL),
                  border: Border.all(
                      color: AppColors.primary.withOpacity(0.4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.speed_rounded,
                        color: AppColors.primary, size: 14),
                    SizedBox(width: d.spaceXS),
                    Text(
                      '1x',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: d.fontXS,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Repeat button
          Positioned(
            bottom: d.spaceM,
            right: d.spaceM,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.bgDark.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(d.radiusS),
                  border: Border.all(
                      color: AppColors.divider),
                ),
                child: Icon(
                  Icons.replay_rounded,
                  color: AppColors.textSecondary,
                  size: d.iconS,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}