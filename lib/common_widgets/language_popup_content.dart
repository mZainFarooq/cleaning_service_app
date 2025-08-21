import 'package:flutter/material.dart';
import 'package:frontend_app/common_widgets/custom_button.dart';
import 'package:frontend_app/common_widgets/custom_text.dart';
import 'package:frontend_app/core/constants/app_colors.dart';
import 'package:frontend_app/core/constants/app_spacing.dart';

class LanguagePopupWidget extends StatefulWidget {
  final List<Map<String, String>> languages;
  final String selectedLanguage;
  final ValueChanged<String> onSelected;

  const LanguagePopupWidget({
    super.key,
    required this.languages,
    required this.selectedLanguage,
    required this.onSelected,
  });

  @override
  State<LanguagePopupWidget> createState() => _LanguagePopupWidgetState();
}

class _LanguagePopupWidgetState extends State<LanguagePopupWidget> {
  late String currentSelected;

  @override
  void initState() {
    super.initState();
    currentSelected = widget.selectedLanguage;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final selectedColor =
        isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final notSelectedColor =
        isDark ? AppColors.darkBackground : AppColors.lightBackground;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: CustomText(
            'Select Language',
            variant: TextVariant.heading,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: widget.languages.length,
            itemBuilder: (context, index) {
              final lang = widget.languages[index];
              final isSelected = lang['name'] == currentSelected;

              return GestureDetector(
                onTap: () {
                  setState(() => currentSelected = lang['name']!);
                },
                child: Container(
                  color: isSelected ? selectedColor : notSelectedColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      CustomText(lang['flag']!, variant: TextVariant.body),
                      const SizedBox(width: 12),
                      CustomText(
                        lang['name']!,
                        variant: TextVariant.body,
                        style: TextStyle(
                          color: isSelected ? Colors.white : null,
                        ),
                      ),

                      if (isSelected) const Spacer(),
                      if (isSelected)
                        Icon(Icons.check, color: AppColors.lightBackground),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Buttons
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  label: "Cancel",
                  variant: ButtonVariant.text,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              AppSpacing.hmd,
              Expanded(
                child: CustomButton(
                  label: "Select",
                  variant: ButtonVariant.primary,
                  textStyle: const TextStyle(color: Colors.white),

                  onPressed: () {
                    widget.onSelected(currentSelected);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
