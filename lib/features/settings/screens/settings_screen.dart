import 'package:flutter/material.dart';
import 'package:frontend_app/common_widgets/custom_text.dart';
import 'package:frontend_app/core/constants/app_spacing.dart';
import 'package:frontend_app/core/utils/custom_navigator.dart';
import 'package:frontend_app/features/auth/screens/login_screen.dart';
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
            size: CustomTextSize.xxl,
            fontWeight: FontWeight.w600,
            color: CustomTextColor.text,
          ),
          AppSpacing.vmd,
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const CustomText(
              text: "Profile",
              size: CustomTextSize.md,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const CustomText(
              text: "Notifications",
              size: CustomTextSize.md,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.sick, // sick leave ka suitable icon
            ),
            title: const CustomText(
              text: "Sick Leave",
              size: CustomTextSize.md,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Yahan Sick Leave ka page open karwana h
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SickLeavePage()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const CustomText(
              text: "Change Password",
              size: CustomTextSize.md,
              fontWeight: FontWeight.w500,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const CustomText(
              text: "Logout",
              size: CustomTextSize.md,
              fontWeight: FontWeight.w500,
            ),
            onTap: () {
              CustomNavigator.push(context, const LoginScreen());
            },
          ),

          AppSpacing.vlg,
        ],
      ),
    );
  }
}
