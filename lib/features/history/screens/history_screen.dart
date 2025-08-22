import 'package:flutter/material.dart';
import 'package:frontend_app/common_widgets/custom_text.dart';
import 'package:frontend_app/core/constants/app_colors.dart';
import 'package:frontend_app/core/constants/app_spacing.dart';
import 'package:frontend_app/layout/main/main_layout.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    return MainLayout(
      title: "History",
      currentIndex: 1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Cleaning History",
            size: CustomTextSize.xxl,
            fontWeight: FontWeight.w600,
            color: CustomTextColor.text,
          ),
          AppSpacing.vmd,
          Expanded(
            child: ListView.builder(
              itemCount: 5, // dummy data
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.hotel, color: primary),
                    title: CustomText(
                      text: "Hotel Paradise ${index + 1}",
                      size: CustomTextSize.lg, // thoda prominent
                      fontWeight: FontWeight.w600,
                    ),
                    subtitle: CustomText(
                      text: "Cleaned 10 rooms • 20 Aug 2025",
                      size: CustomTextSize.sm, // chhota secondary text
                      color: CustomTextColor.textSecondary,
                    ),
                    trailing: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
