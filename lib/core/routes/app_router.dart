import 'package:flutter/material.dart';
import 'package:frontend_app/features/auth/screens/login_screen.dart';
import '../routes/app_routes_names.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    AppRouteNames.login: (context) => LoginScreen(),
    // AppRouteNames.splash: (context) => SplashScreen(),
    // AppRouteNames.home: (context) => const HomeScreen(),
    // AppRouteNames.history: (context) => const HistoryScreen(),
    // AppRouteNames.hotels: (context) => const HotelsScreen(),
    // AppRouteNames.profile: (context) => const ProfileScreen(),
    // AppRouteNames.notification: (context) => NotificationsScreen(),
  };
}
