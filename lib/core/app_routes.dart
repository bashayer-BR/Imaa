// ============================================================
//  app_routes.dart  –  SignTranslate AI  –  Route Management
// ============================================================

import 'package:flutter/material.dart';
import 'package:imaa/screens/camera_screen.dart';
import 'package:imaa/screens/challenges_screen.dart';
import 'package:imaa/screens/dictionary_screen.dart';
import 'package:imaa/screens/explore_screen.dart';
import 'package:imaa/screens/learn_screen.dart';
import 'package:imaa/screens/profile_screen.dart';
import 'package:imaa/screens/settings_screen.dart';
import 'package:imaa/screens/translate_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/home_screen.dart';

/// All named routes in the app
class AppRoutes {
  AppRoutes._();

  // ── Route Names ───────────────────────────────────────────
  static const String welcome  = '/';
  static const String home     = '/home';
  static const String profile     = '/profile';
  static const String dictionary     = '/dictionary';
  static const String translate     = '/translate';
  static const String challenges     = '/challenges';
  static const String learn     = '/learn';
  static const String explore     = '/explore';
  static const String settings     = '/settings';
  static const String camera     = '/camera';


  // ── Route Map ─────────────────────────────────────────────
  static Map<String, WidgetBuilder> get routes => {
    welcome       : (_) => const WelcomeScreen(),
    home          : (_) => const HomeScreen(),
    profile       : (_) => const ProfileScreen(),
    dictionary    : (_) => const DictionaryScreen(),
    translate     : (_) => const TranslateScreen(),
    challenges    : (_) => const ChallengesScreen(),
    learn         : (_) => const LearnScreen(),
    explore         : (_) => const ExploreScreen(),
    settings         : (_) => const SettingsScreen(),
    camera         : (_) => const CameraScreen(),
    

  };

  // ── Navigation Helpers ────────────────────────────────────

  /// Push a named route
  static Future<T?> pushNamed<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed<T>(context, routeName, arguments: arguments);
  }

  /// Replace current route
  static Future<T?> pushReplacementNamed<T, TO>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed<T, TO>(
      context,
      routeName,
      arguments: arguments,
    );
  }

  /// Clear stack and push
  static Future<T?> pushNamedAndRemoveUntil<T>(
    BuildContext context,
    String routeName,
  ) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      context,
      routeName,
      (_) => false,
    );
  }

  /// Pop current route
  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.pop<T>(context, result);
  }

  /// Generate route with custom transitions
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder == null) {
      return _errorRoute(settings.name ?? 'unknown');
    }
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, _) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 350),
    );
  }

  static Route<dynamic> _errorRoute(String name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        backgroundColor: const Color(0xFF0A0F1E),
        body: Center(
          child: Text(
            'Route not found: $name',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
