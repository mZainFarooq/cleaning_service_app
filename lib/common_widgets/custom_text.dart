import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';

enum CustomTextSize { x2l, xl, lg, md, base, sm, xs }

enum CustomTextColor {
  primary,
  secondary,
  text,
  textSecondary,
  btnText,
  error,
  alwaysWhite,
}

class CustomText extends StatelessWidget {
  final String text;
  final CustomTextSize size;
  final CustomTextColor color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? fontFamily;
  final double? fontSize;
  final double? letterSpacing;
  final double? lineHeight;
  final TextStyle? style; // 👈 added

  const CustomText({
    super.key,
    required this.text,
    this.size = CustomTextSize.base,
    this.color = CustomTextColor.text,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontFamily,
    this.fontSize,
    this.letterSpacing,
    this.lineHeight,
    this.style, // 👈 added
  });

  Map<String, dynamic> _getTextStyleDefaults() {
    switch (size) {
      case CustomTextSize.x2l:
        return {"size": 28.0.sp, "spacing": 0.5.sp, "height": 1.3};
      case CustomTextSize.xl:
        return {"size": 22.0.sp, "spacing": 0.4.sp, "height": 1.3};
      case CustomTextSize.lg:
        return {"size": 18.0.sp, "spacing": 0.3.sp, "height": 1.3};
      case CustomTextSize.md:
        return {"size": 16.0.sp, "spacing": 0.2.sp, "height": 1.4};
      case CustomTextSize.base:
        return {"size": 14.0.sp, "spacing": 0.1.sp, "height": 1.4};
      case CustomTextSize.sm:
        return {"size": 12.0.sp, "spacing": 0.0.sp, "height": 1.4};
      case CustomTextSize.xs:
        return {"size": 10.0.sp, "spacing": 0.0.sp, "height": 1.4};
    }
  }

  Color _getColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    switch (color) {
      case CustomTextColor.primary:
        return isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
      case CustomTextColor.secondary:
        return isDark ? AppColors.darkSecondary : AppColors.lightSecondary;
      case CustomTextColor.text:
        return isDark ? AppColors.darkText : AppColors.lightText;
      case CustomTextColor.btnText:
        return Colors.white;
      case CustomTextColor.textSecondary:
        return isDark
            ? AppColors.darkTextSecondary
            : AppColors.lightTextSecondary;
      case CustomTextColor.error:
        return AppColors.error;
      case CustomTextColor.alwaysWhite:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaults = _getTextStyleDefaults();

    final defaultStyle = TextStyle(
      fontSize: fontSize ?? defaults["size"],
      letterSpacing: letterSpacing ?? defaults["spacing"],
      height: lineHeight ?? defaults["height"],
      color: _getColor(context),
      fontWeight: fontWeight,
      fontFamily: fontFamily ?? 'Roboto',
    );

    return Text(
      text,
      style:
          style != null
              ? defaultStyle.merge(style) // 👈 agar style pass kare to override
              : defaultStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
