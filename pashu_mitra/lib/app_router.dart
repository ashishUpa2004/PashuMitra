import 'package:flutter/material.dart';

// Import all your pages
import 'presentation/pages/auth/login_page.dart';
import 'presentation/pages/auth/signup_page.dart';
import 'presentation/pages/farm/farm_profile_page.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/risk/risk_assessment_page.dart';
import 'presentation/pages/training/training_page.dart';
import 'presentation/pages/reports/reports_page.dart';
import 'presentation/pages/compliance/compliance_page.dart';
import 'core/constants/app_constants.dart';

/// 🧭 Centralized route management for the PashuMitra app
/// Uses Navigator 2.0 style named routes for easy navigation and maintenance

class AppRouter {
  // Route generator for MaterialApp (onGenerateRoute)
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.routeLogin:
        return _fadeRoute(const LoginPage(), settings);
      case AppConstants.routeSignup:
        return _fadeRoute(const SignupPage(), settings);
      case AppConstants.routeHome:
        return _fadeRoute(const HomePage(), settings);
      case AppConstants.routeFarmProfile:
        return _slideRoute(const FarmProfilePage(), settings);
      case AppConstants.routeRiskAssessment:
        return _slideRoute(const RiskAssessmentPage(), settings);
      case AppConstants.routeTraining:
        return _slideRoute(const TrainingPage(), settings);
      case AppConstants.routeReports:
        return _slideRoute(const ReportsPage(), settings);
      case AppConstants.routeCompliance:
        return _slideRoute(const CompliancePage(), settings);

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Page not found')),
          ),
        );
    }
  }

  /// 💨 Simple fade transition
  static PageRouteBuilder _fadeRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 250),
    );
  }

  /// ➡️ Slide transition (from right)
  static PageRouteBuilder _slideRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
