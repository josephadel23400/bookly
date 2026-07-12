import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';
import '../resources/styles_manager.dart';


class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    return GestureDetector(
      onTap: isDisabled ? null : onPressed,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: isDisabled && !isLoading ? 0.5 : 1,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
            color: backgroundColor ?? ColorsManager.buttonOrangeColor,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
              height: 20.h,
              width: 20.h,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(
                  textColor ?? ColorsManager.darkOrangeColor,
                ),
              ),
            )
                : Text(
              label,
              style: TextStylesManager.displaySmall(
                context,fontWeight: FontWeight.w500,
                color: textColor ?? ColorsManager.darkOrangeColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
