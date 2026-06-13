import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/services/translate_service.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isProcessing = false;
  String _result     = '';
  double _confidence = 0;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    _controller  = CameraController(
      cameras.first,
      ResolutionPreset.medium,
    );
    await _controller!.initialize();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _captureAndTranslate() async {
    if (_isProcessing || _controller == null) return;

    setState(() => _isProcessing = true);

    try {
      // التقط صورة
      final image = await _controller!.takePicture();
      final file  = File(image.path);

      // أرسلها للـ API
      final result = await TranslateService.translateSign(file);

      if (result.containsKey('sign')) {
        setState(() {
          _result     = result['sign'];
          _confidence = result['confidence'];
        });
      } else {
        setState(() => _result = result['error'] ?? 'خطأ');
      }
    } catch (e) {
      setState(() => _result = 'خطأ في الاتصال');
    }

    setState(() => _isProcessing = false);
  }

  @override
  Widget build(BuildContext context) {
    final d = AppDim.of(context);

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              // ── Header ───────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: d.hPad,
                  vertical: d.spaceM,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(width: d.spaceM),
                    Text(
                      'ترجمة فورية',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: d.fontXL,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),

              // ── Camera preview ───────────────────
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: d.hPad),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(d.radiusL),
                    child: _controller != null &&
                            _controller!.value.isInitialized
                        ? CameraPreview(_controller!)
                        : const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                  ),
                ),
              ),

              SizedBox(height: d.spaceL),

              // ── Result ───────────────────────────
              if (_result.isNotEmpty)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: d.hPad),
                  padding: EdgeInsets.all(d.spaceM),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withOpacity(0.15),
                        const Color(0xFF0099FF).withOpacity(0.08),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(d.radiusL),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _result,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: d.fontXXL,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(width: d.spaceM),
                      Text(
                        '${_confidence.toStringAsFixed(0)}%',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: d.fontL,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

              SizedBox(height: d.spaceL),

              // ── Capture button ───────────────────
              GestureDetector(
                onTap: _captureAndTranslate,
                child: Container(
                  width: 72,
                  height: 72,
                  margin: EdgeInsets.only(bottom: d.spaceXL),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: AppColors.primaryGradient,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 16,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: _isProcessing
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        )
                      : const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}