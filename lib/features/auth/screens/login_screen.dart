import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_app/common_widgets/custom_button.dart';
import 'package:frontend_app/common_widgets/custom_popup.dart';
import 'package:frontend_app/common_widgets/custom_text.dart';
import 'package:frontend_app/common_widgets/custom_text_field.dart';
import 'package:frontend_app/core/constants/app_assets.dart';
import 'package:frontend_app/core/constants/app_colors.dart';
import 'package:frontend_app/core/constants/app_spacing.dart';
import 'package:frontend_app/core/utils/custom_navigator.dart';
import 'package:frontend_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:frontend_app/layout/auth/auth_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailError;
  String? passwordError;
  bool isLoading = false;
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();

    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      isButtonDisabled =
          emailController.text.isEmpty || passwordController.text.isEmpty;
    });
  }

  void handleLogin() {
    setState(() {
      emailError = emailController.text.isEmpty ? "Email required" : null;
      passwordError =
          passwordController.text.isEmpty ? "Password required" : null;
    });

    if (emailError == null && passwordError == null) {
      setState(() => isLoading = true);

      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        setState(() => isLoading = false);

        CustomNavigator.replace(context, const DashboardScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AuthLayout(
      title: "Login",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const CustomText(
              text: "Welcome Back 👋",
              size: CustomTextSize.xxl,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            AppSpacing.vxs,

            const CustomText(
              text: "Hello there, sign in to continue",
              size: CustomTextSize.sm,
              color: CustomTextColor.textSecondary,
              textAlign: TextAlign.center,
            ),

            AppSpacing.vlg,
            Center(
              child: Image.asset(
                loginImage2,
                fit: BoxFit.contain,
                width: 200.w,
                height: 200.w,
              ),
            ),

            AppSpacing.vlg,
            CustomTextField(
              hintText: "Email",
              controller: emailController,
              prefixIcon: Icons.email,
              errorText: emailError,
            ),
            AppSpacing.vmd,

            CustomTextField(
              hintText: "Password",
              controller: passwordController,
              prefixIcon: Icons.lock,
              errorText: passwordError,
              variant: TextFieldVariant.password,
            ),

            AppSpacing.vsm,

            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  CustomPopup.show(
                    context,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Select Password Reset Method",
                                size: CustomTextSize.md,
                                fontWeight: FontWeight.bold,
                              ),
                              AppSpacing.vxs,
                              const CustomText(
                                text:
                                    "Choose how you want to reset your password. You can do it yourself or ask an admin to help.",
                                size: CustomTextSize.sm,
                                color: CustomTextColor.textSecondary,
                              ),
                            ],
                          ),
                        ),
                        AppSpacing.vmd,
                        CustomButton(
                          label: "Reset Myself",
                          variant: ButtonVariant.primary,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          textStyle: const TextStyle(color: Colors.white),
                        ),

                        const SizedBox(height: 8),
                        CustomButton(
                          label: "You want to change by Admin?",
                          variant: ButtonVariant.text,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          textStyle: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
                child: const CustomText(
                  text: "Forgot your password ?",
                  size: CustomTextSize.sm,
                  color: CustomTextColor.textSecondary,
                ),
              ),
            ),

            AppSpacing.vmd,
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child:
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                        disabled: isButtonDisabled,
                        label: "Sign in",
                        textStyle: TextStyle(
                          color:
                              !isButtonDisabled && isDark
                                  ? AppColors.darkText
                                  : AppColors.darkText,
                        ),
                        variant: ButtonVariant.primary,
                        onPressed: handleLogin,
                      ),
            ),

            AppSpacing.vmd,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: "Don’t have an account? ",
                  size: CustomTextSize.sm,
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Navigate to Sign Up")),
                    );
                  },
                  child: const CustomText(
                    text: "Sign Up",
                    size: CustomTextSize.sm,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
