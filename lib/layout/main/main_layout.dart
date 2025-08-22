import 'package:flutter/material.dart';
import 'package:frontend_app/core/routes/app_routes_names.dart';
import '../../common_widgets/custom_app_bar.dart';

class MainLayout extends StatefulWidget {
  final String title;
  final Widget body;
  final int currentIndex;
  final bool showBottomNav;
  final bool isBackArrow;

  const MainLayout({
    super.key,
    required this.title,
    required this.body,
    this.currentIndex = 0,
    this.showBottomNav = true,
    this.isBackArrow = false,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  void _onTabChanged(int index) {
    setState(() => _currentIndex = index);

    String routeName;
    switch (index) {
      case 0:
        routeName = AppRouteNames.dashboard;
        break;
      case 1:
        routeName = AppRouteNames.history;
        break;
      case 2:
        routeName = AppRouteNames.settings;
        break;
      default:
        routeName = AppRouteNames.dashboard;
    }

    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        isBackArrow: widget.isBackArrow,
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: widget.body),
      bottomNavigationBar:
          widget.showBottomNav
              ? BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: _onTabChanged,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              )
              : null,
    );
  }
}
