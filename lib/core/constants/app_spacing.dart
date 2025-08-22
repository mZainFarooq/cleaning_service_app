import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  // 🔹 Base values (consistent spacing scale)
  static const double xs = 4.0; // Very small → Micro spacing
  static const double sm = 8.0; // Small → Compact spacing
  static const double md = 16.0; // Medium → Default spacing (most used)
  static const double lg = 24.0; // Large → Section spacing
  static const double xl = 32.0; // Extra Large → Page padding
  static const double xxl = 40.0; // Very Large → Full layout separation

  // 🔹 Vertical Spacing Widgets (responsive height)
  /// Use between very tight vertical elements
  /// Example: small icon under text, rating stars row under a title
  static SizedBox get vxs => SizedBox(height: xs.h);

  /// Use between labels & form fields, or text and buttons
  /// Example: "Email Label" → (vsm) → TextField
  static SizedBox get vsm => SizedBox(height: sm.h);

  /// Use between sections of content (most common vertical gap)
  /// Example: Card title → (vmd) → Card body
  static SizedBox get vmd => SizedBox(height: md.h);

  /// Use between large groups (like multiple form sections)
  /// Example: Personal Info section → (vlg) → Address section
  static SizedBox get vlg => SizedBox(height: lg.h);

  /// Use for screen-level padding top/bottom or major layout blocks
  /// Example: AppBar bottom → (vxl) → Page content start
  static SizedBox get vxl => SizedBox(height: xl.h);

  /// Use for very big gaps / full separation
  /// Example: Hero banner → (vxxl) → Main content
  static SizedBox get vxxl => SizedBox(height: xxl.h);

  // 🔹 Horizontal Spacing Widgets (responsive width)
  /// Very tight horizontal spacing
  /// Example: icon → (hxs) → text in a Row
  static SizedBox get hxs => SizedBox(width: xs.w);

  /// Small gap in horizontal layouts
  /// Example: two buttons side by side → (hsm)
  static SizedBox get hsm => SizedBox(width: sm.w);

  /// Default spacing in horizontal layouts
  /// Example: card thumbnail → (hmd) → card content
  static SizedBox get hmd => SizedBox(width: md.w);

  /// Large horizontal spacing for grouping
  /// Example: filter chips row → (hlg) → next group
  static SizedBox get hlg => SizedBox(width: lg.w);

  /// For big row layouts (screen side paddings)
  /// Example: Page content padding → EdgeInsets.symmetric(horizontal: AppSpacing.xl)
  static SizedBox get hxl => SizedBox(width: xl.w);

  /// Very large spacing (rare horizontal use)
  /// Example: Drawer panel → (hxxl) → Main content
  static SizedBox get hxxl => SizedBox(width: xxl.w);
}
