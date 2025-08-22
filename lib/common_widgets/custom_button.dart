import 'package:flutter/material.dart';
import 'package:frontend_app/common_widgets/custom_text.dart';
import '../core/constants/app_colors.dart';

enum ButtonVariant { primary, outline, text }

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final bool disabled;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.disabled = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = disabled || onPressed == null;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryColor =
        isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;

    switch (variant) {
      case ButtonVariant.primary:
        return ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isDisabled ? Colors.grey : primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: CustomText(
            text: label,
            size: CustomTextSize.md,
            style: textStyle?.copyWith(color: textStyle?.color ?? Colors.white),
          ),
        );

      case ButtonVariant.outline:
        return OutlinedButton(
          onPressed: isDisabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: isDisabled ? Colors.grey : primaryColor,
            side: BorderSide(color: isDisabled ? Colors.grey : primaryColor),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: CustomText(
            text: label,
            size: CustomTextSize.md,
            style: textStyle?.copyWith(color: textStyle?.color ?? primaryColor),
          ),
        );

      case ButtonVariant.text:
        return TextButton(
          onPressed: isDisabled ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: isDisabled ? Colors.grey : textColor,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: CustomText(
            text: label,
            size: CustomTextSize.md,
            style: textStyle?.copyWith(color: textStyle?.color ?? textColor),
          ),
        );
    }
  }
}
