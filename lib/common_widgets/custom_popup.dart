import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class CustomPopup {
  static Future<void> show(
    BuildContext context, {
    required Widget content,
    bool barrierDismissible = true,
  }) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return Dialog(
          backgroundColor:
              isDark ? AppColors.darkSurface : AppColors.lightSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(padding: const EdgeInsets.all(8), child: content),
        );
      },
    );
  }
}
