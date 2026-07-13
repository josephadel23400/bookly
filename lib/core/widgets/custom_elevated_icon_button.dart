import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/colors_manager.dart';
import '../resources/styles_manager.dart';

class CustomElevatedIconButton extends StatelessWidget {
  const CustomElevatedIconButton({
    super.key,
    required this.image,
    this.onPressed,
    required this.imageSize,
    this.isLoading = false,
    this.backgroundColor,
    this.iconColor,
  });

  final String image;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double imageSize;
  final Color? backgroundColor;
  final Color? iconColor;

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
            border: Border.all(color: ColorsManager.darkGrayColor),
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
                        iconColor ?? ColorsManager.darkOrangeColor,
                      ),
                    ),
                  )
                : Image.asset(
                    fit: BoxFit.cover,
                    width: imageSize,
                    height: imageSize,
                    image,
                    color: iconColor ?? ColorsManager.darkOrangeColor,
                  ),
          ),
        ),
      ),
    );
  }
}
