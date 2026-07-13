import 'package:bookly/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.keyboardType,
    this.maxLines = 1,
    this.enabled = true,
    this.onChanged,
    this.suffixIcon,
    this.controller,
    this.obscureText=false,
  });
  final String label;
  final String? hint;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool enabled;
  final bool obscureText;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: ColorsManager.grayTextColor,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.textFieldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorsManager.darkGrayColor, width: 0.5),
          ),
          child: TextFormField(
            keyboardType: keyboardType,
            maxLines: maxLines,
            enabled: enabled,
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,

            style: TextStyle(
              color: enabled
                  ? ColorsManager.whiteColor
                  : ColorsManager.grayTextColor.withValues(alpha: .5),
              fontSize: 15,
            ),

            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: ColorsManager.grayTextColor,
                fontSize: 15,
              ),
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
