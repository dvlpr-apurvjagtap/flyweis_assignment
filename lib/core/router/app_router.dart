import 'package:flutter/material.dart';
import '../../views/splash/splash_screen.dart';
import '../../views/onboarding/onboarding_screen.dart';
import '../../views/auth/login_screen.dart';
import '../../views/auth/signup_screen.dart';
import '../../views/home/home_screen.dart';
import '../../views/vendor/vendor_detail_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String vendorDetail = '/vendor-detail';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    onboarding: (context) => const OnboardingScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    home: (context) => const HomeScreen(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case vendorDetail:
        final args = settings.arguments as Map<String, dynamic>?;
        final vendorId = args?['vendorId'] as String? ?? '';
        return MaterialPageRoute(
          builder: (_) => VendorDetailScreen(vendorId: vendorId),
          settings: settings,
        );
      default:
        return null;
    }
  }

  static void navigateTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void navigateToReplacement(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void navigateToAndClear(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static void goBackToFirst(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  static bool isValidRoute(String routeName) {
    return routes.containsKey(routeName) || routeName == vendorDetail;
  }

  static String? getRouteName(Route<dynamic> route) {
    return route.settings.name;
  }
}
