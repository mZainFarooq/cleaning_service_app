import 'package:flutter/material.dart';
import 'package:frontend_app/common_widgets/custom_text.dart';

enum TextFieldVariant { text, password }

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final String? errorText;
  final TextEditingController controller;
  final TextFieldVariant variant;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.errorText,
    this.variant = TextFieldVariant.text,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          obscureText: widget.variant == TextFieldVariant.password && _obscure,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon:
                widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            suffixIcon:
                widget.variant == TextFieldVariant.password
                    ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    )
                    : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        if (widget.errorText != null && widget.errorText!.isNotEmpty) ...[
          const SizedBox(height: 4),
          CustomText(text: widget.errorText!, size: CustomTextSize.xs),
        ],
      ],
    );
  }
}
