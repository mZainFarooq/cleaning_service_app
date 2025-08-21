import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextVariant variant;

  const CustomText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.variant = TextVariant.body,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultColor = isDark ? AppColors.darkText : AppColors.lightText;

    TextStyle baseStyle;

    switch (variant) {
      case TextVariant.heading:
        baseStyle = TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: defaultColor,
        );
        break;
      case TextVariant.date:
        baseStyle = TextStyle(
          fontFamily: 'CourierPrime',
          fontSize: 14,
          color: defaultColor,
        );
        break;
      case TextVariant.body:
        baseStyle = TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          color: defaultColor,
        );
        break;
      case TextVariant.error:
        baseStyle = TextStyle(
          fontFamily: 'Roboto',
          fontSize: 12,
          color: AppColors.error,
          fontWeight: FontWeight.normal,
        );
        break;
    }

    final finalStyle = baseStyle.merge(style ?? const TextStyle());

    return Text(text, textAlign: textAlign, style: finalStyle);
  }
}

enum TextVariant { heading, body, date, error }
