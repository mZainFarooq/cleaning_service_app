import 'package:flutter/material.dart';
import 'package:frontend_app/common_widgets/custom_popup.dart';
import 'package:frontend_app/common_widgets/custom_text.dart';
import 'package:frontend_app/common_widgets/language_popup_content.dart';
import 'package:frontend_app/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackArrow;
  final String title;

  const CustomAppBar({
    super.key,
    this.isBackArrow = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading:
          isBackArrow
              ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
              : null,
      title: CustomText(
        text: title,
        size: CustomTextSize.xl,
        fontWeight: FontWeight.w600,
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            CustomPopup.show(
              context,
              content: LanguagePopupWidget(
                languages: [
                  {'name': 'English', 'flag': '🇬🇧'},
                  {'name': 'Urdu', 'flag': '🇵🇰'},
                  {'name': 'Spanish', 'flag': '🇪🇸'},
                  {'name': 'French', 'flag': '🇫🇷'},
                  {'name': 'German', 'flag': '🇩🇪'},
                  {'name': 'Chinese', 'flag': '🇨🇳'},
                ],
                selectedLanguage: 'English',
                onSelected: (lang) {
                  print('Selected Language: $lang');
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.language,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),

        // 🌙/☀️ Theme toggle
        IconButton(
          icon: Icon(
            themeProvider.themeMode == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.light_mode,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            final isDark = themeProvider.themeMode != ThemeMode.dark;
            themeProvider.toggleTheme(isDark);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
