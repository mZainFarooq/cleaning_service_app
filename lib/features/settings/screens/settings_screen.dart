import 'package:flutter/material.dart';
import 'package:frontend_app/common_widgets/custom_text.dart';
import 'package:frontend_app/core/constants/app_spacing.dart';
import 'package:frontend_app/common_widgets/custom_button.dart';
import 'package:frontend_app/layout/main/main_layout.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Settings",
      currentIndex: 2,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Account",
            size: CustomTextSize.x2l,
            fontWeight: FontWeight.w600,
            color: CustomTextColor.text,
          ),
          AppSpacing.vmd,
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const CustomText(
              text: "Profile",
              size: CustomTextSize.base,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const CustomText(
              text: "Notifications",
              size: CustomTextSize.base,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const CustomText(
              text: "Change Password",
              size: CustomTextSize.base,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),

          AppSpacing.vlg,

          // Logout Button
          Center(
            child: CustomButton(
              label: "Logout",
              onPressed: () {
                // logout logic
              },
            ),
          ),
        ],
      ),
    );
  }
}
