import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({super.key, required this.isSelected, required this.label});
  final bool isSelected;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.orangeColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isSelected
              ? ColorsManager.whiteColor
              : ColorsManager.didNotReadYetTextColor,
          width: 1.5.w,
        ),
      ),
      child: Text(
        label,
        style: TextStylesManager.displaySmall(
          context,
          size: SizeManager.smallFontSize13,
          fontWeight: FontWeight.w400,
          color: isSelected
              ? ColorsManager.whiteColor
              : ColorsManager.didNotReadYetTextColor,
        ),
      ),
    );
  }
}
