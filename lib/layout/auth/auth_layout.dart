import 'package:flutter/material.dart';
import '../../common_widgets/custom_app_bar.dart';

class AuthLayout extends StatelessWidget {
  final Widget body;
  final String title;
  final bool isBackArrow;
  final VoidCallback? onRightIconTap;

  const AuthLayout({
    super.key,
    required this.body,
    required this.title,
    this.isBackArrow = false,
    this.onRightIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title, isBackArrow: isBackArrow),
      body: Padding(padding: const EdgeInsets.all(16.0), child: body),
    );
  }
}
