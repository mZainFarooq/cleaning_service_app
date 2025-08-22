import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend_app/common_widgets/custom_button.dart';
import 'package:frontend_app/common_widgets/custom_text.dart';
import 'package:frontend_app/core/constants/app_colors.dart';
import 'package:frontend_app/core/constants/app_spacing.dart';
import 'package:frontend_app/layout/main/main_layout.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  final String employeeName;
  const DashboardScreen({super.key, required this.employeeName});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> hotels = [
    {'name': 'Grand Palace Hotel', 'roomsToClean': 12},
    {'name': 'Ocean View Resort', 'roomsToClean': 8},
    {'name': 'Mountain Inn', 'roomsToClean': 5},
    {'name': 'Sunrise Hotel', 'roomsToClean': 7},
    {'name': 'Lakeside Resort', 'roomsToClean': 10},
    {'name': 'Royal Palace', 'roomsToClean': 4},
  ];

  String getFormattedDate() {
    return DateFormat('EEEE, MMM d, yyyy').format(DateTime.now());
  }

  void markHotelAsCleaned(int index) {
    setState(() {
      hotels.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    return MainLayout(
      title: "Dashboard",
      currentIndex: 0,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Hello, ${widget.employeeName} 👋",
            size: CustomTextSize.x2l,
            fontWeight: FontWeight.w600,
            color: CustomTextColor.text,
          ),
          AppSpacing.vxs,
          CustomText(
            text: getFormattedDate(),
            size: CustomTextSize.base,
            color: CustomTextColor.textSecondary,
          ),
          AppSpacing.vlg,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Assigned Hotels",
                size: CustomTextSize.xl,
                color: CustomTextColor.text,
              ),
              CustomButton(
                label: "Check In",
                textStyle: const TextStyle(color: Colors.white),
                variant: ButtonVariant.primary,
                onPressed: () {},
              ),
            ],
          ),

          AppSpacing.vsm,
          Expanded(
            child:
                hotels.isEmpty
                    ? Center(
                      child: CustomText(
                        text: 'No hotels assigned!',
                        size: CustomTextSize.md,
                        color: CustomTextColor.textSecondary,
                      ),
                    )
                    : GridView.builder(
                      itemCount: hotels.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemBuilder: (context, index) {
                        final hotel = hotels[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.hotel, size: 40.sp, color: primary),
                                AppSpacing.vmd,
                                CustomText(
                                  text: hotel['name'],
                                  size: CustomTextSize.md,
                                  fontWeight: FontWeight.w600,
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: primary.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.cleaning_services,
                                        size: 16,
                                        color: primary,
                                      ),
                                      AppSpacing.hsm,
                                      CustomText(
                                        text: '${hotel['roomsToClean']} rooms',
                                        size: CustomTextSize.sm,
                                        fontWeight: FontWeight.w600,
                                        color: CustomTextColor.primary,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
