import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 18.w,
        height: 18.w,
        decoration: BoxDecoration(
          color: value ? ColorsManager.buttonOrangeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: value
                ? ColorsManager.buttonOrangeColor
                : ColorsManager.darkGrayColor,
            width: 1.2,
          ),
        ),
        child: value
            ? Icon(
                Icons.check,
                size: 13.sp,
                color: ColorsManager.darkOrangeColor,
              )
            : null,
      ),
    );
  }
}
