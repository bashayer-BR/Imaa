// ============================================================
//  main.dart  –  SignTranslate AI  –  App Entry Point
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imaa/core/app_routes.dart';
import 'package:imaa/core/theme/theme.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Transparent status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xFF0A0F1E),
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  runApp(const SignTranslateApp());
}

class SignTranslateApp extends StatelessWidget {
  const SignTranslateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignTranslate AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,

      // Responsive builder – makes content adapt to any screen size
      builder: (context, child) {
        // Clamp text scaling so large-font devices don't break layout
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(
              MediaQuery.of(context).textScaleFactor.clamp(0.85, 1.15),
            ),
          ),
          child: child!,
        );
      },

      initialRoute: AppRoutes.welcome,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
