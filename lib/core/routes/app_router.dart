import 'package:flutter/material.dart';
import 'package:frontend_app/features/auth/screens/login_screen.dart';
import 'package:frontend_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:frontend_app/features/history/screens/history_screen.dart';
import 'package:frontend_app/features/settings/screens/settings_screen.dart';
import '../routes/app_routes_names.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    AppRouteNames.login: (context) => LoginScreen(),
    AppRouteNames.dashboard:
        (context) => const DashboardScreen(employeeName: "Zain"),
    AppRouteNames.history: (context) => const HistoryScreen(),
    AppRouteNames.settings: (context) => const SettingsScreen(),
    // AppRouteNames.hotels: (context) => const HotelsScreen(),
    // AppRouteNames.splash: (context) => SplashScreen(),
    // AppRouteNames.profile: (context) => const ProfileScreen(),
    // AppRouteNames.notification: (context) => NotificationsScreen(),
  };
}
