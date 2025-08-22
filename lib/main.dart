import 'package:flutter/material.dart';
import 'package:frontend_app/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './core/theme/app_theme.dart';
import './core/routes/app_router.dart';
import './core/routes/app_routes_names.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ScreenUtilInit(
      designSize: kIsWeb ? const Size(1536, 729) : const Size(360, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, __) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: AppRouteNames.dashboard,
            routes: AppRouter.routes,
          ),
    );
  }
}
