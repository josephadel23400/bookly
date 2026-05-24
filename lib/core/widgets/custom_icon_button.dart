import 'package:bookly/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.size,
    required this.icon,
  });
  final void Function()? onPressed;
  final double size;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: size, color: ColorsManager.whiteColor),
    );
  }
}
